<?php
	require(__DATAGEN_CLASSES__ . '/GroupGen.class.php');

	/**
	 * The Group class defined here contains any
	 * customized code for the Group class in the
	 * Object Relational Model.  It represents the "group" table 
	 * in the database, and extends from the code generated abstract GroupGen
	 * class, which contains all the basic CRUD-type functionality as well as
	 * basic methods to handle relationships and index-based loading.
	 * 
	 * @package ALCF ChMS
	 * @subpackage DataObjects
	 * 
	 */
	class Group extends GroupGen {
		/**
		 * Default "to string" handler
		 * Allows pages to _p()/echo()/print() this object, and to define the default
		 * way this object would be outputted.
		 *
		 * Can also be called directly via $objGroup->__toString().
		 *
		 * @return string a nicely formatted string representation of this object
		 */
		public function __toString() {
			return sprintf('Group Object %s',  $this->intId);
		}

		public function __get($strName) {
			switch ($strName) {
				case 'Type': return GroupType::$NameArray[$this->intGroupTypeId];

				default:
					try {
						return parent::__get($strName);
					} catch (QCallerException $objExc) {
						$objExc->IncrementOffset();
						throw $objExc;
					}
			}
		}
		
		/**
		 * Creates a new group for a ministry
		 * @param Ministry $objMinistry
		 * @param integer $intGroupTypeId
		 * @param string $strName
		 * @param string $strDescription
		 * @param Group $objParentGroup optional parent group or NULL for none
		 * @return Group
		 */
		public static function CreateGroupForMinistry(Ministry $objMinistry, $intGroupTypeId, $strName, $strDescription, Group $objParentGroup = null) {
			if ($objParentGroup &&
				($objParentGroup->MinistryId != $objMinistry->Id)) {
				throw new QCallerException('Parent Group is in a different Ministry');
			}

			$objGroup = new Group();
			$objGroup->Ministry = $objMinistry;
			$objGroup->GroupTypeId = $intGroupTypeId;
			$objGroup->Name = $strName;
			$objGroup->Description = $strDescription;
			$objGroup->ParentGroup = $objParentGroup;
			$objGroup->Save();

//			switch ($intGroupTypeId) {
//				case GroupType::RegularGroup;
//				case GroupType::GroupCategory:
//					break;
//					break;
//				case GroupType::GrowthGroup:
//					break;
//				case GroupType::SmartGroup:
//					break;
//				default:
//					throw new QCallerException('Invalid Group Type Id: ' . $intGroupTypeId);
//			}

			return $objGroup;
		}

		/**
		 * Adds a Person to this Group as a Group Participation record.  Throws an exception
		 * if the GroupRole doesn't exist in the Ministry that the group belongs to.
		 * 
		 * If StartDate is NULL, it will use Now()
		 * 
		 * @param Person $objPerson
		 * @param integer $intGroupRoleId
		 * @param QDateTime $dttDateStart
		 * @param QDateTime $dttDateEnd
		 * @return GroupParticipation
		 */
		public function AddPerson(Person $objPerson, $intGroupRoleId, QDateTime $dttDateStart = null, QDateTime $dttDateEnd = null) {
			$objGroupParticipation = new GroupParticipation();
			$objGroupParticipation->Person = $objPerson;
			$objGroupParticipation->Group = $this;
			$objGroupParticipation->GroupRoleId = $intGroupRoleId;
			$objGroupParticipation->DateStart = ($dttDateStart ? $dttDateStart : QDateTime::Now());
			$objGroupParticipation->DateEnd = $dttDateEnd;
			$objGroupParticipation->Save();
		}


		/**
		 * Can the Login view or edit this group information (based on Confidentiality rules)
		 * @param Login $objLogin
		 * @return boolean
		 */
		public function IsLoginCanView(Login $objLogin) {
			// Administrators can always view
			if ($objLogin->RoleTypeId == RoleType::ChMSAdministrator) return true;
			
			// Anyone can view non-confidential
			if (!$this->blnConfidentialFlag) return true;
			
			// Otherwise, only ministry members can view
			return $objLogin->IsMinistryAssociated($this->Ministry);
		}
		
		
		/**
		 * Gets an array of Groups for a given ministry, ordered in hierarchical order and name
		 * @param integer $intMinistryId
		 * @return Group[]
		 */
		public static function LoadOrderedArrayForMinistry($intMinistryId) {
			$objGroupArray = Group::LoadArrayByMinistryId($intMinistryId, QQ::OrderBy(QQN::Group()->Name));

			return self::LoadOrderedArrayForMinistryHelper($objGroupArray, null);
		}

		/**
		 * Helper method to recurse through an array of ministries for LoadOrderedArrayForMinistry
		 * @param Group[] $objGroupArray
		 * @param integer $intParentGroupId
		 * @return Group[]
		 */
		protected static function LoadOrderedArrayForMinistryHelper($objGroupArray, $intParentGroupId) {
			$arrToReturn = array();
			foreach ($objGroupArray as $objGroup) {
				if (($objGroup->ParentGroupId == $intParentGroupId) ||
					(is_null($objGroup->ParentGroupId) && is_null($intParentGroupId))) {
					$arrToReturn[] = $objGroup;
					$arrToReturn = array_merge($arrToReturn, self::LoadOrderedArrayForMinistryHelper($objGroupArray, $objGroup->Id));
				}
			}

			return $arrToReturn;
		}

		/**
		 * Refreshes all the groups within a ministry with the correct HierarchOrderNumber
		 * @param integer $intMinistryId
		 * @return void
		 */
		public static function RefreshHierarchyOrderNumberForMinistry($intMinistryId) {
			$intOrderNumber = 1;
			foreach (Group::LoadOrderedArrayForMinistry($intMinistryId) as $objGroup) {
				$objGroup->HierarchyOrderNumber = $intOrderNumber;
				$objGroup->Save();
				$intOrderNumber++;
			}
		}

		/**
		 * Refreshes the hierarchy "Level" of this object based on where it is in the hierarchy.
		 * 
		 * Top-level groups for a ministry have a level of "0".
		 * 
		 * @param boolean $blnSaveFlag
		 * @return integer
		 */
		public function RefreshHierarchyLevel($blnSaveFlag = true) {
			$intLevel = 0;
			$objGroup = $this;

			while ($objParentGroup = $objGroup->ParentGroup) {
				$intLevel++;
				$objGroup = $objParentGroup;
			}

			$this->intHierarchyLevel = $intLevel;
			if ($blnSaveFlag) $this->Save();

			return $intLevel;
		}

		// Override or Create New Load/Count methods
		// (For obvious reasons, these methods are commented out...
		// but feel free to use these as a starting point)
/*
		public static function LoadArrayBySample($strParam1, $intParam2, $objOptionalClauses = null) {
			// This will return an array of Group objects
			return Group::QueryArray(
				QQ::AndCondition(
					QQ::Equal(QQN::Group()->Param1, $strParam1),
					QQ::GreaterThan(QQN::Group()->Param2, $intParam2)
				),
				$objOptionalClauses
			);
		}

		public static function LoadBySample($strParam1, $intParam2, $objOptionalClauses = null) {
			// This will return a single Group object
			return Group::QuerySingle(
				QQ::AndCondition(
					QQ::Equal(QQN::Group()->Param1, $strParam1),
					QQ::GreaterThan(QQN::Group()->Param2, $intParam2)
				),
				$objOptionalClauses
			);
		}

		public static function CountBySample($strParam1, $intParam2, $objOptionalClauses = null) {
			// This will return a count of Group objects
			return Group::QueryCount(
				QQ::AndCondition(
					QQ::Equal(QQN::Group()->Param1, $strParam1),
					QQ::Equal(QQN::Group()->Param2, $intParam2)
				),
				$objOptionalClauses
			);
		}

		public static function LoadArrayBySample($strParam1, $intParam2, $objOptionalClauses) {
			// Performing the load manually (instead of using Qcodo Query)

			// Get the Database Object for this Class
			$objDatabase = Group::GetDatabase();

			// Properly Escape All Input Parameters using Database->SqlVariable()
			$strParam1 = $objDatabase->SqlVariable($strParam1);
			$intParam2 = $objDatabase->SqlVariable($intParam2);

			// Setup the SQL Query
			$strQuery = sprintf('
				SELECT
					`group`.*
				FROM
					`group` AS `group`
				WHERE
					param_1 = %s AND
					param_2 < %s',
				$strParam1, $intParam2);

			// Perform the Query and Instantiate the Result
			$objDbResult = $objDatabase->Query($strQuery);
			return Group::InstantiateDbResult($objDbResult);
		}
*/




		// Override or Create New Properties and Variables
		// For performance reasons, these variables and __set and __get override methods
		// are commented out.  But if you wish to implement or override any
		// of the data generated properties, please feel free to uncomment them.
/*
		protected $strSomeNewProperty;

		public function __get($strName) {
			switch ($strName) {
				case 'SomeNewProperty': return $this->strSomeNewProperty;

				default:
					try {
						return parent::__get($strName);
					} catch (QCallerException $objExc) {
						$objExc->IncrementOffset();
						throw $objExc;
					}
			}
		}

		public function __set($strName, $mixValue) {
			switch ($strName) {
				case 'SomeNewProperty':
					try {
						return ($this->strSomeNewProperty = QType::Cast($mixValue, QType::String));
					} catch (QInvalidCastException $objExc) {
						$objExc->IncrementOffset();
						throw $objExc;
					}

				default:
					try {
						return (parent::__set($strName, $mixValue));
					} catch (QCallerException $objExc) {
						$objExc->IncrementOffset();
						throw $objExc;
					}
			}
		}
*/
	}
?>