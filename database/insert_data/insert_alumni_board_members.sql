CREATE PROCEDURE insert_all_alumni_board_members()
BEGIN

    -- Variables
    DECLARE position_id_            INT;
    DECLARE member_id_              INT;
    DECLARE created_by_user_id_     INT := 1;       -- ID of 'Nik B' (the default) user

    -- Constants
    DECLARE DATE_CREATED_           DATE := UTC_TIMESTAMP;
    DECLARE EMPTY_DATE_             DATE := '1900-01-01';
    DECLARE ALUMNI_ASSOCIATION_     VARCHAR(50) := 'Alumni Association';
    DECLARE ALUMNI_ADVISORY_BOARD_  VARCHAR(50) := 'Alumni Advisory Board';
    DECLARE HOUSING_CORPS_          VARCHAR(50) := 'Housing Corporation';
    DECLARE NA_                     VARCHAR(10) := 'N/A';
    DECLARE OFFICER_                VARCHAR(15) := 'Officer';
    DECLARE CHARIMAN_               VARCHAR(15) := 'Chairman';
    DECLARE MEMBER_                 VARCHAR(10) := 'Member';
    DECLARE HOUSE_MGR_              VARCHAR(20) := 'House Manager';
    DECLARE DIRECTOR_               VARCHAR(10) := 'Director';
    DECLARE HIGH_PI_                VARCHAR(10) := 'High Pi';
    DECLARE MENTOR_                 VARCHAR(10) := 'Mentor';
    DECLARE TREASURER_              VARCHAR(15) := 'Treasurer';
    DECLARE SECRETARY_              VARCHAR(15) := 'Secretary';


    -- Create the Temporary Table
    -- This table will hold the 'raw' data you want to insert.
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_board_members (
        temp_id             INT             PRIMARY KEY AUTO_INCREMENT,
        member_first_name   VARCHAR(100)    NOT NULL,
        member_last_name    VARCHAR(100)    NOT NULL
        alumni_board        VARCHAR(100)    NOT NULL,
        alumni_position     VARCHAR(100)    NOT NULL,
        start_date          DATE            NOT NULL,
        end_date            DATE            NOT NULL
    );

    -- Insert Data into the Temporary Table
    -- This is the 'readable fashion' step, allowing you to clearly define the data set.
    INSERT INTO temp_board_members 
    ( member_name, alumni_board, alumni_position, start_date, end_date ) 
    VALUES

    -- Alumni Association
    ( 'Michael', 'Elmer', ALUMNI_ASSOCIATION_, CHAIRMAN_, EMPTY_DATE_, EMPTY_DATE_ ),
    ( 'Connor', 'Reilly', ALUMNI_ASSOCIATION_, SECRETARY_, EMPTY_DATE_, EMPTY_DATE_ ),

    -- Housing Corporation
    ( 'Stephen', 'Cohen',   HOUSING_CORPS_, CHAIRMAN_, EMPTY_DATE_, '2024-07-01' ),
    ( 'Chuck', 'Persing',   HOUSING_CORPS_, CHAIRMAN_, '2009-11-02', '2018-07-01' ),
    ( 'John', 'McGarrigle', HOUSING_CORPS_, CHAIRMAN_, EMPTY_DATE_, '2006-06-01' ),
    ( 'Theodore', 'Speedy', HOUSING_CORPS_, CHAIRMAN_, EMPTY_DATE_, EMPTY_DATE_ ),
    ( 'Charles', 'Persing', HOUSING_CORPS_, TREASURER_, EMPTY_DATE_, EMPTY_DATE_ ),
    ( 'Michael', 'Elmer',   HOUSING_CORPS_, SECRETARY_, EMPTY_DATE_, EMPTY_DATE_ ),
    ( 'Dennis', 'Carr',     HOUSING_CORPS_, HOUSE_MGR_, EMPTY_DATE_, EMPTY_DATE_ ),
    ( 'Stephen', 'Cohen',   HOUSING_CORPS_, DIRECTOR_, EMPTY_DATE_, EMPTY_DATE_ ),
    ( 'Rob', 'McCafferty',  HOUSING_CORPS_, DIRECTOR_, EMPTY_DATE_, EMPTY_DATE_ ),
    ( 'Theodore', 'Speedy', HOUSING_CORPS_, DIRECTOR_, EMPTY_DATE_, EMPTY_DATE_ ),
    ( 'Dennis', 'Carr',     HOUSING_CORPS_, DIRECTOR_, EMPTY_DATE_, EMPTY_DATE_ ),
    ( 'Andy', 'Soltis',     HOUSING_CORPS_, DIRECTOR_, EMPTY_DATE_, EMPTY_DATE_ ),
    ( 'Chuck', 'Persing',   HOUSING_CORPS_, DIRECTOR_, EMPTY_DATE_, EMPTY_DATE_ ),
    ( 'Nik', 'Bournelis',   HOUSING_CORPS_, DIRECTOR_, EMPTY_DATE_, EMPTY_DATE_ ),
    ( 'Michael', 'Elmer',   HOUSING_CORPS_, DIRECTOR_, EMPTY_DATE_, EMPTY_DATE_ ),
    ( 'Ken', 'Johnsen',     HOUSING_CORPS_, DIRECTOR_, EMPTY_DATE_, EMPTY_DATE_ ),

    -- Alumni Advisory Board
    ( 'Mark', 'Stitz', ALUMNI_ADVISORY_BOARD_, CHAIRMAN_, EMPTY_DATE_, EMPTY_DATE_ );


    -- Start a transaction for atomicity
    START TRANSACTION;

    -- Insert into Main Tables

    -- a. Insert/Update Users (Prevent duplicates)
    -- This uses INSERT ... ON DUPLICATE KEY UPDATE to ensure a user is only created once.
    -- We assume your main 'Users' table has columns like (user_id, name, email).
    INSERT INTO alumni_board_history 
    (
        position_id,
        member_id,
        start_date,
        end_date,
        comment,
        date_created,
        date_updated,
        created_by,
        updated_by_id,
        is_deleted
    )
    SELECT 

    FROM temp_board_members;

    -- b. Insert into Orders (Foreign Key dependency)
    -- This requires joining the TempImport table with the main Users table
    -- to get the correct user_id foreign key.
    -- We assume your main 'Orders' table has columns like (order_id, user_id, product_name, quantity).
    INSERT INTO Orders 
    (
        user_id, 
        product_name, 
        quantity
    )
    SELECT
        
    FROM temp_board_members tbm
        JOIN 

    -- Commit the changes if all insertions were successful
    COMMIT;

    -- Clean Up
    DROP TEMPORARY TABLE temp_board_members;

END$$

DELIMITER ;