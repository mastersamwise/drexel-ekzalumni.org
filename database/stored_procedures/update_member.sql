-- https://gemini.google.com/app/b53975eb5720a7e5

DELIMITER //

CREATE PROCEDURE update_member (
    IN p_member_id                      INT,
    IN p_first_name                     VARCHAR (50),
    IN p_middle_name                    VARCHAR (100),
    IN p_last_name                      VARCHAR (100),
    IN p_full_name                      VARCHAR (200),
    IN p_graduation_year                INT,
    IN p_college_status                 VARCHAR (50),
    IN p_profession                     VARCHAR (200),
    IN p_job_title                      VARCHAR (200),
    IN p_company_name                   VARCHAR (200),
    IN p_is_interested_in_mentoring     BIT,
    IN p_member_comment                 VARCHAR (5000),
    IN p_zeta_number                    VARCHAR (10),
    IN p_initiation_year                INT,
    IN p_initiated_chapter              VARCHAR (100),
    IN p_initiated_university           VARCHAR (100),
    IN p_member_status                  VARCHAR (100),
    IN p_ihq_reference_id               VARCHAR (15),
    IN p_lxa_comment                    VARCHAR (5000),
    IN p_birthday                       DATETIME,
    IN p_death_date                     DATETIME,
    IN p_obituary_url                   VARCHAR (5000),
    IN p_updated_by_email               VARCHAR (50),
    OUT p_user_id                       INT
)
BEGIN

    DECLARE v_now                   DATETIME;
    DECLARE v_company_id            INT;
    DECLARE v_college_status_id     INT;
    DECLARE v_member_status_id      INT;
    DECLARE v_updated_by_user_id    INT;

    SET v_now = NOW();

    SELECT college_status_id into v_college_status_id FROM college_status_enums WHERE college_status = p_college_status;
    SELECT member_status_id into v_member_status_id FROM member_status_enums WHERE member_status = p_member_status;

    SELECT company_id into v_company_id FROM company_names WHERE company_name = p_company_name;
    /* Check to see if company exists in db, if not then insert it */
    IF v_company_id IS NULL THEN
        INSERT INTO company_names (company_name) VALUES (p_company_name);
        SET v_company_id = LAST_INSERT_ID();
    END IF;

    /* Update members table */
    UPDATE members
    SET first_name                      = p_first_name,
        middle_name                     = p_middle_name,
        last_name                       = p_last_name,
        full_name                       = p_full_name,
        graduation_year                 = p_graduation_year,
        college_status_id               = v_college_status_id,
        profession                      = p_profession,
        job_title                       = p_job_title,
        company_id                      = v_company_id,
        is_interested_in_mentoring      = p_is_interested_in_mentoring,
        date_updated                    = v_current_time,
        updated_by_id                   = v_updated_by_user_id
    WHERE member_id = p_member_id;

    /* Update members table */
    UPDATE lxa_info
    SET zeta_number             = p_zeta_number,
        initiation_year         = p_initiation_year,
        initiated_chapter       = p_initiated_chapter,
        initiated_university    = p_initiated_university,
        member_status_id        = v_member_status_id,
        ihq_reference_id        = p_ihq_reference_id,
        comment                 = p_lxa_comment,
        date_updated            = v_now,
        updated_by_id           = v_updated_by_user_id
    WHERE member_id = p_member_id;

    /* Update members table */
    UPDATE births_deaths
    SET birthday        = p_birthday,
        death           = p_death_date,
        obituary_url    = p_obituary_url,
        date_updated    = v_now,
        updated_by_id   = v_updated_by_user_id
    WHERE member_id = p_member_id;

END //

DELIMITER ;