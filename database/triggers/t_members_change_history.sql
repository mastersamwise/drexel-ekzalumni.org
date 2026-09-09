-- https://gemini.google.com/app/d2a79474c74ebed8

DELIMITER //

/*************************************************************************/
/*                                                                       */
/*   Before Insert                                                       */
/*                                                                       */
/*************************************************************************/

-- I don't think we want the INSERT to check every column because then it will add
-- a record to the [change_histories] table for every column added.
CREATE TRIGGER t_members_before_insert
BEFORE INSERT ON members
FOR EACH ROW
BEGIN

    INSERT INTO change_histories 
    (
        updated_table, 
        updated_record_id, 
        updated_column, 
        old_value, 
        new_value, 
        friendly_description,
        date_created,
        updated_by
    )
    VALUES 
    (
        'members', 
        NEW.id, 
        'first_name', 
        NULL, 
        NEW.first_name, 
        CONCAT('User ', USER(), ' added record for ', NEW.first_name, ' ', NEW.last_name, ' the [members] table.'),
        CURRENT_TIMESTAMP(),
        USER()
    ); 
    
END //

/*************************************************************************/
/*                                                                       */
/*   Before Update                                                       */
/*                                                                       */
/*************************************************************************/
DELIMITER //
CREATE TRIGGER t_members_before_update
BEFORE UPDATE ON members
FOR EACH ROW
BEGIN
    -- Record the new values.  Old values are null.
    IF OLD.first_name <> NEW.first_name THEN
        INSERT INTO change_histories 
        (
            updated_table, 
            updated_record_id, 
            updated_column, 
            old_value, 
            new_value, 
            friendly_description,
            date_created,
            updated_by
        )
        VALUES 
        (
            'members', 
            OLD.id, 
            'first_name', 
            OLD.first_name, 
            NEW.first_name, 
            CONCAT('User ', USER(), ' updated first name of member ', OLD.first_name, ' ', OLD.last_name, ' from "', OLD.first_name, '" to "', NEW.first_name, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        ); -- Assuming 'id' is your primary key
    END IF;

    IF OLD.middle_name <> NEW.middle_name THEN
        INSERT INTO change_histories 
        (
            updated_table, 
            updated_record_id, 
            updated_column, 
            old_value, 
            new_value, 
            friendly_description,
            date_created,
            updated_by
        )
        VALUES 
        (
            'members', 
            OLD.id, 
            'middle_name', 
            OLD.middle_name, 
            NEW.middle_name, 
            CONCAT('User ', USER(), ' updated middle name of member ', OLD.first_name, ' ', OLD.last_name, ' from "', OLD.middle_name, '" to "', NEW.middle_name, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        ); -- Assuming 'id' is your primary key
    END IF;

    IF OLD.last_name <> NEW.last_name THEN
        INSERT INTO change_histories 
        (
            updated_table, 
            updated_record_id, 
            updated_column, 
            old_value, 
            new_value, 
            friendly_description,
            date_created,
            updated_by
        )
        VALUES 
        (
            'members', 
            OLD.id, 
            'last_name', 
            OLD.last_name, 
            NEW.last_name, 
            CONCAT('User ', USER(), ' updated last name of member ', OLD.first_name, ' ', OLD.last_name, ' from "', OLD.last_name, '" to "', NEW.last_name, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        ); -- Assuming 'id' is your primary key
    END IF;

    IF OLD.preferred_name <> NEW.preferred_name THEN
        INSERT INTO change_histories 
        (
            updated_table, 
            updated_record_id, 
            updated_column, 
            old_value, 
            new_value, 
            friendly_description,
            date_created,
            updated_by
        )
        VALUES 
        (
            'members', 
            OLD.id, 
            'preferred_name', 
            OLD.preferred_name, 
            NEW.preferred_name, 
            CONCAT('User ', USER(), ' updated preferred name of member ', OLD.first_name, ' ', OLD.last_name, ' from "', OLD.preferred_name, '" to "', NEW.preferred_name, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        ); -- Assuming 'id' is your primary key
    END IF;
    
    IF OLD.full_name <> NEW.full_name THEN
        INSERT INTO change_histories 
        (
            updated_table, 
            updated_record_id, 
            updated_column, 
            old_value, 
            new_value, 
            friendly_description,
            date_created,
            updated_by
        )
        VALUES 
        (
            'members', 
            OLD.id, 
            'full_name', 
            OLD.full_name, 
            NEW.full_name, 
            CONCAT('User ', USER(), ' updated full name of member ', OLD.first_name, ' ', OLD.last_name, ' from "', OLD.full_name, '" to "', NEW.full_name, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        ); -- Assuming 'id' is your primary key
    END IF;

    IF OLD.graduation_year <> NEW.graduation_year THEN
        INSERT INTO change_histories 
        (
            updated_table, 
            updated_record_id, 
            updated_column, 
            old_value, 
            new_value, 
            friendly_description,
            date_created,
            updated_by
        )
        VALUES 
        (
            'members', 
            OLD.id, 
            'graduation_year', 
            OLD.graduation_year, 
            NEW.graduation_year, 
            CONCAT('User ', USER(), ' updated graduation year of member ', OLD.first_name, ' ', OLD.last_name, ' from "', OLD.graduation_year, '" to "', NEW.graduation_year, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        ); -- Assuming 'id' is your primary key
    END IF;
    
    IF OLD.college_status_id <> NEW.college_status_id THEN
        INSERT INTO change_histories 
        (
            updated_table, 
            updated_record_id, 
            updated_column, 
            old_value, 
            new_value, 
            friendly_description,
            date_created,
            updated_by
        )
        VALUES 
        (
            'members', 
            OLD.id, 
            'college_status_id', 
            OLD.college_status_id, 
            NEW.college_status_id, 
            CONCAT('User ', USER(), ' updated college status of member ', OLD.first_name, ' ', OLD.last_name, ' from "', OLD.college_status_id, '" to "', NEW.college_status_id, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        ); -- Assuming 'id' is your primary key
    END IF;
    
    IF OLD.profession <> NEW.profession THEN
        INSERT INTO change_histories 
        (
            updated_table, 
            updated_record_id, 
            updated_column, 
            old_value, 
            new_value, 
            friendly_description,
            date_created,
            updated_by
        )
        VALUES 
        (
            'members', 
            OLD.id, 
            'profession', 
            OLD.profession, 
            NEW.profession, 
            CONCAT('User ', USER(), ' updated profession of member ', OLD.first_name, ' ', OLD.last_name, ' from "', OLD.profession, '" to "', NEW.profession, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        ); -- Assuming 'id' is your primary key
    END IF;
    
    IF OLD.job_title <> NEW.job_title THEN
        INSERT INTO change_histories 
        (
            updated_table, 
            updated_record_id, 
            updated_column, 
            old_value, 
            new_value, 
            friendly_description,
            date_created,
            updated_by
        )
        VALUES 
        (
            'members', 
            OLD.id, 
            'job_title', 
            OLD.job_title, 
            NEW.job_title, 
            CONCAT('User ', USER(), ' updated job title of member ', OLD.first_name, ' ', OLD.last_name, ' from "', OLD.job_title, '" to "', NEW.job_title, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        ); -- Assuming 'id' is your primary key
    END IF;

    IF OLD.company_id <> NEW.company_id THEN
        INSERT INTO change_histories 
        (
            updated_table, 
            updated_record_id, 
            updated_column, 
            old_value, 
            new_value, 
            friendly_description,
            date_created,
            updated_by
        )
        VALUES 
        (
            'members', 
            OLD.id, 
            'company_id', 
            OLD.company_id, 
            NEW.company_id, 
            CONCAT('User ', USER(), ' updated company id of member ', OLD.first_name, ' ', OLD.last_name, ' from "', OLD.company_id, '" to "', NEW.company_id, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        ); -- Assuming 'id' is your primary key
    END IF;
    
    IF OLD.is_interested_in_mentoring <> NEW.is_interested_in_mentoring THEN
        INSERT INTO change_histories 
        (
            updated_table, 
            updated_record_id, 
            updated_column, 
            old_value, 
            new_value, 
            friendly_description,
            date_created,
            updated_by
        )
        VALUES 
        (
            'members', 
            OLD.id, 
            'is_interested_in_mentoring', 
            OLD.is_interested_in_mentoring, 
            NEW.is_interested_in_mentoring, 
            CONCAT('User ', USER(), ' updated is-interested-in-mentoring flag of member ', OLD.first_name, ' ', OLD.last_name, ' from "', OLD.is_interested_in_mentoring, '" to "', NEW.is_interested_in_mentoring, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        ); -- Assuming 'id' is your primary key
    END IF;
    
    IF OLD.comment <> NEW.comment THEN
        INSERT INTO change_histories 
        (
            updated_table, 
            updated_record_id, 
            updated_column, 
            old_value, 
            new_value, 
            friendly_description,
            date_created,
            updated_by
        )
        VALUES 
        (
            'members', 
            OLD.id, 
            'comment', 
            OLD.comment, 
            NEW.comment, 
            CONCAT('User ', USER(), ' updated comment of member ', OLD.first_name, ' ', OLD.last_name, ' from "', OLD.comment, '" to "', NEW.comment, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        ); -- Assuming 'id' is your primary key
    END IF;

    -- lastly, update the [date_updated] and [updated_by_id]
    UPDATE members m
    SET m.date_updated    = CURDATE(),
        m.updated_by_id   = 1
    WHERE m.id = OLD.id;

END //

/*************************************************************************/
/*                                                                       */
/*   Before Delete                                                       */
/*                                                                       */
/*************************************************************************/
DELIMITER //
CREATE TRIGGER t_members_before_delete
BEFORE DELETE ON members
FOR EACH ROW
BEGIN

    INSERT INTO change_histories 
    (
        updated_table, 
        updated_record_id, 
        updated_column, 
        old_value, 
        new_value, 
        friendly_description,
        date_created,
        updated_by
    )
    VALUES 
    (
        'members', 
        OLD.id, 
        'first_name', 
        OLD.first_name, 
        NULL, 
        CONCAT('User ', USER(), ' deleted the first name from member ', OLD.first_name, ' ', OLD.last_name),
        CURRENT_TIMESTAMP(),
        USER()
    ); 

END //

DELIMITER;


