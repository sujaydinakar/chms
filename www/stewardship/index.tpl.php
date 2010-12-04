<?php require(__INCLUDES__ . '/header.inc.php'); ?>
	<h1>Stewardship - View All Batches
		<button class="primary" onclick="document.location='/stewardship/new.php'; return false;">Create New Batch</button>
	</h1>	
	
	<div class="section">
		<div class="filterBy">Filter by Status<br/><?php $this->lstStatus->Render(); ?></div>
		<div class="filterBy">Description<br/><?php $this->txtDescription->Render('Width=300px'); ?></div>
		<div class="filterBy">Created By<br/><?php $this->lstCreatedBy->Render(); ?></div>
		<div class="cleaner">&nbsp;</div>
	</div>

	<div class="section">
		<?php $this->dtgBatches->Render(); ?>
	</div>

	<div class="buttonBar" style="color: #666;">
		Report: Invalid Addresses for <a href="/stewardship/reports/invalid_addresses.php/<?php _p(QDateTime::Now()->Year-1); ?>" class="cancel"><?php _p(QDateTime::Now()->Year - 1); ?></a>
		or <a href="/stewardship/reports/invalid_addresses.php/<?php _p(QDateTime::Now()->Year); ?>" class="cancel"><?php _p(QDateTime::Now()->Year); ?></a>
		&nbsp;|&nbsp;
		<a href="/stewardship/reports/duplicate_names.php" class="cancel">Report: Duplicate Names</a>
		&nbsp;|&nbsp;
		<a href="/stewardship/receipts/" class="cancel">View/Generate Bulk Receipts</a>
		&nbsp;|&nbsp;
		<a href="/stewardship/funds/" class="cancel">View/Edit Funds</a>
	</div>
	<br/><br/>

<?php require(__INCLUDES__ . '/footer.inc.php'); ?>