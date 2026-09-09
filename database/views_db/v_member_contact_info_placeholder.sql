/* Using this view until wp_users data is linked with our tables */
CREATE VIEW v_member_contact_info AS
SELECT 	m.full_name,
		e.email,
		p.phone_number
FROM emails e 
    LEFT JOIN members m ON e.member_id = m.id
    LEFT JOIN phone_numbers p ON m.id = p.member_id
WHERE e.is_current_email = 1
    AND p.is_active = 1
    AND e.is_deleted = 0
    AND p.is_deleted = 0
    AND m.is_deleted = 0;



