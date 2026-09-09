
CREATE VIEW v_housing_board_members AS
SELECT  p.position,
        m.full_name,
        h.start_date,
        h.end_date
FROM alumni_board_history h
    LEFT OUTER JOIN members m ON h.member_id = m.id
    LEFT OUTER JOIN alumni_board_positions p ON h.position_id = p.id
WHERE p.alumni_board_id = 3
ORDER BY 
    p.rank asc,
    h.end_date desc;