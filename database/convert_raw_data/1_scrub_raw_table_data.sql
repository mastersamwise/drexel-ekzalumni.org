/********************************************************************************/

/*
 *  Remove the comma from the "year" columns
 */

UPDATE members_raw_import
SET ek_number = REPLACE(ek_number, ',', ''),
    initiation_year = REPLACE(initiation_year, ',', ''),
	graduation_year = REPLACE(graduation_year, ',', ''),
    birth_year = REPLACE(birth_year, ',', '');

/********************************************************************************/

/* The format of the numbers from the Excel export is breaking the formatting with CAST() in
 * the insert_births_deaths.sql file
 *
 * Run the following query to grab the appropriate IDs
 * 
    select  id, 
            birth_month, 
            birth_day, 
            birth_year 
    from members_raw_import 
    where birth_month is not null;
 *
 * Run the following updates to adjust the numbers' format in the corresponding columns
 *
 */
update members_raw_import
set birth_month = '12',
    birth_day   = '29'
--where id = 1678;

update members_raw_import
set birth_day = '4'
--where id = 85;

update members_raw_import
set birth_day = '26'
--where id = 253;

update members_raw_import
set birth_day = '9'
--where id = 490;

update members_raw_import
set birth_day = '14'
--where id = 1515;

/********************************************************************************/
/* Set binary values to '1' and '0' (from 'Yes' and 'No') */

UPDATE members_raw_import
SET is_member_of_alumni_fb = '1'
WHERE is_member_of_alumni_fb = 'Yes';

UPDATE members_raw_import
SET is_member_of_alumni_fb = '0'
WHERE is_member_of_alumni_fb is null;

UPDATE members_raw_import
SET is_member_of_alumni_insta = '1'
WHERE is_member_of_alumni_insta = 'Yes';


UPDATE members_raw_import
SET is_member_of_alumni_insta = '0'
WHERE is_member_of_alumni_insta is null;

/********************************************************************************/