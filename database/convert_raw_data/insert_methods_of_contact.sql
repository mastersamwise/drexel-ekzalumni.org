INSERT INTO methods_of_contact
(
    member_id,
    can_send_emails,
    can_send_mail,
    can_send_calls,
    created_by_id
)
SELECT  m.id,
        1,
        1,
        1,
        1
FROM members_raw_import raw
    LEFT OUTER JOIN members m ON raw.id = m.id_from_raw_import_table;