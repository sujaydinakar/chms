<?php
	// Load the Qcodo Development Framework
	require(dirname(__FILE__) . '/../../includes/prepend.inc.php');

	/**
	 * This is a quick-and-dirty draft QForm object to do Create, Edit, and Delete functionality
	 * of the GrowthGroupLocation class.  It uses the code-generated
	 * GrowthGroupLocationMetaControl class, which has meta-methods to help with
	 * easily creating/defining controls to modify the fields of a GrowthGroupLocation columns.
	 *
	 * Any display customizations and presentation-tier logic can be implemented
	 * here by overriding existing or implementing new methods, properties and variables.
	 * 
	 * NOTE: This file is overwritten on any code regenerations.  If you want to make
	 * permanent changes, it is STRONGLY RECOMMENDED to move both growth_group_location_edit.php AND
	 * growth_group_location_edit.tpl.php out of this Form Drafts directory.
	 *
	 * @package ALCF Intranet
	 * @subpackage Drafts
	 */
	class GrowthGroupLocationEditForm extends ChmsForm {
		// Local instance of the GrowthGroupLocationMetaControl
		protected $mctGrowthGroupLocation;

		// Controls for GrowthGroupLocation's Data Fields
		protected $lblId;
		protected $txtLocation;
		protected $txtLongitude;
		protected $txtLatitude;
		protected $txtZoom;

		// Other ListBoxes (if applicable) via Unique ReverseReferences and ManyToMany References

		// Other Controls
		protected $btnSave;
		protected $btnDelete;
		protected $btnCancel;

		protected function Form_Create() {
			// Use the CreateFromPathInfo shortcut (this can also be done manually using the GrowthGroupLocationMetaControl constructor)
			// MAKE SURE we specify "$this" as the MetaControl's (and thus all subsequent controls') parent
			$this->mctGrowthGroupLocation = GrowthGroupLocationMetaControl::CreateFromPathInfo($this);
			
			$this->strPageTitle = 'Growth Groups - Edit Region';

			// Call MetaControl's methods to create qcontrols based on GrowthGroupLocation's data fields
			$this->lblId = $this->mctGrowthGroupLocation->lblId_Create();
			$this->txtLocation = $this->mctGrowthGroupLocation->txtLocation_Create();
			$this->txtLongitude = $this->mctGrowthGroupLocation->txtLongitude_Create();
			$this->txtLatitude = $this->mctGrowthGroupLocation->txtLatitude_Create();
			$this->txtZoom = $this->mctGrowthGroupLocation->txtZoom_Create();

			// Create Buttons and Actions on this Form
			$this->btnSave = new QButton($this);
			$this->btnSave->Text = QApplication::Translate('Save');
			$this->btnSave->AddAction(new QClickEvent(), new QAjaxAction('btnSave_Click'));
			$this->btnSave->CausesValidation = true;

			$this->btnCancel = new QButton($this);
			$this->btnCancel->Text = QApplication::Translate('Cancel');
			$this->btnCancel->AddAction(new QClickEvent(), new QAjaxAction('btnCancel_Click'));

			$this->btnDelete = new QButton($this);
			$this->btnDelete->Text = QApplication::Translate('Delete');
			$this->btnDelete->AddAction(new QClickEvent(), new QConfirmAction(QApplication::Translate('Are you SURE you want to DELETE this') . ' ' . QApplication::Translate('GrowthGroupLocation') . '?'));
			$this->btnDelete->AddAction(new QClickEvent(), new QAjaxAction('btnDelete_Click'));
			$this->btnDelete->Visible = false;
		}

		/**
		 * This Form_Validate event handler allows you to specify any custom Form Validation rules.
		 * It will also Blink() on all invalid controls, as well as Focus() on the top-most invalid control.
		 */
		protected function Form_Validate() {
			// By default, we report that Custom Validations passed
			$blnToReturn = true;

			// Custom Validation Rules
			// TODO: Be sure to set $blnToReturn to false if any custom validation fails!

			$blnFocused = false;
			foreach ($this->GetErrorControls() as $objControl) {
				// Set Focus to the top-most invalid control
				if (!$blnFocused) {
					$objControl->Focus();
					$blnFocused = true;
				}

				// Blink on ALL invalid controls
				$objControl->Blink();
			}

			return $blnToReturn;
		}

		// Button Event Handlers

		protected function btnSave_Click($strFormId, $strControlId, $strParameter) {
			// Delegate "Save" processing to the GrowthGroupLocationMetaControl
			$this->mctGrowthGroupLocation->SaveGrowthGroupLocation();
			$this->RedirectToListPage();
		}

		protected function btnDelete_Click($strFormId, $strControlId, $strParameter) {
			// Delegate "Delete" processing to the GrowthGroupLocationMetaControl
			$this->mctGrowthGroupLocation->DeleteGrowthGroupLocation();
			$this->RedirectToListPage();
		}

		protected function btnCancel_Click($strFormId, $strControlId, $strParameter) {
			$this->RedirectToListPage();
		}

		// Other Methods

		protected function RedirectToListPage() {
			QApplication::Redirect('/growth_groups/index.php/' . $this->mctGrowthGroupLocation->GrowthGroupLocation->Id);
		}
	}

	// Go ahead and run this form object to render the page and its event handlers, implicitly using
	// growth_group_location_edit.tpl.php as the included HTML template file
	GrowthGroupLocationEditForm::Run('GrowthGroupLocationEditForm');
?>