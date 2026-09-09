/*************************************************************************/
/*                                                                       */
/*   Before Update                                                       */
/*                                                                       */
/*************************************************************************/
DELIMITER //
CREATE TRIGGER t_births_deaths_change_history
BEFORE UPDATE ON births_deaths
FOR EACH ROW
BEGIN
    -- Record the new values.  Old values are null.
    IF OLD.birth_day <> NEW.birth_day THEN
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
        SELECT 
            'births_deaths', 
            OLD.member_id, 
            'birth_day', 
            OLD.birth_day, 
            NEW.birth_day, 
            CONCAT('User ', USER(), ' updated birth day of member ', m.first_name, ' ', m.last_name, ' from "', OLD.birth_day, '" to "', NEW.birth_day, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        FROM births_deaths bd
            INNER JOIN members m ON bd.member_id = m.id;
    END IF;

    IF OLD.birth_month <> NEW.birth_month THEN
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
        SELECT 
            'births_deaths', 
            OLD.member_id, 
            'birth_month', 
            OLD.birth_month, 
            NEW.birth_month, 
            CONCAT('User ', USER(), ' updated birth month of member ', m.first_name, ' ', m.last_name, ' from "', OLD.birth_month, '" to "', NEW.birth_month, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        FROM births_deaths bd
            INNER JOIN members m ON bd.member_id = m.id;
    END IF;

    IF OLD.birth_year <> NEW.birth_year THEN
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
        SELECT 
            'births_deaths', 
            OLD.member_id, 
            'birth_year', 
            OLD.birth_year, 
            NEW.birth_year, 
            CONCAT('User ', USER(), ' updated birth year of member ', m.first_name, ' ', m.last_name, ' from "', OLD.birth_year, '" to "', NEW.birth_year, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        FROM births_deaths bd
            INNER JOIN members m ON bd.member_id = m.id;
    END IF;

    IF OLD.death_day <> NEW.death_day THEN
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
        SELECT 
            'births_deaths', 
            OLD.member_id, 
            'death_day', 
            OLD.death_day, 
            NEW.death_day, 
            CONCAT('User ', USER(), ' updated death day of member ', m.first_name, ' ', m.last_name, ' from "', OLD.death_day, '" to "', NEW.death_day, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        FROM births_deaths bd
            INNER JOIN members m ON bd.member_id = m.id;
    END IF;

    IF OLD.death_month <> NEW.death_month THEN
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
        SELECT 
            'births_deaths', 
            OLD.member_id, 
            'death_month', 
            OLD.death_month, 
            NEW.death_month, 
            CONCAT('User ', USER(), ' updated death month of member ', m.first_name, ' ', m.last_name, ' from "', OLD.death_month, '" to "', NEW.death_month, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        FROM births_deaths bd
            INNER JOIN members m ON bd.member_id = m.id;
    END IF;

    IF OLD.death_year <> NEW.death_year THEN
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
        SELECT 
            'births_deaths', 
            OLD.member_id, 
            'death_year', 
            OLD.death_year, 
            NEW.death_year, 
            CONCAT('User ', USER(), ' updated death year of member ', m.first_name, ' ', m.last_name, ' from "', OLD.death_year, '" to "', NEW.death_year, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        FROM births_deaths bd
            INNER JOIN members m ON bd.member_id = m.id;
    END IF;

    IF OLD.obituary_url <> NEW.obituary_url THEN
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
        SELECT 
            'births_deaths', 
            OLD.member_id, 
            'obituary_url', 
            OLD.obituary_url, 
            NEW.obituary_url, 
            CONCAT('User ', USER(), ' updated obituary url of member ', m.first_name, ' ', m.last_name, ' from "', OLD.obituary_url, '" to "', NEW.obituary_url, '".'),
            CURRENT_TIMESTAMP(),
            USER()
        FROM births_deaths bd
            INNER JOIN members m ON bd.member_id = m.id;
    END IF;

    -- lastly, update the [date_updated] and [updated_by_id]
    UPDATE births_deaths bd
    SET bd.date_updated    = CURDATE(),
        bd.updated_by_id   = 1
    WHERE bd.member_id = OLD.member_id;

END //