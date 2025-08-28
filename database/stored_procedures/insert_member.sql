-- https://gemini.google.com/app/b53975eb5720a7e5

DELIMITER //

CREATE PROCEDURE insert_member (
    IN p_first_name             VARCHAR (50),
    IN p_middle_name            VARCHAR (100),
    IN p_last_name              VARCHAR (100),
    IN p_full_name              VARCHAR (200),
    OUT p_new_user_id           INT
)
BEGIN
    DECLARE v_now            DATETIME;
    SET v_now := NOW();

    -- INSERT is initially basic info
    INSERT INTO members
    (
        first_name,
        middle_name,
        middle_name,
        last_name,
        full_name,
        date_created,
        date_updated,
        created_by_id,
        updated_by_id,
        is_deleted
    )
    VALUES
    (
        p_first_name,
        middle_name,
        p_last_name,
        p_full_name,
        v_now,
        v_now,
        1,
        1,
        0
    );

    -- save the newly inserted ID
    SET p_new_user_id = LAST_INSERT_ID();

    -- just create a row in the following tables for this member to update later
    INSERT INTO lxa_info
    (member_id, date_created, date_updated, created_by_id, updated_by_id, is_deleted)
    VALUES
    (p_new_user_id, v_now, v_now, 1, 1, 0);

    INSERT INTO births_deaths
    (member_id, date_created, date_updated, created_by_id, updated_by_id, is_deleted)
    VALUES
    (p_new_user_id, v_now, v_now, 1, 1, 0);

    /* Contact Information */
    INSERT INTO addresses
    (member_id, date_created, date_updated, created_by_id, updated_by_id, is_deleted)
    VALUES
    (p_new_user_id, v_now, v_now, 1, 1, 0);

    INSERT INTO emails
    (member_id, date_created, date_updated, created_by_id, updated_by_id, is_deleted)
    VALUES
    (p_new_user_id, v_now, v_now, 1, 1, 0);

    INSERT INTO phone_numbers
    (member_id, date_created, date_updated, created_by_id, updated_by_id, is_deleted)
    VALUES
    (p_new_user_id, v_now, v_now, 1, 1, 0);

    INSERT INTO methods_of_contact
    (member_id, date_created, date_updated, created_by_id, updated_by_id, is_deleted)
    VALUES
    (p_new_user_id, v_now, v_now, 1, 1, 0);

    INSERT INTO social_media
    (member_id, date_created, date_updated, created_by_id, updated_by_id, is_deleted)
    VALUES
    (p_new_user_id, v_now, v_now, 1, 1, 0);


END //

DELIMITER ;