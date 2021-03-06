<?php
require(dirname(__FILE__) . '/../../includes/prepend.inc.php');
	QApplication::Authenticate();

	class ToolsForm extends ChmsForm {
		protected $strPageTitle = 'Tools and Utilities';
		protected $intNavSectionId = ChmsForm::NavSectionPeople;
		protected $txtEmail;
		protected $btnCheck;
		protected $lblResult;
		
		protected function Form_Create() {	
			$this->txtEmail = new QTextBox($this);
			$this->btnCheck = new QButton($this);
			$this->btnCheck->Text = 'Check Email';
			$this->btnCheck->AddAction(new QClickEvent(), new QAjaxAction('btnCheck_Click'));
			$this->lblResult = new QLabel($this);
			$this->lblResult->Text = '';
			$this->lblResult->HtmlEntities = false;
			$this->objDefaultWaitIcon = new QWaitIcon($this);
		}
		
		protected function btnCheck_Click($strFormId, $strControlId, $strParameter) {
			$this->lblResult->Text = '';
			$objEmailArray = Email::LoadArrayByAddress($this->txtEmail->Text);
			if(count($objEmailArray)>0) {
				$this->lblResult->Text .= "Found email objects<br><br>";
				$intPersonIdArray = array();
				foreach($objEmailArray as $objEmail) {
					$objPerson = Person::LoadByPrimaryEmailId($objEmail->Id);
					if($objPerson)
					$intPersonIdArray[] = $objPerson->Id;
				}
			
				$this->lblResult->Text .= "<h3>GROUPS</h3>";
				$objGroupCursor = Group::QueryCursor(QQ::All());
				while ($objGroup = Group::InstantiateCursor($objGroupCursor)) {
					$objGroupParticipationArr = $objGroup->GetGroupParticipationArray();
					foreach($objGroupParticipationArr as $objGroupParticipant) {
						if(in_array($objGroupParticipant->PersonId, $intPersonIdArray)) {
							$this->lblResult->Text .= sprintf("%s is in %s: %s<br>",$this->txtEmail->Text,$objGroup->Ministry->Name, $objGroup->Name);
							break;
						}
					}
				}
			
				$this->lblResult->Text .= "<br><h3>COMMUNICATION LISTS</h3>";
				$objCommuncationsCursor = CommunicationList::QueryCursor(QQ::All());
				while ($objCommunicationList = CommunicationList::InstantiateCursor($objCommuncationsCursor)) {
					$objCommListArray = $objCommunicationList->GetMemberAsArray();
					foreach($objCommListArray as $objComListEntry) {
						if($objComListEntry[3] == $this->txtEmail->Text) {
							$this->lblResult->Text .= sprintf("%s is in %s: %s<br>",$this->txtEmail->Text,$objCommunicationList->Ministry->Name,$objCommunicationList->Name);
							break;
						}
					}
				}
			} else {
				$this->lblResult->Text .=  "No email object found<br>";
			}
		}
		
	}
	
	ToolsForm::Run('ToolsForm');
	?>