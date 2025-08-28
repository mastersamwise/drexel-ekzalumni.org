/* 
    As of 2025-04-06, Nik isn't using this file and instead broke the 
    mini inserts into smaller files 
*/

DELIMITER //

CREATE PROCEDURE insert_raw_to_tables()
BEGIN
    DECLARE v_now            DATETIME;
    SET v_now = NOW();

    INSERT INTO company_names
    (
        company_name
    )
    SELECT DISTINCT company_name
    FROM members_raw_import
    WHERE company_name NOT IN (SELECT company_name FROM company_names);

    -- INSERT into members
    INSERT INTO members
    (
        first_name,
        middle_name,
        preferred_name,
        last_name,
        full_name,
        graduation_year,
        college_status_id,  -- lookup
        profession,
        job_title,
        company_id,         -- lookup
        is_interested_in_mentoring,
        date_created,
        date_updated,
        created_by_id,
        updated_by_id,
        is_deleted
    )
    SELECT  raw.first_name,
            raw.middle_name,
            raw.preferred_name,
            raw.last_name,
            raw.full_name,
            CAST( REPLACE(raw.graduation_year, ',', '' ) AS UNSIGNED),
            cse.id,
            raw.profession,
            raw.job_title,
            cn.id,
            CAST(raw.will_mentor_or_mentee AS BINARY),
            NOW(),
            NOW(),
            1,
            1,
            0
    FROM members_raw_import raw
        LEFT OUTER JOIN college_status_enums cse ON raw.college_status = cse.college_status
        LEFT OUTER JOIN company_names cn ON raw.company_name = cn.company_name;


    INSERT INTO births_deaths
    (
        member_id,
        birthday,
        death,
        obituary_url,
        date_created,
        date_updated,
        created_by_id,
        updated_by_id,
        is_deleted
    )
    SELECT  m.id
    FROM 


END //
DELIMITER ;

CALL insert_raw_to_tables();