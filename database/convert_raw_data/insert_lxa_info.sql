/* 2025-04-06: Not inserting the member_id */

INSERT INTO lxa_info
(
    member_id,
    zeta_number,
    initiation_year,
    initiated_chapter,
    initiated_university,
    member_status_id,           -- lookup
    ihq_reference_id,
    date_created,
    created_by_id
)
SELECT  m.id,
        CAST( raw.ek_number AS UNSIGNED ),
        CAST( raw.initiation_year AS UNSIGNED ),
        raw.initiated_chapter,
        raw.initiated_university,
        mse.id,
        raw.ihq_ref_id,
        NOW(),
        1
FROM members_raw_import raw
    LEFT OUTER JOIN lxa_info lxa ON raw.ek_number = lxa.zeta_number
    LEFT OUTER JOIN members m ON raw.id = m.id_from_raw_import_table
    LEFT OUTER JOIN member_status_enums mse ON raw.member_status = mse.member_status;