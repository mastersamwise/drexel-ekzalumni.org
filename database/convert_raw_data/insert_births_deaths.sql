/* https://gemini.google.com/app/3cede561fec9f707 */

INSERT INTO births_deaths
(
    member_id,
    birth_day,
    birth_month,
    birth_year,
    death_day,
    death_month,
    death_year,
    obituary_url,
    date_created,
    created_by_id
)
SELECT  m.id,
        LPAD(raw.birth_day, 2, '0'),
        LPAD(raw.birth_month, 2, '0'),
        LPAD(raw.birth_year, 4, '0'),
        LPAD(raw.birth_day, 2, '0'),
        LPAD(raw.birth_month, 2, '0'),
        LPAD(raw.birth_year, 4, '0'),
        raw.obituary,
        NOW(),
        1
FROM members_raw_import raw
    LEFT OUTER JOIN members m ON raw.id = m.id_from_raw_import_table

