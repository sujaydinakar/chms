	<h4>Credit Card Information</h4>
	<p style="margin-top: 0;">(*) Fields in <strong>BOLD</strong> are required</p>

	<div class="section">
		<?php $_CONTROL->txtName->RenderWithName(); ?>
		<?php $_CONTROL->txtAddress1->RenderWithName(); ?>
		<?php $_CONTROL->txtAddress2->RenderWithName(); ?>
		<?php $_CONTROL->txtCity->HtmlAfter = ' ' . $_CONTROL->lstState->RenderWithError(false) . ' ' . $_CONTROL->txtZipCode->RenderWithError(false); ?>
		<?php $_CONTROL->txtCity->RenderWithName(); ?>
	</div>

	<div class="buttonBar">
		<?php $_CONTROL->btnSubmit->Render(); ?>
	</div>