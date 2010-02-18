<?php
	/**
	 * The PermissionType class defined here contains
	 * code for the PermissionType enumerated type.  It represents
	 * the enumerated values found in the "permission_type" table
	 * in the database.
	 * 
	 * To use, you should use the PermissionType subclass which
	 * extends this PermissionTypeGen class.
	 * 
	 * Because subsequent re-code generations will overwrite any changes to this
	 * file, you should leave this file unaltered to prevent yourself from losing
	 * any information or code changes.  All customizations should be done by
	 * overriding existing or implementing new methods, properties and variables
	 * in the PermissionType class.
	 * 
	 * @package ALCF ChMS
	 * @subpackage GeneratedDataObjects
	 */
	abstract class PermissionTypeGen extends QBaseClass {
		const EditData = 1;
		const AccessStewardship = 2;
		const AccessConfidentialNotes = 4;
		const MergeIndividuals = 8;
		const EditMembershipStatus = 16;

		const MaxId = 16;

		public static $NameArray = array(
			1 => 'Edit Data',
			2 => 'Access Stewardship',
			4 => 'Access Confidential Notes',
			8 => 'Merge Individuals',
			16 => 'Edit Membership Status');

		public static $TokenArray = array(
			1 => 'EditData',
			2 => 'AccessStewardship',
			4 => 'AccessConfidentialNotes',
			8 => 'MergeIndividuals',
			16 => 'EditMembershipStatus');

		public static function ToString($intPermissionTypeId) {
			switch ($intPermissionTypeId) {
				case 1: return 'Edit Data';
				case 2: return 'Access Stewardship';
				case 4: return 'Access Confidential Notes';
				case 8: return 'Merge Individuals';
				case 16: return 'Edit Membership Status';
				default:
					throw new QCallerException(sprintf('Invalid intPermissionTypeId: %s', $intPermissionTypeId));
			}
		}

		public static function ToToken($intPermissionTypeId) {
			switch ($intPermissionTypeId) {
				case 1: return 'EditData';
				case 2: return 'AccessStewardship';
				case 4: return 'AccessConfidentialNotes';
				case 8: return 'MergeIndividuals';
				case 16: return 'EditMembershipStatus';
				default:
					throw new QCallerException(sprintf('Invalid intPermissionTypeId: %s', $intPermissionTypeId));
			}
		}

	}
?>