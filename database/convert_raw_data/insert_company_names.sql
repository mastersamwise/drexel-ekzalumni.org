
INSERT INTO company_names
(
    company_name
)
SELECT DISTINCT company_name
    FROM members_raw_import
    WHERE company_name NOT IN (SELECT company_name FROM company_names);