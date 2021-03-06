<?php
	class Vicp_ContactInformation_EditPreferences extends Vicp_Base {
		public $lstMailing;
		public $lstStewardship;
		public $lstCanMail;
		public $lstCanEmail;
		public $lstCanPhone;

		protected function SetupPanel() {
			$objAddresses = array();
			if ($this->objForm->objHousehold && ($objAddress = $this->objForm->objHousehold->GetCurrentAddress())) {
				$objAddresses[] = $objAddress;
			}
			foreach (Address::LoadArrayByPersonId($this->objPerson->Id) as $objAddress) {
				if ($objAddress->CurrentFlag) {
					$objAddresses[] = $objAddress;
				}
			}

			$this->lstMailing = new QListBox($this);
			$this->lstMailing->Name = 'Mailing Address';
			$this->lstMailing->AddItem('- None -');
			foreach ($objAddresses as $objAddress) {
				$this->lstMailing->AddItem(
					sprintf('%s (%s)', $objAddress->Label, $objAddress->ShortName),
					$objAddress->Id,
					$objAddress->Id == $this->objPerson->MailingAddressId);
			}

			$this->lstStewardship = new QListBox($this);
			$this->lstStewardship->Name = 'Stewardship Receipt Address';
			$this->lstStewardship->AddItem('- None -');
			foreach ($objAddresses as $objAddress) {
				$this->lstStewardship->AddItem(
					sprintf('%s (%s)', $objAddress->Label, $objAddress->ShortName),
					$objAddress->Id,
					$objAddress->Id == $this->objPerson->StewardshipAddressId);
			}

			$this->lstCanMail = new QListBox($this);
			$this->lstCanMail->Name = 'Okay to Mail';
			$this->lstCanMail->AddItem('Yes', true, $this->objPerson->CanMailFlag);
			$this->lstCanMail->AddItem('No', false, !$this->objPerson->CanMailFlag);

			$this->lstCanEmail = new QListBox($this);
			$this->lstCanEmail->Name = 'Okay to Email';
			$this->lstCanEmail->AddItem('Yes', true, $this->objPerson->CanEmailFlag);
			$this->lstCanEmail->AddItem('No', false, !$this->objPerson->CanEmailFlag);

			$this->lstCanPhone = new QListBox($this);
			$this->lstCanPhone->Name = 'Okay to Phone';
			$this->lstCanPhone->AddItem('Yes', true, $this->objPerson->CanPhoneFlag);
			$this->lstCanPhone->AddItem('No', false, !$this->objPerson->CanPhoneFlag);
		}

		public function btnSave_Click() {
			$this->objPerson->MailingAddressId = $this->lstMailing->SelectedValue;
			$this->objPerson->StewardshipAddressId = $this->lstStewardship->SelectedValue;

			$this->objPerson->CanMailFlag = $this->lstCanMail->SelectedValue;
			$this->objPerson->CanEmailFlag = $this->lstCanEmail->SelectedValue;
			$this->objPerson->CanPhoneFlag = $this->lstCanPhone->SelectedValue;

			$this->objPerson->Save();
			
			// Check to see if we need to remove person from email.
			if(!$this->objPerson->CanEmailFlag) {
				$objList = CommunicationList::LoadByToken('allchurch_nl'); // NOTE: this is the hard coded token of the congregational newsletter.
				if ($objList){
					// Check communications list for an existing communications entry
					$objCommunicationListEntry = CommunicationListEntry::LoadByEmail($this->objPerson->PrimaryEmail->Address);
					if ($objCommunicationListEntry) {
						if($objList->IsCommunicationListEntryAssociated($objCommunicationListEntry)) {
							$objList->UnassociateCommunicationListEntry($objCommunicationListEntry);
						}
					}
					//Check communications list for existing person entry
					if($objList->IsPersonAssociated($this->objPerson)) {				
						$objList->UnassociatePerson($this->objPerson);
					}
				}
			}
			$this->objPerson->RefreshPrimaryContactInfo();
			QApplication::ExecuteJavaScript('document.location="#contact";');
		}

		public function btnCancel_Click() {
			QApplication::ExecuteJavaScript('document.location="#contact";');
		}
	}
?>