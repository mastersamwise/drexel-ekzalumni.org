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
        NEW.member_id, 
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
            OLD.member_id, 
            'first_name', 
            OLD.first_name, 
            NEW.first_name, 
            CONCAT('User ', USER(), ' updated first name of member ', OLD.first_name, ' ', OLD.last_name, ' from "', OLD.first_name, '" to "', NEW.first_name, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        ); -- Assuming 'id' is your primary key
    END IF;

END //

/*************************************************************************/
/*                                                                       */
/*   Before Delete                                                       */
/*                                                                       */
/*************************************************************************/

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
        OLD.member_id, 
        'first_name', 
        OLD.first_name, 
        NULL, 
        CONCAT('User ', USER(), ' deleted the first name from member ', OLD.first_name, ' ', OLD.last_name),
        CURRENT_TIMESTAMP(),
        USER()
    ); 

END //

DELIMITER;


