<?php
	class MessageDialog extends QDialogBox {
		protected $strMessageHtml;
		protected $btnButtonArray;

		const ButtonPrimary = 1;
		const ButtonSecondary = 2;

		public function __construct($objParentObject, $strControlId = null) {
			try {
				parent::__construct($objParentObject, $strControlId);
			} catch (QCallerException $objExc) { $objExc->IncrementOffset(); throw $objExc; }

			$this->strTemplate = dirname(__FILE__) . '/MessageDialog.tpl.php';
			$this->btnButtonArray = array();
			$this->HideDialogBox();
		}

		public function RemoveAllButtons() {
			$this->blnMatteClickable = true;
			foreach ($this->btnButtonArray as $btnButton) {
				$this->RemoveChildControl($btnButton->ControlId, true);
			}
		}

		public function AddButton($strButtonText, $intButtonTypeId, $strOnClickMethodName, QControl $objOnClickMethodObject = null) {
			$this->blnMatteClickable = false;
			switch ($intButtonTypeId) {
				case MessageDialog::ButtonPrimary:
					$btnButton = new QButton($this);
					$btnButton->CssClass = 'primary';
					break;
				case MessageDialog::ButtonSecondary:
					$btnButton = new QLinkButton($this);
					$btnButton->CssClass = 'Cancel';
					break;
				default:
					throw new QCallerException('Invalid ButtonTypeId: ' . $intButtonTypeId);
			}

			$btnButton->Text = $strButtonText;
			if ($objOnClickMethodObject)
				$btnButton->AddAction(new QClickEvent(), new QAjaxControlAction($objOnClickMethodObject, $strOnClickMethodName));
			else
				$btnButton->AddAction(new QClickEvent(), new QAjaxAction($strOnClickMethodName));
			$btnButton->AddAction(new QClickEvent(), new QTerminateAction());

			return $btnButton;
		}

		public function GetButtonArray() {
			return $this->btnButtonArray;
		}

		/////////////////////////
		// Public Properties: GET
		/////////////////////////
		public function __get($strName) {
			switch ($strName) {
				case 'MessageHtml': return $this->strMessageHtml;

				default:
					try {
						return parent::__get($strName);
					} catch (QCallerException $objExc) { $objExc->IncrementOffset(); throw $objExc; }
			}
		}

		/////////////////////////
		// Public Properties: SET
		/////////////////////////
		public function __set($strName, $mixValue) {
			$this->blnModified = true;

			switch ($strName) {
				case 'MessageHtml': 
					try {
						return ($this->strMessageHtml = QType::Cast($mixValue, QType::String));
					} catch (QCallerException $objExc) { $objExc->IncrementOffset(); throw $objExc; }

				default:
					try {
						return (parent::__set($strName, $mixValue));
					} catch (QCallerException $objExc) { $objExc->IncrementOffset(); throw $objExc; }
			}
		}
	}
?>