<?php
	/**
	 * This is the abstract Panel class for the List All functionality
	 * of the AttributeValue class.  This code-generated class
	 * contains a datagrid to display an HTML page that can
	 * list a collection of AttributeValue objects.  It includes
	 * functionality to perform pagination and sorting on columns.
	 *
	 * To take advantage of some (or all) of these control objects, you
	 * must create a new QPanel which extends this AttributeValueListPanelBase
	 * class.
	 *
	 * Any and all changes to this file will be overwritten with any subsequent re-
	 * code generation.
	 * 
	 * @package ALCF ChMS
	 * @subpackage Drafts
	 * 
	 */
	class AttributeValueListPanel extends QPanel {
		// Local instance of the Meta DataGrid to list AttributeValues
		public $dtgAttributeValues;

		// Other public QControls in this panel
		public $btnCreateNew;
		public $pxyEdit;

		// Callback Method Names
		protected $strSetEditPanelMethod;
		protected $strCloseEditPanelMethod;
		
		public function __construct($objParentObject, $strSetEditPanelMethod, $strCloseEditPanelMethod, $strControlId = null) {
			// Call the Parent
			try {
				parent::__construct($objParentObject, $strControlId);
			} catch (QCallerException $objExc) {
				$objExc->IncrementOffset();
				throw $objExc;
			}

			// Record Method Callbacks
			$this->strSetEditPanelMethod = $strSetEditPanelMethod;
			$this->strCloseEditPanelMethod = $strCloseEditPanelMethod;

			// Setup the Template
			$this->Template = 'AttributeValueListPanel.tpl.php';

			// Instantiate the Meta DataGrid
			$this->dtgAttributeValues = new AttributeValueDataGrid($this);

			// Style the DataGrid (if desired)
			$this->dtgAttributeValues->CssClass = 'datagrid';
			$this->dtgAttributeValues->AlternateRowStyle->CssClass = 'alternate';

			// Add Pagination (if desired)
			$this->dtgAttributeValues->Paginator = new QPaginator($this->dtgAttributeValues);
			$this->dtgAttributeValues->ItemsPerPage = 8;

			// Use the MetaDataGrid functionality to add Columns for this datagrid

			// Create an Edit Column
			$this->pxyEdit = new QControlProxy($this);
			$this->pxyEdit->AddAction(new QClickEvent(), new QAjaxControlAction($this, 'pxyEdit_Click'));
			$this->dtgAttributeValues->MetaAddEditProxyColumn($this->pxyEdit, 'Edit', 'Edit');

			// Create the Other Columns (note that you can use strings for attribute_value's properties, or you
			// can traverse down QQN::attribute_value() to display fields that are down the hierarchy)
			$this->dtgAttributeValues->MetaAddColumn('Id');
			$this->dtgAttributeValues->MetaAddColumn(QQN::AttributeValue()->Attribute);
			$this->dtgAttributeValues->MetaAddColumn(QQN::AttributeValue()->Person);
			$this->dtgAttributeValues->MetaAddColumn('DateValue');
			$this->dtgAttributeValues->MetaAddColumn('TextValue');
			$this->dtgAttributeValues->MetaAddColumn('BooleanValue');
			$this->dtgAttributeValues->MetaAddColumn(QQN::AttributeValue()->AttributeOption);

			// Setup the Create New button
			$this->btnCreateNew = new QButton($this);
			$this->btnCreateNew->Text = QApplication::Translate('Create a New') . ' ' . QApplication::Translate('AttributeValue');
			$this->btnCreateNew->AddAction(new QClickEvent(), new QAjaxControlAction($this, 'btnCreateNew_Click'));
		}

		public function pxyEdit_Click($strFormId, $strControlId, $strParameter) {
			$strParameterArray = explode(',', $strParameter);
			$objEditPanel = new AttributeValueEditPanel($this, $this->strCloseEditPanelMethod, $strParameterArray[0]);

			$strMethodName = $this->strSetEditPanelMethod;
			$this->objForm->$strMethodName($objEditPanel);
		}

		public function btnCreateNew_Click($strFormId, $strControlId, $strParameter) {
			$objEditPanel = new AttributeValueEditPanel($this, $this->strCloseEditPanelMethod, null);
			$strMethodName = $this->strSetEditPanelMethod;
			$this->objForm->$strMethodName($objEditPanel);
		}
	}
?>