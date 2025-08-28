
/* General information about brothers */
CREATE TABLE members
(
  id                            INT AUTO_INCREMENT PRIMARY KEY,
  first_name                    VARCHAR (50),
  middle_name                   VARCHAR (100),
  last_name                     VARCHAR (100),
  preferred_name                VARCHAR (100),
  full_name                     VARCHAR (200), -- There are some prefixes/suffixes/nicknames, just using fullname for now
  graduation_year               INT,
  college_status_id             INT,
  profession                    VARCHAR (200),
  job_title                     VARCHAR (200),
  company_id                    VARCHAR (200),
  is_interested_in_mentoring    BIT,
  comment                       VARCHAR (5000),
  id_from_raw_import_table      INT,
  date_created                  DATETIME DEFAULT NOW(),
  date_updated                  DATETIME DEFAULT NOW(),
  created_by_id                 INT,
  updated_by_id                 INT,
  is_deleted                    BIT DEFAULT 0
);

/* Information specific to the fraternity */
CREATE TABLE lxa_info
(
  member_id             INT,
  zeta_number           VARCHAR (10),
  big_brother_id        INT,
  initiation_year       INT,
  initiated_chapter     VARCHAR (100),
  initiated_university  VARCHAR (100),
  member_status_id      INT,
  ihq_reference_id      VARCHAR (15),
  comment               VARCHAR (5000),
  date_created          DATETIME DEFAULT NOW(),
  date_updated          DATETIME DEFAULT NOW(),
  created_by_id         INT,
  updated_by_id         INT,
  is_deleted            BIT DEFAULT 0
);

/* Spouse information */
CREATE TABLE spouses
(
  member_id             INT,
  spouse_name           VARCHAR (200),
  spouse_email          VARCHAR (100),
  is_current_spouse     BIT,
  can_contact_spouse    BIT,
  date_created          DATETIME DEFAULT NOW(),
  date_updated          DATETIME DEFAULT NOW(),
  created_by_id         INT,
  updated_by_id         INT,
  is_deleted            BIT DEFAULT 0
);

/* Member Statuses */
CREATE TABLE member_status_enums
(
  id                  INT AUTO_INCREMENT PRIMARY KEY,
  member_status       VARCHAR (100)
);

/* College Statuses */
CREATE TABLE college_status_enums
(
  id                  INT AUTO_INCREMENT PRIMARY KEY,
  college_status      VARCHAR (50)
);

/* Names of the Companies that brothers work at */
CREATE TABLE company_names
(
  id              INT AUTO_INCREMENT PRIMARY KEY,
  company_name    VARCHAR (200)
);

/* Member email addresses (current and old) */
CREATE TABLE emails
(
  member_id         INT,
  email             VARCHAR (200),
  is_current_email  BIT,
  date_created      DATETIME DEFAULT NOW(),
  date_updated      DATETIME DEFAULT NOW(),
  created_by_id     INT,
  updated_by_id     INT,
  is_deleted        BIT DEFAULT 0
);

/* Member addresses (current and old) */
CREATE TABLE addresses
(
  member_id           INT,
  address_type_id     INT,
  street_address      VARCHAR (150),
  apartment           VARCHAR (50),
  city                VARCHAR (150),
  state               VARCHAR (50),
  zip_code            VARCHAR (20),
  is_current_address  BIT,
  date_created        DATETIME DEFAULT NOW(),
  date_updated        DATETIME DEFAULT NOW(),
  created_by_id       INT,
  updated_by_id       INT,
  is_deleted          BIT DEFAULT 0
);

/* Address Types */
CREATE TABLE address_type_enums
(
  id                INT AUTO_INCREMENT PRIMARY KEY,
  address_type      VARCHAR (100)
);

/* Member phone numbers */
CREATE TABLE phone_numbers
(
  member_id               INT,
  phone_number_type_id    INT,
  phone_number            VARCHAR (100),
  is_active               BIT,
  date_created            DATETIME DEFAULT NOW(),
  date_updated            DATETIME DEFAULT NOW(),
  created_by_id           INT,
  updated_by_id           INT,
  is_deleted              BIT DEFAULT 0
);

/* Phone number types */
CREATE TABLE phone_number_enums
(
  id                      INT AUTO_INCREMENT PRIMARY KEY,
  phone_number_type       VARCHAR (100)   -- "WORK", "CELL", "HOME"
);

/* Table to keep track of members who do/don't wish to be contacted */
CREATE TABLE methods_of_contact
(
  member_id         INT,
  can_send_emails   BIT,
  can_send_mail     BIT,
  can_send_calls    BIT,
  date_created      DATETIME DEFAULT NOW(),
  date_updated      DATETIME DEFAULT NOW(),
  created_by_id     INT,
  updated_by_id     INT,
  is_deleted        BIT DEFAULT 0
);

/* Information on members' birthdays and deaths */
CREATE TABLE births_deaths
(
  member_id               INT,
  birth_day               INT,
  birth_month             INT,
  birth_year              INT,
  death_day               INT,
  death_month             INT,
  death_year              INT,
  obituary_url            VARCHAR (5000),
  date_created            DATETIME DEFAULT NOW(),
  date_updated            DATETIME DEFAULT NOW(),
  created_by_id           INT,
  updated_by_id           INT,
  is_deleted              BIT DEFAULT 0
);

/* Table containing updates made to the data */
CREATE TABLE change_histories
(
  id                      INT   PRIMARY KEY,
  updated_table           VARCHAR (50),
  updated_record_id       INT,
  updated_column          VARCHAR (50),
  old_value               VARCHAR (200),
  new_value               VARCHAR (200),
  friendly_description    VARCHAR (500),
  date_created            DATETIME DEFAULT NOW(),
  updated_by_id           INT
);

/* Social-media-related information */
CREATE TABLE social_media
(
  member_id                       INT,
  is_member_of_alumni_fb_group    BIT,
  fb_handle_name                  VARCHAR (100),
  is_member_of_alumni_insta_group BIT,
  insta_handle                    VARCHAR (100),
  date_created                    DATETIME DEFAULT NOW(),
  date_updated                    DATETIME DEFAULT NOW(),
  created_by_id                   INT,
  updated_by_id                   INT,
  is_deleted                      BIT DEFAULT 0
);

/******************** Adding from Dom's tables ********************/

/* List of the current different LXA Alumni Boards */
CREATE TABLE alumni_boards
(
  id                      INT AUTO_INCREMENT PRIMARY KEY,
  alumni_board_name       VARCHAR (50),
  description             VARCHAR (500)
);

/* List of the various positions within each Alumni Board */
CREATE TABLE alumni_board_positions
(
  id                            INT AUTO_INCREMENT PRIMARY KEY,
  position                      VARCHAR (100),
  alumni_board_id               INT,
  rank                          INT,
  category_id                   INT
);

/* Categories of the various Alumni Board positions */
CREATE TABLE alumni_board_position_categories
(
  id                INT AUTO_INCREMENT PRIMARY KEY,
  category_name     VARCHAR (50)
);

/* Contains the history of who was on the different Alumni Boards */
CREATE TABLE alumni_board_history
(
  position_id             INT,
  member_id               INT,
  start_date              DATETIME,
  end_date                DATETIME,
  comment                 VARCHAR (5000),
  date_created            DATETIME DEFAULT NOW(),
  date_updated            DATETIME DEFAULT NOW(),
  created_by_id           INT,
  updated_by_id           INT,
  is_deleted              BIT DEFAULT 0
);

/* Locations of Alumni Events */
CREATE TABLE event_locations
(
  id                    INT AUTO_INCREMENT PRIMARY KEY,
  name                  VARCHAR (100),
  address               VARCHAR (200),
  city                  VARCHAR (150),
  state                 VARCHAR (25),
  zip_code              VARCHAR (10),
  comment               VARCHAR (5000),
  date_created          DATETIME DEFAULT NOW(),
  date_updated          DATETIME DEFAULT NOW(),
  created_by_id         INT,
  updated_by_id         INT,
  is_deleted            BIT DEFAULT 0
);

/* Alumni Events */
CREATE TABLE events
(
  id                            INT AUTO_INCREMENT PRIMARY KEY,
  title                         VARCHAR (150),
  start_datetime                DATETIME,
  end_datetime                  DATETIME,
  location_id                   INT,
  registration_open             DATETIME,
  registration_close            DATETIME,
  do_members_need_to_register   BIT,
  member_price                  DOUBLE,
  use_dues_as_payment           BIT,
  is_open_to_undergraduates     BIT,
  undergraduate_price           DOUBLE,
  are_guests_allowed            BIT,
  guest_price                   DOUBLE,
  description                   VARCHAR (5000),
  date_created                  DATETIME DEFAULT NOW(),
  date_updated                  DATETIME DEFAULT NOW(),
  created_by_id                 INT,
  updated_by_id                 INT,
  is_deleted                    BIT DEFAULT 0
);

/* Alumni Event registration information */
CREATE TABLE event_registrations
(
  event_id                    INT,
  member_id                   INT,
  guest_names                 VARCHAR (2000),
  medical_needs               VARCHAR (250),
  dietary_needs               VARCHAR (250),
  comment                     VARCHAR (5000),
  member_has_paid             BIT,
  member_did_attend           BIT,
  date_created                DATETIME DEFAULT NOW(),
  date_updated                DATETIME DEFAULT NOW(),
  created_by_id               INT,
  updated_by_id               INT,
  is_deleted                  BIT DEFAULT 0
);

/* Alumni Annual Dues */
CREATE TABLE alumni_dues
(
  id                      INT AUTO_INCREMENT PRIMARY KEY,
  year                    INT,
  dues_expire             DATETIME,
  full_amount             DOUBLE,
  young_alumni_amount     DOUBLE
);

/* Contains records of which members paid alumni dues */
CREATE TABLE paid_alumni_dues
(
  dues_id               INT,
  member_id             INT,
  date_paid             DATETIME,
  comment               VARCHAR (5000),
  date_created          DATETIME DEFAULT NOW(),
  date_updated          DATETIME DEFAULT NOW(),
  created_by_id         INT,
  updated_by_id         INT,
  is_deleted            BIT DEFAULT 0
);

/* Is a raw data dump of the LXA EKZ  */
CREATE TABLE members_raw_import
(
  id                            INT AUTO_INCREMENT PRIMARY KEY,
  full_name                     VARCHAR (200),
  prefix                        VARCHAR (200),
  first_name                    VARCHAR (200),
  middle_name                   VARCHAR (200),
  preferred_name                VARCHAR (200),
  last_name                     VARCHAR (200),
  suffix                        VARCHAR (200),
  ek_number                     VARCHAR (200),
  member_status                 VARCHAR (200),
  initiation_year               VARCHAR (200),
  graduation_year               VARCHAR (200),
  college_status                VARCHAR (200),
  email_1                       VARCHAR (200),
  email_2                       VARCHAR (200),
  phone_1                       VARCHAR (200),
  phone_2                       VARCHAR (200),
  address_type_1                VARCHAR (200),
  address_line_1                VARCHAR (200),
  city_1                        VARCHAR (200),
  state_1                       VARCHAR (200),
  zip_code_1                    VARCHAR (200),
  country_1                     VARCHAR (200),
  address_line_2                VARCHAR (200),
  city_2                        VARCHAR (200),
  state_2                       VARCHAR (200),
  zip_code_2                    VARCHAR (200),
  country_2                     VARCHAR (200),
  birth_month                   VARCHAR (200),
  birth_day                     VARCHAR (200),
  birth_year                    VARCHAR (200),
  death_month                   VARCHAR (200),
  death_day                     VARCHAR (200),
  death_year                    VARCHAR (200),
  obituary                      VARCHAR (200),
  spouse                        VARCHAR (200),
  spouse_email                  VARCHAR (200),
  is_member_of_alumni_fb        VARCHAR (200),
  fb_handle_name                VARCHAR (200),
  is_member_of_alumni_insta     VARCHAR (200),
  insta_handle_name             VARCHAR (200),
  profession                    VARCHAR (200),
  job_title                     VARCHAR (200),
  company_name                  VARCHAR (200),
  company_address               VARCHAR (200),
  will_mentor_or_mentee         VARCHAR (200),
  initiated_chapter             VARCHAR (200),
  initiated_university          VARCHAR (200),
  ihq_ref_id                    VARCHAR (200),
  last_updated                  VARCHAR (200)
);