/* SQLEditor (MySQL (2))*/

CREATE TABLE `growth_group_location`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`location` VARCHAR(100),
`longitude` DECIMAL(13,10),
`latitude` DECIMAL(13,10),
`zoom` INTEGER,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `country`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100),
`abbreviation` VARCHAR(2) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `us_state`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100),
`abbreviation` VARCHAR(2) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `image_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `phone_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `query_operation`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`query_data_type_bitmap` INTEGER UNSIGNED NOT NULL,
`name` VARCHAR(40) NOT NULL,
`qq_factory_name` VARCHAR(80) NOT NULL,
`argument_flag` BOOLEAN,
`argument_prepend` VARCHAR(100),
`argument_postpend` VARCHAR(100),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `_version`
(
`version` VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE `form_payment_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `outgoing_email_queue`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`to_address` TEXT,
`from_address` TEXT,
`cc_address` TEXT,
`bcc_address` TEXT,
`subject` VARCHAR(255),
`body` TEXT,
`date_queued` DATETIME,
`error_flag` BOOLEAN NOT NULL,
`error_message` TEXT,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `marriage_status_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `name_item`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(200) UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `query_data_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `signup_form_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `parent_pager_program`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`server_identifier` INTEGER UNSIGNED NOT NULL UNIQUE,
`name` VARCHAR(50),
`description` VARCHAR(200),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `query_node_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `role_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `group_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `parent_pager_sync_status_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `class_term`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(50),
`active_flag` BOOLEAN NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `class_course`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`code` VARCHAR(10),
`name` VARCHAR(100),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `form_question_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `parent_pager_station`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`server_identifier` INTEGER UNSIGNED NOT NULL UNIQUE,
`name` VARCHAR(50),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `other_contact_method`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `relationship_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `signup_payment_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `parent_pager_period`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`server_identifier` INTEGER UNSIGNED NOT NULL UNIQUE,
`name` VARCHAR(50),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `form_product_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `stewardship_batch_status_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `communication_list_entry`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`first_name` VARCHAR(100),
`middle_name` VARCHAR(100),
`last_name` VARCHAR(100),
`email` VARCHAR(200) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `email_broadcast_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `checking_account_lookup`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`transit_hash` VARCHAR(32),
`account_hash` VARCHAR(32),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `address_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `query_node`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100),
`query_node_type_id` INTEGER UNSIGNED NOT NULL,
`qcodo_query_node` TEXT,
`query_data_type_id` INTEGER UNSIGNED NOT NULL,
`node_detail` VARCHAR(255),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `attribute_data_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `attribute`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`attribute_data_type_id` INTEGER UNSIGNED NOT NULL,
`name` VARCHAR(100),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `stewardship_contribution_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `credit_card_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `comment_privacy_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ministry`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`token` VARCHAR(20) NOT NULL UNIQUE,
`name` VARCHAR(100),
`parent_ministry_id` INTEGER UNSIGNED,
`group_type_bitmap` INTEGER UNSIGNED,
`signup_form_type_bitmap` INTEGER UNSIGNED,
`active_flag` BOOLEAN NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `stewardship_fund`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`ministry_id` INTEGER UNSIGNED,
`name` VARCHAR(200),
`external_name` VARCHAR(200),
`account_number` VARCHAR(100),
`fund_number` VARCHAR(100),
`active_flag` BOOLEAN,
`external_flag` BOOLEAN,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `signup_form`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`signup_form_type_id` INTEGER UNSIGNED NOT NULL,
`ministry_id` INTEGER UNSIGNED NOT NULL,
`name` VARCHAR(200),
`token` VARCHAR(200) UNIQUE,
`active_flag` BOOLEAN,
`confidential_flag` BOOLEAN,
`description` TEXT,
`information_url` VARCHAR(200),
`support_email` VARCHAR(255) NOT NULL,
`email_notification` TEXT,
`allow_other_flag` BOOLEAN,
`allow_multiple_flag` BOOLEAN,
`signup_limit` INTEGER,
`signup_male_limit` INTEGER,
`signup_female_limit` INTEGER,
`funding_account` VARCHAR(10),
`donation_stewardship_fund_id` INTEGER UNSIGNED,
`date_created` DATETIME NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `form_product`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`signup_form_id` INTEGER UNSIGNED NOT NULL,
`order_number` INTEGER,
`form_product_type_id` INTEGER UNSIGNED NOT NULL,
`form_payment_type_id` INTEGER UNSIGNED NOT NULL,
`name` VARCHAR(40),
`description` VARCHAR(255),
`date_start` DATETIME,
`date_end` DATETIME,
`minimum_quantity` INTEGER,
`maximum_quantity` INTEGER,
`cost` DECIMAL(10,2),
`deposit` DECIMAL(10,2),
`view_flag` BOOLEAN,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `event_signup_form`
(
`signup_form_id` INTEGER UNSIGNED NOT NULL,
`date_start` DATETIME,
`date_end` DATETIME,
`location` VARCHAR(200),
PRIMARY KEY (`signup_form_id`)
) ENGINE=InnoDB;

CREATE TABLE `class_grade`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`code` VARCHAR(5),
`name` VARCHAR(50),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `credit_card_status_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `classified_category`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(50),
`token` VARCHAR(30) NOT NULL UNIQUE,
`order_number` INTEGER,
`description` TEXT,
`instructions` TEXT,
`disclaimer` TEXT,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `group`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`group_type_id` INTEGER UNSIGNED NOT NULL,
`ministry_id` INTEGER UNSIGNED NOT NULL,
`name` VARCHAR(200),
`description` TEXT,
`parent_group_id` INTEGER UNSIGNED,
`hierarchy_level` INTEGER,
`hierarchy_order_number` INTEGER,
`confidential_flag` BOOLEAN,
`email_broadcast_type_id` INTEGER UNSIGNED,
`token` VARCHAR(100) UNIQUE,
`active_flag` BOOLEAN,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `group_category`
(
`group_id` INTEGER UNSIGNED NOT NULL,
`date_refreshed` DATETIME,
`process_time_ms` INTEGER UNSIGNED,
PRIMARY KEY (`group_id`)
) ENGINE=InnoDB;

CREATE TABLE `smart_group`
(
`group_id` INTEGER UNSIGNED NOT NULL,
`query` TEXT,
`date_refreshed` DATETIME,
`process_time_ms` INTEGER UNSIGNED,
PRIMARY KEY (`group_id`)
) ENGINE=InnoDB;

CREATE TABLE `attribute_option`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`attribute_id` INTEGER UNSIGNED NOT NULL,
`name` VARCHAR(100),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `registry`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(80) NOT NULL UNIQUE,
`value` TEXT,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `comment_category`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`order_number` INTEGER UNSIGNED,
`name` VARCHAR(40) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `membership_status_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `growth_group_day_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `growth_group`
(
`group_id` INTEGER UNSIGNED NOT NULL,
`growth_group_location_id` INTEGER UNSIGNED NOT NULL,
`growth_group_day_type_id` INTEGER UNSIGNED,
`meeting_bitmap` INTEGER,
`start_time` INTEGER,
`end_time` INTEGER,
`address_1` VARCHAR(100),
`address_2` VARCHAR(100),
`cross_street_1` VARCHAR(100),
`cross_street_2` VARCHAR(100),
`zip_code` VARCHAR(10),
`longitude` DECIMAL(13,10),
`latitude` DECIMAL(13,10),
`accuracy` INTEGER,
PRIMARY KEY (`group_id`)
) ENGINE=InnoDB;

CREATE TABLE `form_question`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`signup_form_id` INTEGER UNSIGNED NOT NULL,
`order_number` INTEGER,
`form_question_type_id` INTEGER UNSIGNED NOT NULL,
`short_description` VARCHAR(40),
`question` VARCHAR(200),
`required_flag` BOOLEAN,
`internal_flag` BOOLEAN,
`options` TEXT,
`allow_other_flag` BOOLEAN,
`view_flag` BOOLEAN,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `communication_list`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`email_broadcast_type_id` INTEGER UNSIGNED NOT NULL,
`ministry_id` INTEGER UNSIGNED NOT NULL,
`name` VARCHAR(200),
`token` VARCHAR(100) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `communicationlist_communicationlistentry_assn`
(
`communication_list_id` INTEGER UNSIGNED NOT NULL,
`communication_list_entry_id` INTEGER UNSIGNED NOT NULL,
PRIMARY KEY (`communication_list_id`,`communication_list_entry_id`)
) ENGINE=InnoDB;

CREATE TABLE `mobile_provider`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100),
`domain` VARCHAR(100),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `signup_entry_status_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `email_message_status_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `email_message`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`email_message_status_type_id` INTEGER UNSIGNED NOT NULL,
`date_received` DATETIME NOT NULL,
`raw_message` MEDIUMTEXT NOT NULL,
`message_identifier` VARCHAR(255) UNIQUE,
`subject` VARCHAR(255),
`from_address` VARCHAR(255),
`response_header` TEXT,
`response_body` MEDIUMTEXT,
`error_message` TEXT,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `email_outgoing_queue`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`email_message_id` INTEGER UNSIGNED NOT NULL,
`to_address` VARCHAR(255) NOT NULL,
`error_flag` BOOLEAN,
`token` VARCHAR(40),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `growth_group_structure`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `growthgroupstructure_growthgroup_assn`
(
`growth_group_structure_id` INTEGER UNSIGNED NOT NULL,
`growth_group_id` INTEGER UNSIGNED NOT NULL,
PRIMARY KEY (`growth_group_structure_id`,`growth_group_id`)
) ENGINE=InnoDB;

CREATE TABLE `classified_post`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`classified_category_id` INTEGER UNSIGNED NOT NULL,
`approval_flag` BOOLEAN NOT NULL,
`title` VARCHAR(255),
`content` TEXT,
`date_posted` DATETIME,
`date_expired` DATE NOT NULL,
`name` VARCHAR(255),
`phone` VARCHAR(255),
`email` VARCHAR(255),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `marital_status_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `provisional_public_login`
(
`public_login_id` INTEGER UNSIGNED NOT NULL,
`first_name` VARCHAR(100),
`last_name` VARCHAR(100),
`email_address` VARCHAR(100),
`url_hash` VARCHAR(32),
`confirmation_code` VARCHAR(8),
PRIMARY KEY (`public_login_id`)
) ENGINE=InnoDB;

CREATE TABLE `household_split`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`household_id` INTEGER UNSIGNED NOT NULL,
`split_household_id` INTEGER UNSIGNED NOT NULL,
`date_split` DATETIME,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `parent_pager_household`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`server_identifier` INTEGER UNSIGNED NOT NULL UNIQUE,
`household_id` INTEGER UNSIGNED,
`hidden_flag` BOOLEAN NOT NULL,
`parent_pager_sync_status_type_id` INTEGER UNSIGNED NOT NULL,
`name` VARCHAR(75),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `query_condition`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`search_query_id` INTEGER UNSIGNED,
`or_query_condition_id` INTEGER UNSIGNED UNIQUE,
`query_operation_id` INTEGER UNSIGNED NOT NULL,
`query_node_id` INTEGER UNSIGNED NOT NULL,
`value` VARCHAR(255),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `parent_pager_child_history`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`server_identifier` INTEGER UNSIGNED NOT NULL UNIQUE,
`parent_pager_individual_id` INTEGER UNSIGNED NOT NULL,
`parent_pager_station_id` INTEGER UNSIGNED,
`parent_pager_period_id` INTEGER UNSIGNED,
`dropoff_by_parent_pager_individual_id` INTEGER UNSIGNED,
`pickup_by_parent_pager_individual_id` INTEGER UNSIGNED,
`date_in` DATETIME NOT NULL,
`date_out` DATETIME NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `parent_pager_attendant_history`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`server_identifier` INTEGER UNSIGNED NOT NULL UNIQUE,
`parent_pager_individual_id` INTEGER UNSIGNED NOT NULL,
`parent_pager_station_id` INTEGER UNSIGNED,
`parent_pager_period_id` INTEGER UNSIGNED,
`parent_pager_program_id` INTEGER UNSIGNED,
`date_in` DATETIME NOT NULL,
`date_out` DATETIME NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `parent_pager_address`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`server_identifier` INTEGER UNSIGNED NOT NULL UNIQUE,
`parent_pager_individual_id` INTEGER UNSIGNED,
`parent_pager_household_id` INTEGER UNSIGNED,
`address_1` VARCHAR(100),
`address_2` VARCHAR(100),
`address_3` VARCHAR(100),
`city` VARCHAR(50),
`state` VARCHAR(2),
`zip_code` VARCHAR(10),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `attributevalue_multipleattributeoption_assn`
(
`attribute_value_id` INTEGER UNSIGNED NOT NULL,
`attribute_option_id` INTEGER UNSIGNED NOT NULL,
PRIMARY KEY (`attribute_value_id`,`attribute_option_id`)
) ENGINE=InnoDB;

CREATE TABLE `public_login`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`person_id` INTEGER UNSIGNED UNIQUE,
`active_flag` BOOLEAN,
`username` VARCHAR(20) NOT NULL UNIQUE,
`password` VARCHAR(32),
`lost_password_question` VARCHAR(255),
`lost_password_answer` VARCHAR(255),
`temporary_password_flag` BOOLEAN,
`date_registered` DATETIME NOT NULL,
`date_last_login` DATETIME,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `email`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`person_id` INTEGER UNSIGNED NOT NULL,
`address` VARCHAR(200),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `household`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(200),
`head_person_id` INTEGER UNSIGNED NOT NULL UNIQUE,
`combined_stewardship_flag` BOOLEAN,
`members` VARCHAR(255),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `marriage`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`linked_marriage_id` INTEGER UNSIGNED UNIQUE,
`person_id` INTEGER UNSIGNED NOT NULL,
`married_to_person_id` INTEGER UNSIGNED,
`marriage_status_type_id` INTEGER UNSIGNED NOT NULL,
`date_start` DATE,
`date_end` DATE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `membership`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`person_id` INTEGER UNSIGNED NOT NULL,
`date_start` DATE NOT NULL,
`date_end` DATE,
`termination_reason` TEXT,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `household_participation`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`person_id` INTEGER UNSIGNED NOT NULL,
`household_id` INTEGER UNSIGNED NOT NULL,
`role` VARCHAR(100),
`role_override` VARCHAR(100),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `head_shot`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`person_id` INTEGER UNSIGNED NOT NULL,
`date_uploaded` DATETIME NOT NULL,
`image_type_id` INTEGER UNSIGNED NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `relationship`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`person_id` INTEGER UNSIGNED NOT NULL,
`related_to_person_id` INTEGER UNSIGNED NOT NULL,
`relationship_type_id` INTEGER UNSIGNED NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `other_contact_info`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`person_id` INTEGER UNSIGNED NOT NULL,
`other_contact_method_id` INTEGER UNSIGNED NOT NULL,
`value` VARCHAR(200),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `checkingaccountlookup_person_assn`
(
`checking_account_lookup_id` INTEGER UNSIGNED NOT NULL,
`person_id` INTEGER UNSIGNED NOT NULL,
PRIMARY KEY (`checking_account_lookup_id`,`person_id`)
) ENGINE=InnoDB;

CREATE TABLE `person_nameitem_assn`
(
`person_id` INTEGER UNSIGNED NOT NULL,
`name_item_id` INTEGER UNSIGNED NOT NULL,
PRIMARY KEY (`person_id`,`name_item_id`)
) ENGINE=InnoDB;

CREATE TABLE `stewardship_pledge`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`person_id` INTEGER UNSIGNED NOT NULL,
`stewardship_fund_id` INTEGER UNSIGNED NOT NULL,
`date_started` DATE,
`date_ended` DATE,
`pledge_amount` DECIMAL(10,2),
`contributed_amount` DECIMAL(10,2),
`remaining_amount` DECIMAL(10,2),
`fulfilled_flag` BOOLEAN NOT NULL,
`active_flag` BOOLEAN NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `search_query`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`description` TEXT,
`smart_group_id` INTEGER UNSIGNED UNIQUE,
`person_id` INTEGER UNSIGNED,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `parent_pager_individual`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`server_identifier` INTEGER UNSIGNED NOT NULL UNIQUE,
`person_id` INTEGER UNSIGNED,
`hidden_flag` BOOLEAN NOT NULL,
`parent_pager_sync_status_type_id` INTEGER UNSIGNED NOT NULL,
`parent_pager_household_id` INTEGER UNSIGNED,
`first_name` VARCHAR(50),
`middle_name` VARCHAR(50),
`last_name` VARCHAR(50),
`prefix` VARCHAR(20),
`suffix` VARCHAR(20),
`nickname` VARCHAR(50),
`graduation_year` INTEGER,
`gender` VARCHAR(1),
`date_of_birth` DATE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `attribute_value`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`attribute_id` INTEGER UNSIGNED NOT NULL,
`person_id` INTEGER UNSIGNED NOT NULL,
`date_value` DATE,
`datetime_value` DATETIME,
`text_value` TEXT,
`boolean_value` BOOLEAN,
`single_attribute_option_id` INTEGER UNSIGNED,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `communicationlist_person_assn`
(
`communication_list_id` INTEGER UNSIGNED NOT NULL,
`person_id` INTEGER UNSIGNED NOT NULL,
PRIMARY KEY (`communication_list_id`,`person_id`)
) ENGINE=InnoDB;

CREATE TABLE `address`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`address_type_id` INTEGER UNSIGNED NOT NULL,
`person_id` INTEGER UNSIGNED,
`household_id` INTEGER UNSIGNED,
`primary_phone_id` INTEGER UNSIGNED,
`address_1` VARCHAR(200),
`address_2` VARCHAR(200),
`address_3` VARCHAR(200),
`city` VARCHAR(100),
`state` VARCHAR(100),
`zip_code` VARCHAR(10),
`country` VARCHAR(2),
`current_flag` BOOLEAN,
`invalid_flag` BOOLEAN,
`verification_checked_flag` BOOLEAN,
`date_until_when` DATE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `phone`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`phone_type_id` INTEGER UNSIGNED NOT NULL,
`address_id` INTEGER UNSIGNED,
`person_id` INTEGER UNSIGNED,
`mobile_provider_id` INTEGER UNSIGNED,
`number` VARCHAR(20),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `person`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`membership_status_type_id` INTEGER UNSIGNED NOT NULL,
`marital_status_type_id` INTEGER UNSIGNED NOT NULL,
`first_name` VARCHAR(100),
`middle_name` VARCHAR(100),
`last_name` VARCHAR(100),
`mailing_label` VARCHAR(200),
`prior_last_names` VARCHAR(255),
`nickname` VARCHAR(100),
`title` VARCHAR(40),
`suffix` VARCHAR(40),
`gender` VARCHAR(1),
`date_of_birth` DATE,
`dob_year_approximate_flag` BOOLEAN,
`dob_guessed_flag` BOOLEAN,
`age` INTEGER,
`deceased_flag` BOOLEAN NOT NULL,
`date_deceased` DATE,
`current_head_shot_id` INTEGER UNSIGNED UNIQUE,
`mailing_address_id` INTEGER UNSIGNED,
`stewardship_address_id` INTEGER UNSIGNED,
`primary_phone_id` INTEGER UNSIGNED,
`primary_email_id` INTEGER UNSIGNED UNIQUE,
`can_mail_flag` BOOLEAN,
`can_phone_flag` BOOLEAN,
`can_email_flag` BOOLEAN,
`primary_address_text` VARCHAR(255),
`primary_city_text` VARCHAR(100),
`primary_state_text` VARCHAR(2),
`primary_zip_code_text` VARCHAR(10),
`primary_phone_text` VARCHAR(20),
`public_creation_flag` BOOLEAN,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `signup_entry`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`signup_form_id` INTEGER UNSIGNED NOT NULL,
`person_id` INTEGER UNSIGNED NOT NULL,
`signup_by_person_id` INTEGER UNSIGNED NOT NULL,
`signup_entry_status_type_id` INTEGER UNSIGNED NOT NULL,
`date_created` DATETIME NOT NULL,
`date_submitted` DATETIME,
`amount_total` DECIMAL(10,2),
`amount_paid` DECIMAL(10,2),
`amount_balance` DECIMAL(10,2),
`internal_notes` TEXT,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `form_answer`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`signup_entry_id` INTEGER UNSIGNED NOT NULL,
`form_question_id` INTEGER UNSIGNED NOT NULL,
`text_value` TEXT,
`address_id` INTEGER UNSIGNED,
`phone_id` INTEGER UNSIGNED,
`email_id` INTEGER UNSIGNED,
`integer_value` INTEGER,
`boolean_value` BOOLEAN,
`date_value` DATE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `signup_product`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`signup_entry_id` INTEGER UNSIGNED NOT NULL,
`form_product_id` INTEGER UNSIGNED NOT NULL,
`quantity` INTEGER UNSIGNED NOT NULL,
`amount` DECIMAL(10,2),
`deposit` DECIMAL(10,2),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `login`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`role_type_id` INTEGER UNSIGNED NOT NULL,
`permission_bitmap` INTEGER UNSIGNED,
`username` VARCHAR(40) UNIQUE,
`password_cache` VARCHAR(200),
`password_last_set` VARCHAR(200),
`date_last_login` DATETIME,
`domain_active_flag` BOOLEAN,
`login_active_flag` BOOLEAN,
`email` VARCHAR(200) UNIQUE,
`first_name` VARCHAR(100),
`middle_initial` VARCHAR(1),
`last_name` VARCHAR(100),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `comment`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`person_id` INTEGER UNSIGNED NOT NULL,
`posted_by_login_id` INTEGER UNSIGNED NOT NULL,
`comment_privacy_type_id` INTEGER UNSIGNED NOT NULL,
`comment_category_id` INTEGER UNSIGNED NOT NULL,
`comment` TEXT,
`date_posted` DATETIME NOT NULL,
`date_action` DATE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ministry_login_assn`
(
`ministry_id` INTEGER UNSIGNED NOT NULL,
`login_id` INTEGER UNSIGNED NOT NULL,
PRIMARY KEY (`ministry_id`,`login_id`)
) ENGINE=InnoDB;

CREATE TABLE `class_instructor`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`display_name` VARCHAR(100),
`login_id` INTEGER UNSIGNED UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `class_meeting`
(
`signup_form_id` INTEGER UNSIGNED NOT NULL,
`class_term_id` INTEGER UNSIGNED NOT NULL,
`class_course_id` INTEGER UNSIGNED NOT NULL,
`class_instructor_id` INTEGER UNSIGNED NOT NULL,
`date_start` DATE NOT NULL,
`date_end` DATE NOT NULL,
`location` VARCHAR(200),
`meeting_day` INTEGER,
`meeting_start_time` INTEGER,
`meeting_end_time` INTEGER,
PRIMARY KEY (`signup_form_id`)
) ENGINE=InnoDB;

CREATE TABLE `class_registration`
(
`signup_entry_id` INTEGER UNSIGNED NOT NULL,
`class_meeting_id` INTEGER UNSIGNED NOT NULL,
`person_id` INTEGER UNSIGNED NOT NULL,
`class_grade_id` INTEGER UNSIGNED,
`childcare_notes` TEXT,
PRIMARY KEY (`signup_entry_id`)
) ENGINE=InnoDB;

CREATE TABLE `class_attendence`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`class_registration_id` INTEGER UNSIGNED NOT NULL,
`meeting_number` INTEGER UNSIGNED NOT NULL,
`present_flag` BOOLEAN,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `sms_message`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`group_id` INTEGER UNSIGNED NOT NULL,
`login_id` INTEGER UNSIGNED NOT NULL,
`subject` VARCHAR(100),
`body` VARCHAR(200),
`date_queued` DATETIME NOT NULL,
`date_sent` DATETIME,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `online_donation_line_item`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`online_donation_id` INTEGER UNSIGNED NOT NULL,
`amount` DECIMAL(10,2),
`donation_flag` BOOLEAN NOT NULL,
`stewardship_fund_id` INTEGER UNSIGNED,
`other` VARCHAR(255),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `email_message_route`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`email_message_id` INTEGER UNSIGNED NOT NULL,
`group_id` INTEGER UNSIGNED,
`communication_list_id` INTEGER UNSIGNED,
`login_id` INTEGER UNSIGNED,
`communication_list_entry_id` INTEGER UNSIGNED,
`person_id` INTEGER UNSIGNED,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `stewardship_batch`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`stewardship_batch_status_type_id` INTEGER UNSIGNED NOT NULL,
`date_entered` DATE NOT NULL,
`date_credited` DATE NOT NULL,
`batch_label` VARCHAR(1) NOT NULL,
`description` VARCHAR(255),
`item_count` INTEGER,
`reported_total_amount` DECIMAL(10,2),
`actual_total_amount` DECIMAL(10,2),
`posted_total_amount` DECIMAL(10,2),
`created_by_login_id` INTEGER UNSIGNED NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `paypal_batch`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`number` VARCHAR(20) UNIQUE,
`date_received` DATETIME,
`date_reconciled` DATETIME,
`reconciled_flag` BOOLEAN NOT NULL,
`stewardship_batch_id` INTEGER UNSIGNED UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `stewardship_stack`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`stewardship_batch_id` INTEGER UNSIGNED NOT NULL,
`stack_number` INTEGER UNSIGNED NOT NULL,
`item_count` INTEGER,
`reported_total_amount` DECIMAL(10,2),
`actual_total_amount` DECIMAL(10,2),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `stewardship_post`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`stewardship_batch_id` INTEGER UNSIGNED NOT NULL,
`post_number` INTEGER UNSIGNED NOT NULL,
`date_posted` DATETIME NOT NULL,
`total_amount` DECIMAL(10,2),
`created_by_login_id` INTEGER UNSIGNED NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `stewardship_post_amount`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`stewardship_post_id` INTEGER UNSIGNED NOT NULL,
`stewardship_fund_id` INTEGER UNSIGNED NOT NULL,
`amount` DECIMAL(10,2),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `stewardship_contribution`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`person_id` INTEGER UNSIGNED NOT NULL,
`stewardship_contribution_type_id` INTEGER UNSIGNED NOT NULL,
`stewardship_batch_id` INTEGER UNSIGNED NOT NULL,
`stewardship_stack_id` INTEGER UNSIGNED,
`checking_account_lookup_id` INTEGER UNSIGNED,
`total_amount` DECIMAL(10,2),
`date_entered` DATETIME NOT NULL,
`date_cleared` DATETIME,
`date_credited` DATE NOT NULL,
`check_number` VARCHAR(20),
`authorization_number` VARCHAR(40),
`alternate_source` VARCHAR(200),
`non_deductible_flag` BOOLEAN,
`note` TEXT,
`created_by_login_id` INTEGER UNSIGNED NOT NULL,
`unposted_flag` BOOLEAN,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `stewardship_post_line_item`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`stewardship_post_id` INTEGER UNSIGNED NOT NULL,
`stewardship_contribution_id` INTEGER UNSIGNED NOT NULL,
`person_id` INTEGER UNSIGNED NOT NULL,
`stewardship_fund_id` INTEGER UNSIGNED NOT NULL,
`description` VARCHAR(255),
`amount` DECIMAL(10,2),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `stewardship_contribution_amount`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`stewardship_contribution_id` INTEGER UNSIGNED NOT NULL,
`stewardship_fund_id` INTEGER UNSIGNED NOT NULL,
`amount` DECIMAL(10,2),
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `credit_card_payment`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`credit_card_status_type_id` INTEGER UNSIGNED NOT NULL,
`credit_card_type_id` INTEGER UNSIGNED NOT NULL,
`credit_card_last_four` VARCHAR(4) NOT NULL,
`transaction_code` VARCHAR(40) NOT NULL UNIQUE,
`authorization_code` VARCHAR(40),
`address_match_code` VARCHAR(3),
`date_authorized` DATETIME,
`date_captured` DATETIME,
`amount_charged` DECIMAL(10,2),
`amount_fee` DECIMAL(10,2),
`amount_cleared` DECIMAL(10,2),
`paypal_batch_id` INTEGER UNSIGNED,
`unlinked_flag` BOOLEAN,
`stewardship_contribution_id` INTEGER UNSIGNED UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `signup_payment`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`signup_entry_id` INTEGER UNSIGNED NOT NULL,
`signup_payment_type_id` INTEGER UNSIGNED NOT NULL,
`transaction_date` DATETIME,
`transaction_description` VARCHAR(255),
`amount` DECIMAL(10,2),
`funding_account` VARCHAR(10),
`donation_stewardship_fund_id` INTEGER UNSIGNED,
`amount_donation` DECIMAL(10,2),
`amount_non_donation` DECIMAL(10,2),
`credit_card_payment_id` INTEGER UNSIGNED UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `online_donation`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`person_id` INTEGER UNSIGNED NOT NULL,
`confirmation_email` VARCHAR(255),
`amount` DECIMAL(10,2),
`credit_card_payment_id` INTEGER UNSIGNED UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `group_role_type`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `group_role`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`ministry_id` INTEGER UNSIGNED NOT NULL,
`name` VARCHAR(100),
`group_role_type_id` INTEGER UNSIGNED NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `group_participation`
(
`id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`person_id` INTEGER UNSIGNED NOT NULL,
`group_id` INTEGER UNSIGNED NOT NULL,
`group_role_id` INTEGER UNSIGNED,
`date_start` DATE NOT NULL,
`date_end` DATE,
`moderator_flag` BOOLEAN,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `permission_type`
(
`id` INTEGER UNSIGNED NOT NULL,
`name` VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE INDEX `error_flag_idx` ON `outgoing_email_queue`(`error_flag`);
CREATE INDEX `active_flag_idx` ON `class_term`(`active_flag`);
CREATE UNIQUE INDEX `checking_account_lookup_idx` ON `checking_account_lookup` (`transit_hash`,`account_hash`);

CREATE INDEX `query_node_type_id_idx` ON `query_node`(`query_node_type_id`);
ALTER TABLE `query_node` ADD FOREIGN KEY query_node_type_id_idxfk (`query_node_type_id`) REFERENCES `query_node_type` (`id`);

CREATE INDEX `query_data_type_id_idx` ON `query_node`(`query_data_type_id`);
ALTER TABLE `query_node` ADD FOREIGN KEY query_data_type_id_idxfk (`query_data_type_id`) REFERENCES `query_data_type` (`id`);

CREATE INDEX `attribute_data_type_id_idx` ON `attribute`(`attribute_data_type_id`);
ALTER TABLE `attribute` ADD FOREIGN KEY attribute_data_type_id_idxfk (`attribute_data_type_id`) REFERENCES `attribute_data_type` (`id`);

CREATE INDEX `parent_ministry_id_idx` ON `ministry`(`parent_ministry_id`);
ALTER TABLE `ministry` ADD FOREIGN KEY parent_ministry_id_idxfk (`parent_ministry_id`) REFERENCES `ministry` (`id`);

CREATE INDEX `active_flag_idx` ON `ministry`(`active_flag`);
CREATE INDEX `ministry_id_idx` ON `stewardship_fund`(`ministry_id`);
ALTER TABLE `stewardship_fund` ADD FOREIGN KEY ministry_id_idxfk (`ministry_id`) REFERENCES `ministry` (`id`);

CREATE INDEX `active_flag_idx` ON `stewardship_fund`(`active_flag`);
CREATE INDEX `external_flag_idx` ON `stewardship_fund`(`external_flag`);
CREATE INDEX `signup_form_type_id_idx` ON `signup_form`(`signup_form_type_id`);
ALTER TABLE `signup_form` ADD FOREIGN KEY signup_form_type_id_idxfk (`signup_form_type_id`) REFERENCES `signup_form_type` (`id`);

CREATE INDEX `ministry_id_idx` ON `signup_form`(`ministry_id`);
ALTER TABLE `signup_form` ADD FOREIGN KEY ministry_id_idxfk_1 (`ministry_id`) REFERENCES `ministry` (`id`);

CREATE INDEX `donation_stewardship_fund_id_idx` ON `signup_form`(`donation_stewardship_fund_id`);
ALTER TABLE `signup_form` ADD FOREIGN KEY donation_stewardship_fund_id_idxfk (`donation_stewardship_fund_id`) REFERENCES `stewardship_fund` (`id`);

CREATE INDEX `form_product_idx` ON `form_product` (`signup_form_id`,`form_product_type_id`);

CREATE INDEX `signup_form_id_idx` ON `form_product`(`signup_form_id`);
ALTER TABLE `form_product` ADD FOREIGN KEY signup_form_id_idxfk (`signup_form_id`) REFERENCES `signup_form` (`id`);

CREATE INDEX `form_product_type_id_idx` ON `form_product`(`form_product_type_id`);
ALTER TABLE `form_product` ADD FOREIGN KEY form_product_type_id_idxfk (`form_product_type_id`) REFERENCES `form_product_type` (`id`);

CREATE INDEX `form_payment_type_id_idx` ON `form_product`(`form_payment_type_id`);
ALTER TABLE `form_product` ADD FOREIGN KEY form_payment_type_id_idxfk (`form_payment_type_id`) REFERENCES `form_payment_type` (`id`);

ALTER TABLE `event_signup_form` ADD FOREIGN KEY signup_form_id_idxfk_1 (`signup_form_id`) REFERENCES `signup_form` (`id`);

CREATE INDEX `group_type_id_idx` ON `group`(`group_type_id`);
ALTER TABLE `group` ADD FOREIGN KEY group_type_id_idxfk (`group_type_id`) REFERENCES `group_type` (`id`);

CREATE INDEX `ministry_id_idx` ON `group`(`ministry_id`);
ALTER TABLE `group` ADD FOREIGN KEY ministry_id_idxfk_2 (`ministry_id`) REFERENCES `ministry` (`id`);

CREATE INDEX `parent_group_id_idx` ON `group`(`parent_group_id`);
ALTER TABLE `group` ADD FOREIGN KEY parent_group_id_idxfk (`parent_group_id`) REFERENCES `group` (`id`);

CREATE INDEX `email_broadcast_type_id_idx` ON `group`(`email_broadcast_type_id`);
ALTER TABLE `group` ADD FOREIGN KEY email_broadcast_type_id_idxfk (`email_broadcast_type_id`) REFERENCES `email_broadcast_type` (`id`);

ALTER TABLE `group_category` ADD FOREIGN KEY group_id_idxfk (`group_id`) REFERENCES `group` (`id`);

ALTER TABLE `smart_group` ADD FOREIGN KEY group_id_idxfk_1 (`group_id`) REFERENCES `group` (`id`);

CREATE UNIQUE INDEX `attribute_option_idx` ON `attribute_option` (`attribute_id`,`name`);

CREATE INDEX `attribute_id_idx` ON `attribute_option`(`attribute_id`);
ALTER TABLE `attribute_option` ADD FOREIGN KEY attribute_id_idxfk (`attribute_id`) REFERENCES `attribute` (`id`);

ALTER TABLE `growth_group` ADD FOREIGN KEY group_id_idxfk_2 (`group_id`) REFERENCES `group` (`id`);

CREATE INDEX `growth_group_location_id_idx` ON `growth_group`(`growth_group_location_id`);
ALTER TABLE `growth_group` ADD FOREIGN KEY growth_group_location_id_idxfk (`growth_group_location_id`) REFERENCES `growth_group_location` (`id`);

CREATE INDEX `growth_group_day_type_id_idx` ON `growth_group`(`growth_group_day_type_id`);
ALTER TABLE `growth_group` ADD FOREIGN KEY growth_group_day_type_id_idxfk (`growth_group_day_type_id`) REFERENCES `growth_group_day_type` (`id`);

CREATE INDEX `signup_form_id_idx` ON `form_question`(`signup_form_id`);
ALTER TABLE `form_question` ADD FOREIGN KEY signup_form_id_idxfk_2 (`signup_form_id`) REFERENCES `signup_form` (`id`);

CREATE INDEX `form_question_type_id_idx` ON `form_question`(`form_question_type_id`);
ALTER TABLE `form_question` ADD FOREIGN KEY form_question_type_id_idxfk (`form_question_type_id`) REFERENCES `form_question_type` (`id`);

CREATE INDEX `email_broadcast_type_id_idx` ON `communication_list`(`email_broadcast_type_id`);
ALTER TABLE `communication_list` ADD FOREIGN KEY email_broadcast_type_id_idxfk_1 (`email_broadcast_type_id`) REFERENCES `email_broadcast_type` (`id`);

CREATE INDEX `ministry_id_idx` ON `communication_list`(`ministry_id`);
ALTER TABLE `communication_list` ADD FOREIGN KEY ministry_id_idxfk_3 (`ministry_id`) REFERENCES `ministry` (`id`);

ALTER TABLE `communicationlist_communicationlistentry_assn` ADD FOREIGN KEY communication_list_id_idxfk (`communication_list_id`) REFERENCES `communication_list` (`id`);

ALTER TABLE `communicationlist_communicationlistentry_assn` ADD FOREIGN KEY communication_list_entry_id_idxfk (`communication_list_entry_id`) REFERENCES `communication_list_entry` (`id`);

CREATE INDEX `email_message_status_type_id_idx` ON `email_message`(`email_message_status_type_id`);
ALTER TABLE `email_message` ADD FOREIGN KEY email_message_status_type_id_idxfk (`email_message_status_type_id`) REFERENCES `email_message_status_type` (`id`);

CREATE INDEX `email_outgoing_queue_idx` ON `email_outgoing_queue` (`email_message_id`,`token`);

CREATE INDEX `email_outgoing_queue_idx_1` ON `email_outgoing_queue` (`email_message_id`,`error_flag`);

CREATE INDEX `email_message_id_idx` ON `email_outgoing_queue`(`email_message_id`);
ALTER TABLE `email_outgoing_queue` ADD FOREIGN KEY email_message_id_idxfk (`email_message_id`) REFERENCES `email_message` (`id`);

ALTER TABLE `growthgroupstructure_growthgroup_assn` ADD FOREIGN KEY growth_group_structure_id_idxfk (`growth_group_structure_id`) REFERENCES `growth_group_structure` (`id`);

ALTER TABLE `growthgroupstructure_growthgroup_assn` ADD FOREIGN KEY growth_group_id_idxfk (`growth_group_id`) REFERENCES `growth_group` (`group_id`);

CREATE INDEX `classified_post_idx` ON `classified_post` (`classified_category_id`,`approval_flag`,`date_expired`);

CREATE INDEX `classified_category_id_idx` ON `classified_post`(`classified_category_id`);
ALTER TABLE `classified_post` ADD FOREIGN KEY classified_category_id_idxfk (`classified_category_id`) REFERENCES `classified_category` (`id`);

ALTER TABLE `provisional_public_login` ADD FOREIGN KEY public_login_id_idxfk (`public_login_id`) REFERENCES `public_login` (`id`);

CREATE INDEX `household_id_idx` ON `household_split`(`household_id`);
ALTER TABLE `household_split` ADD FOREIGN KEY household_id_idxfk (`household_id`) REFERENCES `household` (`id`);

CREATE INDEX `split_household_id_idx` ON `household_split`(`split_household_id`);
ALTER TABLE `household_split` ADD FOREIGN KEY split_household_id_idxfk (`split_household_id`) REFERENCES `household` (`id`);

CREATE INDEX `household_id_idx` ON `parent_pager_household`(`household_id`);
ALTER TABLE `parent_pager_household` ADD FOREIGN KEY household_id_idxfk_1 (`household_id`) REFERENCES `household` (`id`);

CREATE INDEX `hidden_flag_idx` ON `parent_pager_household`(`hidden_flag`);
CREATE INDEX `parent_pager_sync_status_type_id_idx` ON `parent_pager_household`(`parent_pager_sync_status_type_id`);
ALTER TABLE `parent_pager_household` ADD FOREIGN KEY parent_pager_sync_status_type_id_idxfk (`parent_pager_sync_status_type_id`) REFERENCES `parent_pager_sync_status_type` (`id`);

CREATE INDEX `search_query_id_idx` ON `query_condition`(`search_query_id`);
ALTER TABLE `query_condition` ADD FOREIGN KEY search_query_id_idxfk (`search_query_id`) REFERENCES `search_query` (`id`);

ALTER TABLE `query_condition` ADD FOREIGN KEY or_query_condition_id_idxfk (`or_query_condition_id`) REFERENCES `query_condition` (`id`);

CREATE INDEX `query_operation_id_idx` ON `query_condition`(`query_operation_id`);
ALTER TABLE `query_condition` ADD FOREIGN KEY query_operation_id_idxfk (`query_operation_id`) REFERENCES `query_operation` (`id`);

CREATE INDEX `query_node_id_idx` ON `query_condition`(`query_node_id`);
ALTER TABLE `query_condition` ADD FOREIGN KEY query_node_id_idxfk (`query_node_id`) REFERENCES `query_node` (`id`);

CREATE INDEX `parent_pager_individual_id_idx` ON `parent_pager_child_history`(`parent_pager_individual_id`);
ALTER TABLE `parent_pager_child_history` ADD FOREIGN KEY parent_pager_individual_id_idxfk (`parent_pager_individual_id`) REFERENCES `parent_pager_individual` (`id`);

CREATE INDEX `parent_pager_station_id_idx` ON `parent_pager_child_history`(`parent_pager_station_id`);
ALTER TABLE `parent_pager_child_history` ADD FOREIGN KEY parent_pager_station_id_idxfk (`parent_pager_station_id`) REFERENCES `parent_pager_station` (`id`);

CREATE INDEX `parent_pager_period_id_idx` ON `parent_pager_child_history`(`parent_pager_period_id`);
ALTER TABLE `parent_pager_child_history` ADD FOREIGN KEY parent_pager_period_id_idxfk (`parent_pager_period_id`) REFERENCES `parent_pager_period` (`id`);

CREATE INDEX `dropoff_by_parent_pager_individual_id_idx` ON `parent_pager_child_history`(`dropoff_by_parent_pager_individual_id`);
ALTER TABLE `parent_pager_child_history` ADD FOREIGN KEY dropoff_by_parent_pager_individual_id_idxfk (`dropoff_by_parent_pager_individual_id`) REFERENCES `parent_pager_individual` (`id`);

CREATE INDEX `pickup_by_parent_pager_individual_id_idx` ON `parent_pager_child_history`(`pickup_by_parent_pager_individual_id`);
ALTER TABLE `parent_pager_child_history` ADD FOREIGN KEY pickup_by_parent_pager_individual_id_idxfk (`pickup_by_parent_pager_individual_id`) REFERENCES `parent_pager_individual` (`id`);

CREATE INDEX `parent_pager_individual_id_idx` ON `parent_pager_attendant_history`(`parent_pager_individual_id`);
ALTER TABLE `parent_pager_attendant_history` ADD FOREIGN KEY parent_pager_individual_id_idxfk_1 (`parent_pager_individual_id`) REFERENCES `parent_pager_individual` (`id`);

CREATE INDEX `parent_pager_station_id_idx` ON `parent_pager_attendant_history`(`parent_pager_station_id`);
ALTER TABLE `parent_pager_attendant_history` ADD FOREIGN KEY parent_pager_station_id_idxfk_1 (`parent_pager_station_id`) REFERENCES `parent_pager_station` (`id`);

CREATE INDEX `parent_pager_period_id_idx` ON `parent_pager_attendant_history`(`parent_pager_period_id`);
ALTER TABLE `parent_pager_attendant_history` ADD FOREIGN KEY parent_pager_period_id_idxfk_1 (`parent_pager_period_id`) REFERENCES `parent_pager_period` (`id`);

CREATE INDEX `parent_pager_program_id_idx` ON `parent_pager_attendant_history`(`parent_pager_program_id`);
ALTER TABLE `parent_pager_attendant_history` ADD FOREIGN KEY parent_pager_program_id_idxfk (`parent_pager_program_id`) REFERENCES `parent_pager_program` (`id`);

CREATE INDEX `parent_pager_individual_id_idx` ON `parent_pager_address`(`parent_pager_individual_id`);
ALTER TABLE `parent_pager_address` ADD FOREIGN KEY parent_pager_individual_id_idxfk_2 (`parent_pager_individual_id`) REFERENCES `parent_pager_individual` (`id`);

CREATE INDEX `parent_pager_household_id_idx` ON `parent_pager_address`(`parent_pager_household_id`);
ALTER TABLE `parent_pager_address` ADD FOREIGN KEY parent_pager_household_id_idxfk (`parent_pager_household_id`) REFERENCES `parent_pager_household` (`id`);

ALTER TABLE `attributevalue_multipleattributeoption_assn` ADD FOREIGN KEY attribute_value_id_idxfk (`attribute_value_id`) REFERENCES `attribute_value` (`id`);

ALTER TABLE `attributevalue_multipleattributeoption_assn` ADD FOREIGN KEY attribute_option_id_idxfk (`attribute_option_id`) REFERENCES `attribute_option` (`id`);

ALTER TABLE `public_login` ADD FOREIGN KEY person_id_idxfk (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `person_id_idx` ON `email`(`person_id`);
ALTER TABLE `email` ADD FOREIGN KEY person_id_idxfk_1 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `address_idx` ON `email`(`address`);
ALTER TABLE `household` ADD FOREIGN KEY head_person_id_idxfk (`head_person_id`) REFERENCES `person` (`id`);

ALTER TABLE `marriage` ADD FOREIGN KEY linked_marriage_id_idxfk (`linked_marriage_id`) REFERENCES `marriage` (`id`);

CREATE INDEX `person_id_idx` ON `marriage`(`person_id`);
ALTER TABLE `marriage` ADD FOREIGN KEY person_id_idxfk_2 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `married_to_person_id_idx` ON `marriage`(`married_to_person_id`);
ALTER TABLE `marriage` ADD FOREIGN KEY married_to_person_id_idxfk (`married_to_person_id`) REFERENCES `person` (`id`);

CREATE INDEX `marriage_status_type_id_idx` ON `marriage`(`marriage_status_type_id`);
ALTER TABLE `marriage` ADD FOREIGN KEY marriage_status_type_id_idxfk (`marriage_status_type_id`) REFERENCES `marriage_status_type` (`id`);

CREATE INDEX `membership_idx` ON `membership` (`person_id`,`date_end`);

CREATE INDEX `person_id_idx` ON `membership`(`person_id`);
ALTER TABLE `membership` ADD FOREIGN KEY person_id_idxfk_3 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `date_start_idx` ON `membership`(`date_start`);
CREATE UNIQUE INDEX `household_participation_idx` ON `household_participation` (`person_id`,`household_id`);

CREATE INDEX `person_id_idx` ON `household_participation`(`person_id`);
ALTER TABLE `household_participation` ADD FOREIGN KEY person_id_idxfk_4 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `household_id_idx` ON `household_participation`(`household_id`);
ALTER TABLE `household_participation` ADD FOREIGN KEY household_id_idxfk_2 (`household_id`) REFERENCES `household` (`id`);

CREATE INDEX `person_id_idx` ON `head_shot`(`person_id`);
ALTER TABLE `head_shot` ADD FOREIGN KEY person_id_idxfk_5 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `image_type_id_idx` ON `head_shot`(`image_type_id`);
ALTER TABLE `head_shot` ADD FOREIGN KEY image_type_id_idxfk (`image_type_id`) REFERENCES `image_type` (`id`);

CREATE UNIQUE INDEX `relationship_idx` ON `relationship` (`person_id`,`related_to_person_id`);

CREATE INDEX `person_id_idx` ON `relationship`(`person_id`);
ALTER TABLE `relationship` ADD FOREIGN KEY person_id_idxfk_6 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `related_to_person_id_idx` ON `relationship`(`related_to_person_id`);
ALTER TABLE `relationship` ADD FOREIGN KEY related_to_person_id_idxfk (`related_to_person_id`) REFERENCES `person` (`id`);

CREATE INDEX `relationship_type_id_idx` ON `relationship`(`relationship_type_id`);
ALTER TABLE `relationship` ADD FOREIGN KEY relationship_type_id_idxfk (`relationship_type_id`) REFERENCES `relationship_type` (`id`);

CREATE INDEX `person_id_idx` ON `other_contact_info`(`person_id`);
ALTER TABLE `other_contact_info` ADD FOREIGN KEY person_id_idxfk_7 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `other_contact_method_id_idx` ON `other_contact_info`(`other_contact_method_id`);
ALTER TABLE `other_contact_info` ADD FOREIGN KEY other_contact_method_id_idxfk (`other_contact_method_id`) REFERENCES `other_contact_method` (`id`);

ALTER TABLE `checkingaccountlookup_person_assn` ADD FOREIGN KEY checking_account_lookup_id_idxfk (`checking_account_lookup_id`) REFERENCES `checking_account_lookup` (`id`);

ALTER TABLE `checkingaccountlookup_person_assn` ADD FOREIGN KEY person_id_idxfk_8 (`person_id`) REFERENCES `person` (`id`);

ALTER TABLE `person_nameitem_assn` ADD FOREIGN KEY person_id_idxfk_9 (`person_id`) REFERENCES `person` (`id`);

ALTER TABLE `person_nameitem_assn` ADD FOREIGN KEY name_item_id_idxfk (`name_item_id`) REFERENCES `name_item` (`id`);

CREATE UNIQUE INDEX `stewardship_pledge_idx` ON `stewardship_pledge` (`person_id`,`stewardship_fund_id`);

CREATE INDEX `stewardship_pledge_idx_1` ON `stewardship_pledge` (`fulfilled_flag`,`active_flag`);

CREATE INDEX `person_id_idx` ON `stewardship_pledge`(`person_id`);
ALTER TABLE `stewardship_pledge` ADD FOREIGN KEY person_id_idxfk_10 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `stewardship_fund_id_idx` ON `stewardship_pledge`(`stewardship_fund_id`);
ALTER TABLE `stewardship_pledge` ADD FOREIGN KEY stewardship_fund_id_idxfk (`stewardship_fund_id`) REFERENCES `stewardship_fund` (`id`);

ALTER TABLE `search_query` ADD FOREIGN KEY smart_group_id_idxfk (`smart_group_id`) REFERENCES `smart_group` (`group_id`);

CREATE INDEX `person_id_idx` ON `search_query`(`person_id`);
ALTER TABLE `search_query` ADD FOREIGN KEY person_id_idxfk_11 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `person_id_idx` ON `parent_pager_individual`(`person_id`);
ALTER TABLE `parent_pager_individual` ADD FOREIGN KEY person_id_idxfk_12 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `hidden_flag_idx` ON `parent_pager_individual`(`hidden_flag`);
CREATE INDEX `parent_pager_sync_status_type_id_idx` ON `parent_pager_individual`(`parent_pager_sync_status_type_id`);
ALTER TABLE `parent_pager_individual` ADD FOREIGN KEY parent_pager_sync_status_type_id_idxfk_1 (`parent_pager_sync_status_type_id`) REFERENCES `parent_pager_sync_status_type` (`id`);

CREATE INDEX `parent_pager_household_id_idx` ON `parent_pager_individual`(`parent_pager_household_id`);
ALTER TABLE `parent_pager_individual` ADD FOREIGN KEY parent_pager_household_id_idxfk_1 (`parent_pager_household_id`) REFERENCES `parent_pager_household` (`id`);

CREATE UNIQUE INDEX `attribute_value_idx` ON `attribute_value` (`attribute_id`,`person_id`);

CREATE INDEX `attribute_id_idx` ON `attribute_value`(`attribute_id`);
ALTER TABLE `attribute_value` ADD FOREIGN KEY attribute_id_idxfk_1 (`attribute_id`) REFERENCES `attribute` (`id`);

CREATE INDEX `person_id_idx` ON `attribute_value`(`person_id`);
ALTER TABLE `attribute_value` ADD FOREIGN KEY person_id_idxfk_13 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `single_attribute_option_id_idx` ON `attribute_value`(`single_attribute_option_id`);
ALTER TABLE `attribute_value` ADD FOREIGN KEY single_attribute_option_id_idxfk (`single_attribute_option_id`) REFERENCES `attribute_option` (`id`);

ALTER TABLE `communicationlist_person_assn` ADD FOREIGN KEY communication_list_id_idxfk_1 (`communication_list_id`) REFERENCES `communication_list` (`id`);

ALTER TABLE `communicationlist_person_assn` ADD FOREIGN KEY person_id_idxfk_14 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `address_idx` ON `address` (`household_id`,`current_flag`);

CREATE INDEX `address_type_id_idx` ON `address`(`address_type_id`);
ALTER TABLE `address` ADD FOREIGN KEY address_type_id_idxfk (`address_type_id`) REFERENCES `address_type` (`id`);

CREATE INDEX `person_id_idx` ON `address`(`person_id`);
ALTER TABLE `address` ADD FOREIGN KEY person_id_idxfk_15 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `household_id_idx` ON `address`(`household_id`);
ALTER TABLE `address` ADD FOREIGN KEY household_id_idxfk_3 (`household_id`) REFERENCES `household` (`id`);

CREATE INDEX `primary_phone_id_idx` ON `address`(`primary_phone_id`);
ALTER TABLE `address` ADD FOREIGN KEY primary_phone_id_idxfk (`primary_phone_id`) REFERENCES `phone` (`id`);

CREATE INDEX `verification_checked_flag_idx` ON `address`(`verification_checked_flag`);
CREATE INDEX `phone_type_id_idx` ON `phone`(`phone_type_id`);
ALTER TABLE `phone` ADD FOREIGN KEY phone_type_id_idxfk (`phone_type_id`) REFERENCES `phone_type` (`id`);

CREATE INDEX `address_id_idx` ON `phone`(`address_id`);
ALTER TABLE `phone` ADD FOREIGN KEY address_id_idxfk (`address_id`) REFERENCES `address` (`id`);

CREATE INDEX `person_id_idx` ON `phone`(`person_id`);
ALTER TABLE `phone` ADD FOREIGN KEY person_id_idxfk_16 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `mobile_provider_id_idx` ON `phone`(`mobile_provider_id`);
ALTER TABLE `phone` ADD FOREIGN KEY mobile_provider_id_idxfk (`mobile_provider_id`) REFERENCES `mobile_provider` (`id`);

CREATE INDEX `number_idx` ON `phone`(`number`);
CREATE INDEX `membership_status_type_id_idx` ON `person`(`membership_status_type_id`);
ALTER TABLE `person` ADD FOREIGN KEY membership_status_type_id_idxfk (`membership_status_type_id`) REFERENCES `membership_status_type` (`id`);

CREATE INDEX `marital_status_type_id_idx` ON `person`(`marital_status_type_id`);
ALTER TABLE `person` ADD FOREIGN KEY marital_status_type_id_idxfk (`marital_status_type_id`) REFERENCES `marital_status_type` (`id`);

ALTER TABLE `person` ADD FOREIGN KEY current_head_shot_id_idxfk (`current_head_shot_id`) REFERENCES `head_shot` (`id`);

CREATE INDEX `mailing_address_id_idx` ON `person`(`mailing_address_id`);
ALTER TABLE `person` ADD FOREIGN KEY mailing_address_id_idxfk (`mailing_address_id`) REFERENCES `address` (`id`);

CREATE INDEX `stewardship_address_id_idx` ON `person`(`stewardship_address_id`);
ALTER TABLE `person` ADD FOREIGN KEY stewardship_address_id_idxfk (`stewardship_address_id`) REFERENCES `address` (`id`);

CREATE INDEX `primary_phone_id_idx` ON `person`(`primary_phone_id`);
ALTER TABLE `person` ADD FOREIGN KEY primary_phone_id_idxfk_1 (`primary_phone_id`) REFERENCES `phone` (`id`);

ALTER TABLE `person` ADD FOREIGN KEY primary_email_id_idxfk (`primary_email_id`) REFERENCES `email` (`id`);

CREATE INDEX `signup_entry_idx` ON `signup_entry` (`signup_form_id`,`person_id`,`signup_entry_status_type_id`);

CREATE INDEX `signup_entry_idx_1` ON `signup_entry` (`signup_form_id`,`signup_entry_status_type_id`);

CREATE INDEX `signup_form_id_idx` ON `signup_entry`(`signup_form_id`);
ALTER TABLE `signup_entry` ADD FOREIGN KEY signup_form_id_idxfk_3 (`signup_form_id`) REFERENCES `signup_form` (`id`);

CREATE INDEX `person_id_idx` ON `signup_entry`(`person_id`);
ALTER TABLE `signup_entry` ADD FOREIGN KEY person_id_idxfk_17 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `signup_by_person_id_idx` ON `signup_entry`(`signup_by_person_id`);
ALTER TABLE `signup_entry` ADD FOREIGN KEY signup_by_person_id_idxfk (`signup_by_person_id`) REFERENCES `person` (`id`);

CREATE INDEX `signup_entry_status_type_id_idx` ON `signup_entry`(`signup_entry_status_type_id`);
ALTER TABLE `signup_entry` ADD FOREIGN KEY signup_entry_status_type_id_idxfk (`signup_entry_status_type_id`) REFERENCES `signup_entry_status_type` (`id`);

CREATE UNIQUE INDEX `form_answer_idx` ON `form_answer` (`signup_entry_id`,`form_question_id`);

CREATE INDEX `signup_entry_id_idx` ON `form_answer`(`signup_entry_id`);
ALTER TABLE `form_answer` ADD FOREIGN KEY signup_entry_id_idxfk (`signup_entry_id`) REFERENCES `signup_entry` (`id`);

CREATE INDEX `form_question_id_idx` ON `form_answer`(`form_question_id`);
ALTER TABLE `form_answer` ADD FOREIGN KEY form_question_id_idxfk (`form_question_id`) REFERENCES `form_question` (`id`);

CREATE INDEX `address_id_idx` ON `form_answer`(`address_id`);
ALTER TABLE `form_answer` ADD FOREIGN KEY address_id_idxfk_1 (`address_id`) REFERENCES `address` (`id`);

CREATE INDEX `phone_id_idx` ON `form_answer`(`phone_id`);
ALTER TABLE `form_answer` ADD FOREIGN KEY phone_id_idxfk (`phone_id`) REFERENCES `phone` (`id`);

CREATE INDEX `email_id_idx` ON `form_answer`(`email_id`);
ALTER TABLE `form_answer` ADD FOREIGN KEY email_id_idxfk (`email_id`) REFERENCES `email` (`id`);

CREATE UNIQUE INDEX `signup_product_idx` ON `signup_product` (`signup_entry_id`,`form_product_id`);

CREATE INDEX `signup_entry_id_idx` ON `signup_product`(`signup_entry_id`);
ALTER TABLE `signup_product` ADD FOREIGN KEY signup_entry_id_idxfk_1 (`signup_entry_id`) REFERENCES `signup_entry` (`id`);

CREATE INDEX `form_product_id_idx` ON `signup_product`(`form_product_id`);
ALTER TABLE `signup_product` ADD FOREIGN KEY form_product_id_idxfk (`form_product_id`) REFERENCES `form_product` (`id`);

CREATE INDEX `role_type_id_idx` ON `login`(`role_type_id`);
ALTER TABLE `login` ADD FOREIGN KEY role_type_id_idxfk (`role_type_id`) REFERENCES `role_type` (`id`);

CREATE INDEX `person_id_idx` ON `comment`(`person_id`);
ALTER TABLE `comment` ADD FOREIGN KEY person_id_idxfk_18 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `posted_by_login_id_idx` ON `comment`(`posted_by_login_id`);
ALTER TABLE `comment` ADD FOREIGN KEY posted_by_login_id_idxfk (`posted_by_login_id`) REFERENCES `login` (`id`);

CREATE INDEX `comment_privacy_type_id_idx` ON `comment`(`comment_privacy_type_id`);
ALTER TABLE `comment` ADD FOREIGN KEY comment_privacy_type_id_idxfk (`comment_privacy_type_id`) REFERENCES `comment_privacy_type` (`id`);

CREATE INDEX `comment_category_id_idx` ON `comment`(`comment_category_id`);
ALTER TABLE `comment` ADD FOREIGN KEY comment_category_id_idxfk (`comment_category_id`) REFERENCES `comment_category` (`id`);

ALTER TABLE `ministry_login_assn` ADD FOREIGN KEY ministry_id_idxfk_4 (`ministry_id`) REFERENCES `ministry` (`id`);

ALTER TABLE `ministry_login_assn` ADD FOREIGN KEY login_id_idxfk (`login_id`) REFERENCES `login` (`id`);

ALTER TABLE `class_instructor` ADD FOREIGN KEY login_id_idxfk_1 (`login_id`) REFERENCES `login` (`id`);

ALTER TABLE `class_meeting` ADD FOREIGN KEY signup_form_id_idxfk_4 (`signup_form_id`) REFERENCES `signup_form` (`id`);

CREATE INDEX `class_term_id_idx` ON `class_meeting`(`class_term_id`);
ALTER TABLE `class_meeting` ADD FOREIGN KEY class_term_id_idxfk (`class_term_id`) REFERENCES `class_term` (`id`);

CREATE INDEX `class_course_id_idx` ON `class_meeting`(`class_course_id`);
ALTER TABLE `class_meeting` ADD FOREIGN KEY class_course_id_idxfk (`class_course_id`) REFERENCES `class_course` (`id`);

CREATE INDEX `class_instructor_id_idx` ON `class_meeting`(`class_instructor_id`);
ALTER TABLE `class_meeting` ADD FOREIGN KEY class_instructor_id_idxfk (`class_instructor_id`) REFERENCES `class_instructor` (`id`);

CREATE UNIQUE INDEX `class_registration_idx` ON `class_registration` (`class_meeting_id`,`person_id`);

ALTER TABLE `class_registration` ADD FOREIGN KEY signup_entry_id_idxfk_2 (`signup_entry_id`) REFERENCES `signup_entry` (`id`);

CREATE INDEX `class_meeting_id_idx` ON `class_registration`(`class_meeting_id`);
ALTER TABLE `class_registration` ADD FOREIGN KEY class_meeting_id_idxfk (`class_meeting_id`) REFERENCES `class_meeting` (`signup_form_id`);

CREATE INDEX `person_id_idx` ON `class_registration`(`person_id`);
ALTER TABLE `class_registration` ADD FOREIGN KEY person_id_idxfk_19 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `class_grade_id_idx` ON `class_registration`(`class_grade_id`);
ALTER TABLE `class_registration` ADD FOREIGN KEY class_grade_id_idxfk (`class_grade_id`) REFERENCES `class_grade` (`id`);

CREATE UNIQUE INDEX `class_attendence_idx` ON `class_attendence` (`class_registration_id`,`meeting_number`);

CREATE INDEX `class_registration_id_idx` ON `class_attendence`(`class_registration_id`);
ALTER TABLE `class_attendence` ADD FOREIGN KEY class_registration_id_idxfk (`class_registration_id`) REFERENCES `class_registration` (`signup_entry_id`);

CREATE INDEX `meeting_number_idx` ON `class_attendence`(`meeting_number`);
CREATE INDEX `group_id_idx` ON `sms_message`(`group_id`);
ALTER TABLE `sms_message` ADD FOREIGN KEY group_id_idxfk_3 (`group_id`) REFERENCES `group` (`id`);

CREATE INDEX `login_id_idx` ON `sms_message`(`login_id`);
ALTER TABLE `sms_message` ADD FOREIGN KEY login_id_idxfk_2 (`login_id`) REFERENCES `login` (`id`);

CREATE INDEX `date_sent_idx` ON `sms_message`(`date_sent`);
CREATE INDEX `online_donation_id_idx` ON `online_donation_line_item`(`online_donation_id`);
ALTER TABLE `online_donation_line_item` ADD FOREIGN KEY online_donation_id_idxfk (`online_donation_id`) REFERENCES `online_donation` (`id`);

CREATE INDEX `stewardship_fund_id_idx` ON `online_donation_line_item`(`stewardship_fund_id`);
ALTER TABLE `online_donation_line_item` ADD FOREIGN KEY stewardship_fund_id_idxfk_1 (`stewardship_fund_id`) REFERENCES `stewardship_fund` (`id`);

CREATE INDEX `email_message_id_idx` ON `email_message_route`(`email_message_id`);
ALTER TABLE `email_message_route` ADD FOREIGN KEY email_message_id_idxfk_1 (`email_message_id`) REFERENCES `email_message` (`id`);

CREATE INDEX `group_id_idx` ON `email_message_route`(`group_id`);
ALTER TABLE `email_message_route` ADD FOREIGN KEY group_id_idxfk_4 (`group_id`) REFERENCES `group` (`id`);

CREATE INDEX `communication_list_id_idx` ON `email_message_route`(`communication_list_id`);
ALTER TABLE `email_message_route` ADD FOREIGN KEY communication_list_id_idxfk_2 (`communication_list_id`) REFERENCES `communication_list` (`id`);

CREATE INDEX `login_id_idx` ON `email_message_route`(`login_id`);
ALTER TABLE `email_message_route` ADD FOREIGN KEY login_id_idxfk_3 (`login_id`) REFERENCES `login` (`id`);

CREATE INDEX `communication_list_entry_id_idx` ON `email_message_route`(`communication_list_entry_id`);
ALTER TABLE `email_message_route` ADD FOREIGN KEY communication_list_entry_id_idxfk_1 (`communication_list_entry_id`) REFERENCES `communication_list_entry` (`id`);

CREATE INDEX `person_id_idx` ON `email_message_route`(`person_id`);
ALTER TABLE `email_message_route` ADD FOREIGN KEY person_id_idxfk_20 (`person_id`) REFERENCES `person` (`id`);

CREATE UNIQUE INDEX `stewardship_batch_idx` ON `stewardship_batch` (`date_entered`,`batch_label`);

CREATE INDEX `stewardship_batch_status_type_id_idx` ON `stewardship_batch`(`stewardship_batch_status_type_id`);
ALTER TABLE `stewardship_batch` ADD FOREIGN KEY stewardship_batch_status_type_id_idxfk (`stewardship_batch_status_type_id`) REFERENCES `stewardship_batch_status_type` (`id`);

CREATE INDEX `created_by_login_id_idx` ON `stewardship_batch`(`created_by_login_id`);
ALTER TABLE `stewardship_batch` ADD FOREIGN KEY created_by_login_id_idxfk (`created_by_login_id`) REFERENCES `login` (`id`);

ALTER TABLE `paypal_batch` ADD FOREIGN KEY stewardship_batch_id_idxfk (`stewardship_batch_id`) REFERENCES `stewardship_batch` (`id`);

CREATE UNIQUE INDEX `stewardship_stack_idx` ON `stewardship_stack` (`stewardship_batch_id`,`stack_number`);

CREATE INDEX `stewardship_batch_id_idx` ON `stewardship_stack`(`stewardship_batch_id`);
ALTER TABLE `stewardship_stack` ADD FOREIGN KEY stewardship_batch_id_idxfk_1 (`stewardship_batch_id`) REFERENCES `stewardship_batch` (`id`);

CREATE UNIQUE INDEX `stewardship_post_idx` ON `stewardship_post` (`stewardship_batch_id`,`post_number`);

CREATE INDEX `stewardship_batch_id_idx` ON `stewardship_post`(`stewardship_batch_id`);
ALTER TABLE `stewardship_post` ADD FOREIGN KEY stewardship_batch_id_idxfk_2 (`stewardship_batch_id`) REFERENCES `stewardship_batch` (`id`);

CREATE INDEX `created_by_login_id_idx` ON `stewardship_post`(`created_by_login_id`);
ALTER TABLE `stewardship_post` ADD FOREIGN KEY created_by_login_id_idxfk_1 (`created_by_login_id`) REFERENCES `login` (`id`);

CREATE INDEX `stewardship_post_id_idx` ON `stewardship_post_amount`(`stewardship_post_id`);
ALTER TABLE `stewardship_post_amount` ADD FOREIGN KEY stewardship_post_id_idxfk (`stewardship_post_id`) REFERENCES `stewardship_post` (`id`);

CREATE INDEX `stewardship_fund_id_idx` ON `stewardship_post_amount`(`stewardship_fund_id`);
ALTER TABLE `stewardship_post_amount` ADD FOREIGN KEY stewardship_fund_id_idxfk_2 (`stewardship_fund_id`) REFERENCES `stewardship_fund` (`id`);

CREATE INDEX `stewardship_contribution_idx` ON `stewardship_contribution` (`person_id`,`stewardship_contribution_type_id`);

CREATE INDEX `stewardship_contribution_idx_1` ON `stewardship_contribution` (`stewardship_batch_id`,`unposted_flag`);

CREATE INDEX `person_id_idx` ON `stewardship_contribution`(`person_id`);
ALTER TABLE `stewardship_contribution` ADD FOREIGN KEY person_id_idxfk_21 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `stewardship_contribution_type_id_idx` ON `stewardship_contribution`(`stewardship_contribution_type_id`);
ALTER TABLE `stewardship_contribution` ADD FOREIGN KEY stewardship_contribution_type_id_idxfk (`stewardship_contribution_type_id`) REFERENCES `stewardship_contribution_type` (`id`);

CREATE INDEX `stewardship_batch_id_idx` ON `stewardship_contribution`(`stewardship_batch_id`);
ALTER TABLE `stewardship_contribution` ADD FOREIGN KEY stewardship_batch_id_idxfk_3 (`stewardship_batch_id`) REFERENCES `stewardship_batch` (`id`);

CREATE INDEX `stewardship_stack_id_idx` ON `stewardship_contribution`(`stewardship_stack_id`);
ALTER TABLE `stewardship_contribution` ADD FOREIGN KEY stewardship_stack_id_idxfk (`stewardship_stack_id`) REFERENCES `stewardship_stack` (`id`);

CREATE INDEX `checking_account_lookup_id_idx` ON `stewardship_contribution`(`checking_account_lookup_id`);
ALTER TABLE `stewardship_contribution` ADD FOREIGN KEY checking_account_lookup_id_idxfk_1 (`checking_account_lookup_id`) REFERENCES `checking_account_lookup` (`id`);

CREATE INDEX `created_by_login_id_idx` ON `stewardship_contribution`(`created_by_login_id`);
ALTER TABLE `stewardship_contribution` ADD FOREIGN KEY created_by_login_id_idxfk_2 (`created_by_login_id`) REFERENCES `login` (`id`);

CREATE INDEX `stewardship_post_id_idx` ON `stewardship_post_line_item`(`stewardship_post_id`);
ALTER TABLE `stewardship_post_line_item` ADD FOREIGN KEY stewardship_post_id_idxfk_1 (`stewardship_post_id`) REFERENCES `stewardship_post` (`id`);

CREATE INDEX `stewardship_contribution_id_idx` ON `stewardship_post_line_item`(`stewardship_contribution_id`);
ALTER TABLE `stewardship_post_line_item` ADD FOREIGN KEY stewardship_contribution_id_idxfk (`stewardship_contribution_id`) REFERENCES `stewardship_contribution` (`id`);

CREATE INDEX `person_id_idx` ON `stewardship_post_line_item`(`person_id`);
ALTER TABLE `stewardship_post_line_item` ADD FOREIGN KEY person_id_idxfk_22 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `stewardship_fund_id_idx` ON `stewardship_post_line_item`(`stewardship_fund_id`);
ALTER TABLE `stewardship_post_line_item` ADD FOREIGN KEY stewardship_fund_id_idxfk_3 (`stewardship_fund_id`) REFERENCES `stewardship_fund` (`id`);

CREATE INDEX `stewardship_contribution_id_idx` ON `stewardship_contribution_amount`(`stewardship_contribution_id`);
ALTER TABLE `stewardship_contribution_amount` ADD FOREIGN KEY stewardship_contribution_id_idxfk_1 (`stewardship_contribution_id`) REFERENCES `stewardship_contribution` (`id`);

CREATE INDEX `stewardship_fund_id_idx` ON `stewardship_contribution_amount`(`stewardship_fund_id`);
ALTER TABLE `stewardship_contribution_amount` ADD FOREIGN KEY stewardship_fund_id_idxfk_4 (`stewardship_fund_id`) REFERENCES `stewardship_fund` (`id`);

CREATE INDEX `credit_card_payment_idx` ON `credit_card_payment` (`paypal_batch_id`,`unlinked_flag`);

CREATE INDEX `credit_card_status_type_id_idx` ON `credit_card_payment`(`credit_card_status_type_id`);
ALTER TABLE `credit_card_payment` ADD FOREIGN KEY credit_card_status_type_id_idxfk (`credit_card_status_type_id`) REFERENCES `credit_card_status_type` (`id`);

CREATE INDEX `credit_card_type_id_idx` ON `credit_card_payment`(`credit_card_type_id`);
ALTER TABLE `credit_card_payment` ADD FOREIGN KEY credit_card_type_id_idxfk (`credit_card_type_id`) REFERENCES `credit_card_type` (`id`);

CREATE INDEX `paypal_batch_id_idx` ON `credit_card_payment`(`paypal_batch_id`);
ALTER TABLE `credit_card_payment` ADD FOREIGN KEY paypal_batch_id_idxfk (`paypal_batch_id`) REFERENCES `paypal_batch` (`id`);

CREATE INDEX `unlinked_flag_idx` ON `credit_card_payment`(`unlinked_flag`);
ALTER TABLE `credit_card_payment` ADD FOREIGN KEY stewardship_contribution_id_idxfk_2 (`stewardship_contribution_id`) REFERENCES `stewardship_contribution` (`id`);

CREATE INDEX `signup_entry_id_idx` ON `signup_payment`(`signup_entry_id`);
ALTER TABLE `signup_payment` ADD FOREIGN KEY signup_entry_id_idxfk_3 (`signup_entry_id`) REFERENCES `signup_entry` (`id`);

CREATE INDEX `signup_payment_type_id_idx` ON `signup_payment`(`signup_payment_type_id`);
ALTER TABLE `signup_payment` ADD FOREIGN KEY signup_payment_type_id_idxfk (`signup_payment_type_id`) REFERENCES `signup_payment_type` (`id`);

CREATE INDEX `donation_stewardship_fund_id_idx` ON `signup_payment`(`donation_stewardship_fund_id`);
ALTER TABLE `signup_payment` ADD FOREIGN KEY donation_stewardship_fund_id_idxfk_1 (`donation_stewardship_fund_id`) REFERENCES `stewardship_fund` (`id`);

ALTER TABLE `signup_payment` ADD FOREIGN KEY credit_card_payment_id_idxfk (`credit_card_payment_id`) REFERENCES `credit_card_payment` (`id`);

CREATE INDEX `person_id_idx` ON `online_donation`(`person_id`);
ALTER TABLE `online_donation` ADD FOREIGN KEY person_id_idxfk_23 (`person_id`) REFERENCES `person` (`id`);

ALTER TABLE `online_donation` ADD FOREIGN KEY credit_card_payment_id_idxfk_1 (`credit_card_payment_id`) REFERENCES `credit_card_payment` (`id`);

CREATE INDEX `ministry_id_idx` ON `group_role`(`ministry_id`);
ALTER TABLE `group_role` ADD FOREIGN KEY ministry_id_idxfk_5 (`ministry_id`) REFERENCES `ministry` (`id`);

CREATE INDEX `group_role_type_id_idx` ON `group_role`(`group_role_type_id`);
ALTER TABLE `group_role` ADD FOREIGN KEY group_role_type_id_idxfk (`group_role_type_id`) REFERENCES `group_role_type` (`id`);

CREATE INDEX `group_participation_idx` ON `group_participation` (`person_id`,`group_id`);

CREATE INDEX `person_id_idx` ON `group_participation`(`person_id`);
ALTER TABLE `group_participation` ADD FOREIGN KEY person_id_idxfk_24 (`person_id`) REFERENCES `person` (`id`);

CREATE INDEX `group_id_idx` ON `group_participation`(`group_id`);
ALTER TABLE `group_participation` ADD FOREIGN KEY group_id_idxfk_5 (`group_id`) REFERENCES `group` (`id`);

CREATE INDEX `group_role_id_idx` ON `group_participation`(`group_role_id`);
ALTER TABLE `group_participation` ADD FOREIGN KEY group_role_id_idxfk (`group_role_id`) REFERENCES `group_role` (`id`);

CREATE INDEX `date_start_idx` ON `group_participation`(`date_start`);
CREATE INDEX `date_end_idx` ON `group_participation`(`date_end`);