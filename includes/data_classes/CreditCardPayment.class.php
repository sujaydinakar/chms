<?php
	require(__DATAGEN_CLASSES__ . '/CreditCardPaymentGen.class.php');

	/**
	 * The CreditCardPayment class defined here contains any
	 * customized code for the CreditCardPayment class in the
	 * Object Relational Model.  It represents the "credit_card_payment" table 
	 * in the database, and extends from the code generated abstract CreditCardPaymentGen
	 * class, which contains all the basic CRUD-type functionality as well as
	 * basic methods to handle relationships and index-based loading.
	 * 
	 * @package ALCF ChMS
	 * @subpackage DataObjects
	 * 
	 */
	class CreditCardPayment extends CreditCardPaymentGen {
		/**
		 * Default "to string" handler
		 * Allows pages to _p()/echo()/print() this object, and to define the default
		 * way this object would be outputted.
		 *
		 * Can also be called directly via $objCreditCardPayment->__toString().
		 *
		 * @return string a nicely formatted string representation of this object
		 */
		public function __toString() {
			return sprintf('CreditCardPayment Object %s',  $this->intId);
		}

		public function __get($strName) {
			switch ($strName) {
				case 'CreditCardDescription': return CreditCardType::$NameArray[$this->intCreditCardTypeId] . ' x' . $this->strCreditCardLastFour;

				default:
					try {
						return parent::__get($strName);
					} catch (QCallerException $objExc) {
						$objExc->IncrementOffset();
						throw $objExc;
					}
			}
		}
		
		/**
		 * If this is a "Authorized" (but not yet captured) transaction, this will go ahead and capture the funds.
		 * This will THROW if the status is NOT Authorized
		 */
		public function CaptureAuthorization() {
			if ($this->intCreditCardStatusTypeId != CreditCardStatusType::Authorized)
				throw new QCallerException('Cannot capture a non-authorized transaction: CreditCardPaymentId #' . $this->intId);

			$strNvpRequestArray = $this->PaymentGatewayGenerateCapturePayload();
			$strNvpResponseArray = self::PaymentGatewaySubmitRequest($strNvpRequestArray);

			// Analyze the Response, Ensure we are successful
			if (array_key_exists('RESULT', $strNvpResponseArray) &&
				($strNvpResponseArray['RESULT'] == 0)) {
				$this->intCreditCardStatusTypeId = CreditCardStatusType::Captured;
				$this->dttDateCaptured = QDateTime::Now();
				$this->Save();
			} else {
				$this->intCreditCardStatusTypeId = CreditCardStatusType::CaptureFailed;
				$this->Save();
			}
		}

		/**
		 * The following will synchronously perform an "Authorization" for an UNSAVED PaymentObject against
		 * a given Name, Address, Cc Credentials and Amount.  If the authorization succeeds, a valid
		 * CreditCardPayment object is returned.  Otherwise, an error message is presented in String form.
		 * 
		 * The actual "Capture" will be performed asynchronously by a separate cron-based CLI process.
		 * 
		 * @param mixed $objPaymentObject this should be either an OnlineDonation or a SignupPayment object
		 * @param array $arrPaymentObjectSaveChildrenCallback a callback to a method that will perform any children-save to the PaymentObject sent in
		 * @param string $strFirstName
		 * @param string $strLastName
		 * @param Address $objAddress does not have to be linked to an actual db row
		 * @param float $fltAmount
		 * @param string $strCcNumber
		 * @param string $strCcExpiration four digits, MMYY format
		 * @param string $strCcCsc
		 * @param integer $intCreditCardTypeId
		 * @return mixed a CreditCardPayment object if authorization successful, otherwise a string-based message on why it failed
		 */
		public static function PerformAuthorization($objPaymentObject, $arrPaymentObjectSaveChildrenCallback, $strFirstName, $strLastName, Address $objAddress, $fltAmount,
			$strCcNumber, $strCcExpiration, $strCcCsc, $intCreditCardTypeId) {
			// Ensure a "Valid" PaymentObject
			if (!($objPaymentObject instanceof SignupPayment) &&
				!($objPaymentObject instanceof OnlineDonation)) {
				throw new QCallerException('Supplied PaymentObject is not an instance of SignupPayment or OnlineDonation');
			}
			
			if ($objPaymentObject->Id) throw new QCallerException('Supplied PaymentObject has already been saved');
			if ($objPaymentObject->CreditCardPaymentId) throw new QCallerException('Supplied PaymentObject already has a linked CCPayment object');

			CreditCardPayment::GetDatabase()->TransactionBegin();
			try {
				// Save the PaymentObject itself
				$objPaymentObject->Save();

				// Make a call to save children (if applicable)
				call_user_func($arrPaymentObjectSaveChildrenCallback, $objPaymentObject);

				$strClassName = get_class($objPaymentObject);
				switch ($strClassName) {
					case 'SignupPayment':
						$strComment1 = 'Signup Payment ' . $objPaymentObject->Id;
						$strComment2 =
							'SE' . $objPaymentObject->SignupEntry->Id . ' - ' .
							'SF' . $objPaymentObject->SignupEntry->SignupFormId . ' - ' .
							'P' . $objPaymentObject->SignupEntry->PersonId;
						$strInvoiceNumber = 'SP' . $objPaymentObject->Id;
						break;

					case 'OnlineDonation':
						$strComment1 = 'Online Donation ' . $objPaymentObject->Id;
						$strComment2 =
							'P' . $objPaymentObject->PersonId;
						$strInvoiceNumber = 'OD' . $objPaymentObject->Id;
						break;

					default:
						throw new Exception('Unsupported: ' . $strClassName);
				}

				$strNvpRequestArray = self::PaymentGatewayGenerateAuthorizationPayload($strFirstName, $strLastName, $objAddress, $fltAmount, $strCcNumber, $strCcExpiration, $strCcCsc, $strComment1, $strComment2, $strInvoiceNumber);
				$strNvpResponseArray = self::PaymentGatewaySubmitRequest($strNvpRequestArray);

				if (!is_array($strNvpResponseArray)) {
					CreditCardPayment::GetDatabase()->TransactionRollBack();
					return 'Could Not Connect to Payment Gateway';
				}

				// Analyze the ResponseArray
				if (!array_key_exists('RESULT', $strNvpResponseArray)) {
					CreditCardPayment::GetDatabase()->TransactionRollBack();
					return 'Missing Result Code from Payment Gateway';
				}

				if (!array_key_exists('RESPMSG', $strNvpResponseArray)) {
					CreditCardPayment::GetDatabase()->TransactionRollBack();
					return 'Missing Response from Payment Gateway';
				}

				if (!array_key_exists('PNREF', $strNvpResponseArray)) {
					CreditCardPayment::GetDatabase()->TransactionRollBack();
					return 'Missing Reference ID from Payment Gateway';
				}

				// Fill in the blanks
				if (!array_key_exists('CVV2MATCH', $strNvpResponseArray)) $strNvpResponseArray['CVV2MATCH'] = '';
				if (!array_key_exists('AVSADDR', $strNvpResponseArray)) $strNvpResponseArray['AVSADDR'] = '?';
				if (!array_key_exists('AVSZIP', $strNvpResponseArray)) $strNvpResponseArray['AVSZIP'] = '?';
				if (!array_key_exists('IAVS', $strNvpResponseArray)) $strNvpResponseArray['IAVS'] = '?';
				if (!array_key_exists('AUTHCODE', $strNvpResponseArray)) $strNvpResponseArray['AUTHCODE'] = '';

				// If Failure, cleanup and then report
				if ($strNvpResponseArray['RESULT'] != 0) {
					CreditCardPayment::GetDatabase()->TransactionRollBack();
					return sprintf('%s (%s)', $strNvpResponseArray['RESPMSG'], $strNvpResponseArray['RESULT']);
				}

				// If CVV2 Failed, then Report
				if ($strNvpResponseArray['CVV2MATCH'] == 'N') {
					CreditCardPayment::GetDatabase()->TransactionRollBack();

					$strNvpRequestArray = self::PaymentGatewayGenerateVoidPayload($strNvpResponseArray['PNREF']);
					$strNvpResponseArray = self::PaymentGatewaySubmitRequest($strNvpRequestArray);
					return 'The CVV2 code entered is invalid.  Please double check the 3-digit CVV2 code on the back of your card. (' . $strNvpResponseArray['RESULT'] . ')';
				}

				// If we are here, we had a successful authorization!
				$objCreditCardPayment = new CreditCardPayment();
				$objCreditCardPayment->CreditCardStatusTypeId = CreditCardStatusType::Authorized;
				$objCreditCardPayment->CreditCardLastFour = substr($strCcNumber, strlen($strCcNumber) - 4);
				$objCreditCardPayment->CreditCardTypeId = $intCreditCardTypeId;
				$objCreditCardPayment->TransactionCode = $strNvpResponseArray['PNREF'];
				$objCreditCardPayment->AuthorizationCode = $strNvpResponseArray['AUTHCODE'];
				$objCreditCardPayment->AddressMatchCode = $strNvpResponseArray['AVSADDR'] . $strNvpResponseArray['AVSZIP'] . $strNvpResponseArray['IAVS'];
				$objCreditCardPayment->DateAuthorized = QDateTime::Now();
				$objCreditCardPayment->AmountCharged = $fltAmount;
				$objCreditCardPayment->UnlinkedFlag = false;

				// Save, Commit and Return
				$objCreditCardPayment->Save();
				$objPaymentObject->CreditCardPayment = $objCreditCardPayment;
				$objPaymentObject->Save();
				CreditCardPayment::GetDatabase()->TransactionCommit();
			} catch (Exception $objExc) {
				CreditCardPayment::GetDatabase()->TransactionRollBack();
				throw $objExc;
			}

			$objPaymentObject->RefreshDetailsWithCreditCardPayment();
			return $objCreditCardPayment;
		}

		/**
		 * This will submit a NVP Request to paypal and return the repsonse
		 * or NULL if there was a connection error.
		 * 
		 * @param string[] $strNvpRequestArray a structured array containing the NVP Request
		 * @return string[] a structured array based on the NVP Response, or NULL if there was a connection error
		 */
		protected static function PaymentGatewaySubmitRequest($strNvpRequestArray) {
			$strLogFile = 'paypal_' . QDateTime::NowToString('YYYY-MM-DD');
			$strLogHash = substr(md5(microtime()), 0, 8);

			$objCurl = curl_init();
			curl_setopt($objCurl, CURLOPT_URL, PAYPAL_ENDPOINT);
			curl_setopt($objCurl, CURLOPT_VERBOSE, false);

			// Turning off the server and peer verification (TrustManager Concept)
			curl_setopt($objCurl, CURLOPT_SSL_VERIFYPEER, false);
			curl_setopt($objCurl, CURLOPT_SSL_VERIFYHOST, false);

			curl_setopt($objCurl, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($objCurl, CURLOPT_POST, true);

			// Add Credentials to NVP-based Request for submitting to server
			$strNvpRequestArray['PARTNER'] = PAYPAL_PARTNER;
			$strNvpRequestArray['USER'] = PAYPAL_USER;
			$strNvpRequestArray['VENDOR'] = PAYPAL_VENDOR;
			$strNvpRequestArray['PWD'] = PAYPAL_PASSWORD;

			$strNvpRequest = self::FormatNvp($strNvpRequestArray);

			// First, we Sanitize NVP Request for Logging and then log it
			$strNvpRequestToLog = $strNvpRequestArray;
			$strNvpRequestToLog['PARTNER'] = 'xxxxx';
			$strNvpRequestToLog['USER'] = 'xxxxx';
			$strNvpRequestToLog['VENDOR'] = 'xxxxx';
			$strNvpRequestToLog['PWD'] = 'xxxxx';
			if (array_key_exists('ACCT', $strNvpRequestToLog)) {
				$intLength = strlen($strNvpRequestToLog['ACCT']);
				$strNvpRequestToLog['ACCT'] = str_repeat('x', $intLength - 4) . substr($strNvpRequestToLog['ACCT'], $intLength - 4);
			}
			QLog::Log($strLogHash . ' - ' . self::FormatNvp($strNvpRequestToLog), QLogLevel::Normal, $strLogFile);

			// Setting the entire NvpRequest as POST FIELD to curl
			curl_setopt($objCurl, CURLOPT_POSTFIELDS, $strNvpRequest);

			// Getting response from server
			$strResponse = @curl_exec($objCurl);
			curl_close($objCurl);

			if ($strResponse) {
				$arrToReturn = self::DeformatNvp($strResponse);
				QLog::Log($strLogHash . ' - ' . var_export($arrToReturn, true), QLogLevel::Normal, $strLogFile);
				return $arrToReturn;
			} else {
				QLog::Log($strLogHash . ' - ' . 'ERROR', QLogLevel::Normal, $strLogFile);
				return null;
			}
		}

		/**
		 * Generates a "Capture" payload for a succcessful authorization of THIS credit card payment
		 * @return string[]
		 */
		protected function PaymentGatewayGenerateCapturePayload() {
			$strNvpRequestArray = array(
				'TENDER' => 'C',
				'TRXTYPE' => 'D',
				'ORIGID' => $this->strTransactionCode);

			return $strNvpRequestArray;
		}

		/**
		 * This will generate a PayPal NVP payload to "Void" a transaction
		 * Requires the original Transaction ID (known as the PNREF for PayPal)
		 * @param string $strTransactionId the toriginal transaction id (PNREF) of the transaction to void
		 * @return string[]
		 */
		protected static function PaymentGatewayGenerateVoidPayload($strTransactionId) {
			$strNvpRequestArray = array(
				'TENDER' => 'C',
				'TRXTYPE' => 'V',
				'ORIGID' => $strTransactionId);

			return $strNvpRequestArray;
		}

		/**
		 * Given the data provided, create a AuthorizationPayload for PayPal
		 * @param string $strFirstName
		 * @param string $strLastName
		 * @param Address $objAddress does not have to be linked to an actual db row
		 * @param float $fltAmount
		 * @param string $strCcNumber
		 * @param string $strCcExpiration
		 * @param string $strCcCsc
		 * @param string $strComment1
		 * @param string $strComment2
		 * @param string $strInvoiceNumber
		 * @return string
		 */
		protected static function PaymentGatewayGenerateAuthorizationPayload($strFirstName, $strLastName, Address $objAddress, $fltAmount, $strCcNumber, $strCcExpiration, $strCcCsc,
			$strComment1, $strComment2, $strInvoiceNumber) {
			$strNvpRequestArray = array(
				'TENDER' => 'C',
				'TRXTYPE' => 'A',
				'ACCT' => $strCcNumber,
				'EXPDATE' => $strCcExpiration,
				'AMT' => sprintf('%.2f', $fltAmount),
				'COMMENT1' => $strComment1,
				'COMMENT2' => $strComment2,
				'INVNUM' => $strInvoiceNumber,
				'CVV2' => $strCcCsc,
				'FIRSTNAME' => $strFirstName,
				'LASTNAME' => $strLastName,
				'STREET' => $objAddress->Address1,
				'STREET2' => $objAddress->Address2,
				'CITY' => $objAddress->City,
				'STATE'=> $objAddress->State,
				'COUNTRYCODE' => 'US',
				'ZIP' => $objAddress->ZipCode,
				'CURRENCYCODE' => 'USD',
				'SHIPTOFIRSTNAME' => $strFirstName,
				'SHIPTOLASTNAME' => $strLastName,
				'SHIPTOSTREET' => $objAddress->Address1,
				'SHIPTOSTREET2' => $objAddress->Address2,
				'SHIPTOCITY' => $objAddress->City,
				'SHIPTOSTATE'=> $objAddress->State,
				'SHIPTOCOUNTRYCODE' => 'US',
				'SHIPTOZIP' => $objAddress->ZipCode);
			
			return $strNvpRequestArray;
		}

		/**
		 * Converts a Name-Value-Pair string into a structured array
		 * 
		 * @param string $nvpstr
		 * @return array
		 */
		public static function DeformatNvp($nvpstr) {		
			$intial=0;
		 	$nvpArray = array();

			while(strlen($nvpstr)){
				//postion of Key
				$keypos= strpos($nvpstr,'=');
				//position of value
				$valuepos = strpos($nvpstr,'&') ? strpos($nvpstr,'&'): strlen($nvpstr);

				/*getting the Key and Value values and storing in a Associative Array*/
				$keyval=substr($nvpstr,$intial,$keypos);
				$valval=substr($nvpstr,$keypos+1,$valuepos-$keypos-1);
				//decoding the respose
				$nvpArray[urldecode($keyval)] = urldecode( $valval);
				$nvpstr=substr($nvpstr,$valuepos+1,strlen($nvpstr));
		    }

			return $nvpArray;
		}

		/**
		 * Converts a structured array into a Name-Value-Pair string.
		 * @param array $objAssociativeArray
		 * @return string
		 */
		public static function FormatNvp($objAssociativeArray) {
			$strNvpArray = array();
			foreach ($objAssociativeArray as $strName => $strValue) {
				$strNvpArray[] = $strName . '=' . str_replace('=','-', str_replace('&','+', trim($strValue)));
			}

			return implode('&', $strNvpArray);
		}

		// Override or Create New Load/Count methods
		// (For obvious reasons, these methods are commented out...
		// but feel free to use these as a starting point)
/*
		public static function LoadArrayBySample($strParam1, $intParam2, $objOptionalClauses = null) {
			// This will return an array of CreditCardPayment objects
			return CreditCardPayment::QueryArray(
				QQ::AndCondition(
					QQ::Equal(QQN::CreditCardPayment()->Param1, $strParam1),
					QQ::GreaterThan(QQN::CreditCardPayment()->Param2, $intParam2)
				),
				$objOptionalClauses
			);
		}

		public static function LoadBySample($strParam1, $intParam2, $objOptionalClauses = null) {
			// This will return a single CreditCardPayment object
			return CreditCardPayment::QuerySingle(
				QQ::AndCondition(
					QQ::Equal(QQN::CreditCardPayment()->Param1, $strParam1),
					QQ::GreaterThan(QQN::CreditCardPayment()->Param2, $intParam2)
				),
				$objOptionalClauses
			);
		}

		public static function CountBySample($strParam1, $intParam2, $objOptionalClauses = null) {
			// This will return a count of CreditCardPayment objects
			return CreditCardPayment::QueryCount(
				QQ::AndCondition(
					QQ::Equal(QQN::CreditCardPayment()->Param1, $strParam1),
					QQ::Equal(QQN::CreditCardPayment()->Param2, $intParam2)
				),
				$objOptionalClauses
			);
		}

		public static function LoadArrayBySample($strParam1, $intParam2, $objOptionalClauses) {
			// Performing the load manually (instead of using Qcodo Query)

			// Get the Database Object for this Class
			$objDatabase = CreditCardPayment::GetDatabase();

			// Properly Escape All Input Parameters using Database->SqlVariable()
			$strParam1 = $objDatabase->SqlVariable($strParam1);
			$intParam2 = $objDatabase->SqlVariable($intParam2);

			// Setup the SQL Query
			$strQuery = sprintf('
				SELECT
					`credit_card_payment`.*
				FROM
					`credit_card_payment` AS `credit_card_payment`
				WHERE
					param_1 = %s AND
					param_2 < %s',
				$strParam1, $intParam2);

			// Perform the Query and Instantiate the Result
			$objDbResult = $objDatabase->Query($strQuery);
			return CreditCardPayment::InstantiateDbResult($objDbResult);
		}
*/




		// Override or Create New Properties and Variables
		// For performance reasons, these variables and __set and __get override methods
		// are commented out.  But if you wish to implement or override any
		// of the data generated properties, please feel free to uncomment them.
/*
		protected $strSomeNewProperty;

		public function __get($strName) {
			switch ($strName) {
				case 'SomeNewProperty': return $this->strSomeNewProperty;

				default:
					try {
						return parent::__get($strName);
					} catch (QCallerException $objExc) {
						$objExc->IncrementOffset();
						throw $objExc;
					}
			}
		}

		public function __set($strName, $mixValue) {
			switch ($strName) {
				case 'SomeNewProperty':
					try {
						return ($this->strSomeNewProperty = QType::Cast($mixValue, QType::String));
					} catch (QInvalidCastException $objExc) {
						$objExc->IncrementOffset();
						throw $objExc;
					}

				default:
					try {
						return (parent::__set($strName, $mixValue));
					} catch (QCallerException $objExc) {
						$objExc->IncrementOffset();
						throw $objExc;
					}
			}
		}
*/
	}
?>