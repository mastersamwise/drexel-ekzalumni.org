INSERT INTO social_media
(
    member_id,
    is_member_of_alumni_fb_group,
    fb_handle_name,
    is_member_of_alumni_insta_group,
    insta_handle,
    created_by_id
)
SELECT  m.id,
        raw.is_member_of_alumni_fb,
        raw.fb_handle_name,
        raw.is_member_of_alumni_insta,
        raw.insta_handle_name,
        1
FROM members_raw_import raw
    LEFT OUTER JOIN members m ON raw.id = m.id_from_raw_import_table