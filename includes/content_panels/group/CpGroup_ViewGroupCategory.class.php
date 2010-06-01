<?php
	class CpGroup_ViewGroupCategory extends CpGroup_Base {
		/**
		 * @var PersonDataGrid
		 */
		public $dtgMembers;

		protected function SetupPanel() {
			if (!$this->objGroup->IsLoginCanView(QApplication::$Login)) $this->ReturnTo('/groups/');

			// Setup Group Array
			$this->objGroupArray = $this->objGroup->GetThisAndChildren();
			$this->intGroupIdArray = array();
			foreach ($this->objGroupArray as $objGroup) $this->intGroupIdArray[] = $objGroup->Id;

			$this->SetupViewControls(false, true);
			$this->dtgMembers->SetDataBinder('dtgMembers_Bind', $this);
		}

		public function dtgMembers_Bind() {
			$objClauses = array(QQ::Distinct());
			if ($objClause = $this->dtgMembers->LimitClause) $objClauses[] = $objClause;
			if ($objClause = $this->dtgMembers->OrderByClause) $objClauses[] = $objClause;

			$this->dtgMembers->DataSource = Person::QueryArray(QQ::In(QQN::Person()->GroupParticipation->GroupId, $this->intGroupIdArray), $objClauses);
		}
	}
?>