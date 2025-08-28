/* Insert current phone numbers */
INSERT INTO phone_numbers
(
    member_id,
    phone_number,
    is_active,
    created_by_id
)
SELECT  m.id,
        phone_1,
        1,
        1
FROM members_raw_import raw
    LEFT OUTER JOIN members m ON raw.id = m.id_from_raw_import_table;

/* Insert old phone numbers */
INSERT INTO phone_numbers
(
    member_id,
    phone_number,
    is_active,
    created_by_id
)
SELECT  m.id,
        phone_2,
        0,
        1
FROM members_raw_import raw
    LEFT OUTER JOIN members m ON raw.id = m.id_from_raw_import_table;