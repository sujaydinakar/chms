<?php
	require(__DATAGEN_CLASSES__ . '/ClassMeetingGen.class.php');

	/**
	 * The ClassMeeting class defined here contains any
	 * customized code for the ClassMeeting class in the
	 * Object Relational Model.  It represents the "class_meeting" table 
	 * in the database, and extends from the code generated abstract ClassMeetingGen
	 * class, which contains all the basic CRUD-type functionality as well as
	 * basic methods to handle relationships and index-based loading.
	 * 
	 * @package ALCF ChMS
	 * @subpackage DataObjects
	 * 
	 */
	class ClassMeeting extends ClassMeetingGen {
		/**
		 * Default "to string" handler
		 * Allows pages to _p()/echo()/print() this object, and to define the default
		 * way this object would be outputted.
		 *
		 * Can also be called directly via $objClassMeeting->__toString().
		 *
		 * @return string a nicely formatted string representation of this object
		 */
		public function __toString() {
			return sprintf('ClassMeeting Object %s',  $this->intSignupFormId);
		}

		public function __get($strName) {
			switch ($strName) {
				case 'DateRange':
					return sprintf('Takes place from %s to %s', $this->dttDateStart->ToString('MMM D'), $this->dttDateEnd->ToString('MMM D'), $this->MeetsOnInfo);

				case 'MeetsOnInfo':
					if (!is_null($this->intMeetingDay) &&
						!is_null($this->intMeetingStartTime) &&
						!is_null($this->intMeetingEndTime)) {
						$strArray = array(
							0 => 'Sunday',
							1 => 'Monday',
							2 => 'Tuesday',
							3 => 'Wednesday',
							4 => 'Thursday',
							5 => 'Friday',
							6 => 'Saturday',
						);
						$dttStart = new QDateTime();
						$dttEnd = new QDateTime();
						$dttStart->SetTime(floor($this->intMeetingStartTime / 100), $this->intMeetingStartTime % 100, 0);
						$dttEnd->SetTime(floor($this->intMeetingEndTime / 100), $this->intMeetingEndTime % 100, 0);
						return sprintf('%ss, %s to %s', $strArray[$this->intMeetingDay], $dttStart->ToString('h:mmz'), $dttEnd->ToString('h:mmz'));
					} else {
						return 'TBA';
					}

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
		 * Given the start date, end date and meeting day of the week for this class,
		 * this will return the total number of class days.
		 * @return integer
		 */
		public function GetClassMeetingCount() {
			return count($this->GetClassMeetingDays());
		}

		/**
		 * Given the start date, end date and meeting day of the week for this class,
		 * this will return an array of all the meeting days
		 * @return QDateTime[]
		 */
		public function GetClassMeetingDays() {
			// Figure out the first real start date
			$dttStartDate = new QDateTime($this->DateStart);
			if ($dttStartDate->PhpDate('w') < $this->intMeetingDay) {
				$dttStartDate->Day += ($this->intMeetingDay - $dttStartDate->PhpDate('w'));
			} else if ($dttStartDate->PhpDate('w') > $this->intMeetingDay) {
				$dttStartDate->Day += (7 - ($dttStartDate->PhpDate('w') - $this->intMeetingDay));
			}

			// Array to Return
			$dttArrayToReturn = array();
						
			while ($dttStartDate->IsEarlierOrEqualTo($this->DateEnd)) {
				$dttToAdd = new QDateTime($dttStartDate);
				$dttArrayToReturn[] = $dttToAdd;
				$dttStartDate->Day += 7;
			}

			return $dttArrayToReturn;
		}

		// Override or Create New Load/Count methods
		// (For obvious reasons, these methods are commented out...
		// but feel free to use these as a starting point)
/*
		public static function LoadArrayBySample($strParam1, $intParam2, $objOptionalClauses = null) {
			// This will return an array of ClassMeeting objects
			return ClassMeeting::QueryArray(
				QQ::AndCondition(
					QQ::Equal(QQN::ClassMeeting()->Param1, $strParam1),
					QQ::GreaterThan(QQN::ClassMeeting()->Param2, $intParam2)
				),
				$objOptionalClauses
			);
		}

		public static function LoadBySample($strParam1, $intParam2, $objOptionalClauses = null) {
			// This will return a single ClassMeeting object
			return ClassMeeting::QuerySingle(
				QQ::AndCondition(
					QQ::Equal(QQN::ClassMeeting()->Param1, $strParam1),
					QQ::GreaterThan(QQN::ClassMeeting()->Param2, $intParam2)
				),
				$objOptionalClauses
			);
		}

		public static function CountBySample($strParam1, $intParam2, $objOptionalClauses = null) {
			// This will return a count of ClassMeeting objects
			return ClassMeeting::QueryCount(
				QQ::AndCondition(
					QQ::Equal(QQN::ClassMeeting()->Param1, $strParam1),
					QQ::Equal(QQN::ClassMeeting()->Param2, $intParam2)
				),
				$objOptionalClauses
			);
		}

		public static function LoadArrayBySample($strParam1, $intParam2, $objOptionalClauses) {
			// Performing the load manually (instead of using Qcodo Query)

			// Get the Database Object for this Class
			$objDatabase = ClassMeeting::GetDatabase();

			// Properly Escape All Input Parameters using Database->SqlVariable()
			$strParam1 = $objDatabase->SqlVariable($strParam1);
			$intParam2 = $objDatabase->SqlVariable($intParam2);

			// Setup the SQL Query
			$strQuery = sprintf('
				SELECT
					`class_meeting`.*
				FROM
					`class_meeting` AS `class_meeting`
				WHERE
					param_1 = %s AND
					param_2 < %s',
				$strParam1, $intParam2);

			// Perform the Query and Instantiate the Result
			$objDbResult = $objDatabase->Query($strQuery);
			return ClassMeeting::InstantiateDbResult($objDbResult);
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