/* Set current addresses */

INSERT INTO addresses
(
    member_id,
    address_type_id,
    street_address,
    apartment,
    city,
    state,
    zip_code,
    is_current_address,
    created_by_id
)
SELECT  m.id,
        a.id,
        raw.address_line_1,
        '',
        raw.city_1,
        raw.state_1,
        raw.zip_code_1,
        1,
        1
FROM members_raw_import raw
    LEFT OUTER JOIN members m ON raw.id = m.id_from_raw_import_table
    LEFT OUTER JOIN address_type_enums a ON raw.address_type_1 = a.address_type;

/* Set old addresses */

INSERT INTO addresses
(
    member_id,
    address_type_id,
    street_address,
    apartment,
    city,
    state,
    zip_code,
    is_current_address,
    created_by_id
)
SELECT  m.id,
        a.id,
        raw.address_line_2,
        '',
        raw.city_2,
        raw.state_2,
        raw.zip_code_2,
        0,
        1
FROM members_raw_import raw
    LEFT OUTER JOIN members m ON raw.id = m.id_from_raw_import_table
    LEFT OUTER JOIN address_type_enums a ON raw.address_type_1 = a.address_type;