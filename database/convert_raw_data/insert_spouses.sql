INSERT INTO spouses
(
    member_id,
    spouse_name,
    spouse_email,
    is_current_spouse,
    can_contact_spouse,
    date_created,
    created_by_id
)
SELECT  m.id,
        raw.spouse,
        raw.spouse_email,
        1,
        0,
        NOW(),
        1
FROM members m
    LEFT OUTER JOIN members_raw_import raw ON m.id_from_raw_import_table = raw.id