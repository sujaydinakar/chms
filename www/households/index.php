<?php
	require(dirname(__FILE__) . '/../../includes/prepend.inc.php');
	QApplication::Authenticate();

	class SearchIndividualsForm extends ChmsForm {
		protected $strPageTitle = 'Search for a Household';
		protected $intNavSectionId = ChmsForm::NavSectionPeople;

		protected $dtgHouseholds;

		protected function Form_Create() {
			$this->dtgHouseholds = new HouseholdDataGrid($this);
			$this->dtgHouseholds->Paginator = new QPaginator($this->dtgHouseholds);
			$this->dtgHouseholds->AlternateRowStyle->CssClass = 'alternate';
			$this->dtgHouseholds->MetaAddColumn('Name','Html=<?=$_FORM->RenderHouseholdName($_ITEM); ?>', 'HtmlEntities=false');
		}
		
		public function RenderHouseholdName(Household $objHousehold) {
			return sprintf('<a href="/households/view.php/%s">%s</a>', $objHousehold->Id, QApplication::HtmlEntities($objHousehold->Name));
		}		
		
		
	}

	SearchIndividualsForm::Run('SearchIndividualsForm');
?>