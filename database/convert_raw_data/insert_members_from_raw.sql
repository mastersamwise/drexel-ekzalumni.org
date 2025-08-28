
-- INSERT into members
INSERT INTO members
(
    first_name,
    middle_name,
    preferred_name,
    last_name,
    full_name,
    graduation_year,
    college_status_id,  -- lookup
    profession,
    job_title,
    company_id,         -- lookup
    is_interested_in_mentoring,
    id_from_raw_import_table,
    date_created,
    date_updated,
    created_by_id,
    updated_by_id,
    is_deleted
)
SELECT  raw.first_name,
        raw.middle_name,
        raw.preferred_name,
        raw.last_name,
        raw.full_name,
        CAST( raw.graduation_year AS UNSIGNED),
        cse.id,
        raw.profession,
        raw.job_title,
        cn.id,
        CAST( raw.will_mentor_or_mentee AS BINARY ),
        raw.id,
        NOW(),
        NOW(),
        1,
        1,
        0
FROM members_raw_import raw
    LEFT OUTER JOIN college_status_enums cse ON raw.college_status = cse.college_status
    LEFT OUTER JOIN company_names cn ON raw.company_name = cn.company_name;
