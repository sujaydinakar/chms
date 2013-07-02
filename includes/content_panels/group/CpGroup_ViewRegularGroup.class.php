<?php
	class CpGroup_ViewRegularGroup extends CpGroup_Base {
		public $txtFirstName;
		public $txtLastName;
		
		protected function SetupPanel() {
			if (!$this->objGroup->IsLoginCanView(QApplication::$Login)) $this->ReturnTo('/groups/');

			$this->SetupViewControls(true, true);
			$this->dtgMembers->SetDataBinder('dtgMembers_Bind', $this);
			
			$this->txtFirstName = new QTextBox($this);
			$this->txtFirstName->Name = 'First Name (Exact)';
			$this->txtFirstName->AddAction(new QChangeEvent(), new QAjaxControlAction($this,'dtgMembers_Refresh'));
			$this->txtFirstName->AddAction(new QEnterKeyEvent(), new QAjaxControlAction($this,'dtgMembers_Refresh'));
			$this->txtFirstName->AddAction(new QEnterKeyEvent(), new QTerminateAction());
				
			$this->txtLastName = new QTextBox($this);
			$this->txtLastName->Name = 'Last Name (Exact)';
			$this->txtLastName->AddAction(new QChangeEvent(), new QAjaxControlAction($this,'dtgMembers_Refresh'));
			$this->txtLastName->AddAction(new QEnterKeyEvent(), new QAjaxControlAction($this,'dtgMembers_Refresh'));
			$this->txtLastName->AddAction(new QEnterKeyEvent(), new QTerminateAction());
				
			if ($this->objGroup->CountEmailMessageRoutes()) $this->SetupEmailMessageControls();
			$this->SetupSmsControls();
		}

		public function dtgMembers_Bind() {
			$objConditions = QQ::AndCondition(
				QQ::Equal(QQN::Person()->GroupParticipation->GroupId, $this->objGroup->Id),
				QQ::IsNull(QQN::Person()->GroupParticipation->DateEnd)
			);
			$this->dtgMembers->TotalItemCount = Person::QueryCount($objConditions);

			if ($strName = trim($this->txtFirstName->Text)) {
				$objConditions = QQ::AndCondition($objConditions,
				QQ::Like( QQN::Person()->FirstName, $strName . '%')
				);
			}
				
			if ($strName = trim($this->txtLastName->Text)) {
				$objConditions = QQ::AndCondition($objConditions,
				QQ::Like( QQN::Person()->LastName, $strName . '%')
				);
			}
			$objClauses = array(QQ::Distinct());
			if ($objClause = $this->dtgMembers->LimitClause) $objClauses[] = $objClause;
			if ($objClause = $this->dtgMembers->OrderByClause) $objClauses[] = $objClause;

			$this->dtgMembers->DataSource = Person::QueryArray($objConditions, $objClauses);
		}
		
		public function dtgMembers_Refresh() {
			$this->dtgMembers->PageNumber = 1;
			$this->dtgMembers->Refresh();
		}
	}
?>