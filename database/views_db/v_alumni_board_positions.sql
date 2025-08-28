
CREATE VIEW v_alumni_board_positions AS
SELECT  abp.id,
		abp.position,
        ab.alumni_board_name,
        abp.rank,
        c.category_name
FROM alumni_board_positions abp
	LEFT OUTER JOIN alumni_boards ab ON abp.alumni_board_id = ab.id
    LEFT OUTER JOIN alumni_board_position_categories c ON abp.category_id = c.id;