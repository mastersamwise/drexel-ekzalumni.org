/* Insert current email addresses */
INSERT INTO emails
(
    member_id,
    email,
    is_current_email,
    created_by_id
)
SELECT  m.id,
        email_1,
        1,
        1
FROM members_raw_import raw
    LEFT OUTER JOIN members m ON raw.id = m.id_from_raw_import_table;

/* Insert old email addresses */
INSERT INTO emails
(
    member_id,
    email,
    is_current_email,
    created_by_id
)
SELECT  m.id,
        email_2,
        0,
        1
FROM members_raw_import raw
    LEFT OUTER JOIN members m ON raw.id = m.id_from_raw_import_table;