/* members */
ALTER TABLE members ADD FOREIGN KEY (created_by_id) REFERENCES members(id);
ALTER TABLE members ADD FOREIGN KEY (updated_by_id) REFERENCES members(id);

/* lxa_info */
ALTER TABLE lxa_info ADD FOREIGN KEY (member_id) REFERENCES members(id);
ALTER TABLE lxa_info ADD FOREIGN KEY (created_by_id) REFERENCES members(id);
ALTER TABLE lxa_info ADD FOREIGN KEY (updated_by_id) REFERENCES members(id);

/* spouses */
ALTER TABLE spouses ADD FOREIGN KEY (member_id) REFERENCES members(id);

/* emails */
ALTER TABLE emails ADD FOREIGN KEY (member_id) REFERENCES members(id);
ALTER TABLE emails ADD FOREIGN KEY (created_by_id) REFERENCES members(id);
ALTER TABLE emails ADD FOREIGN KEY (updated_by_id) REFERENCES members(id);

/* addresses */
ALTER TABLE addresses ADD FOREIGN KEY (member_id) REFERENCES members(id);
ALTER TABLE addresses ADD FOREIGN KEY (address_type_id) REFERENCES address_type_enums(id);
ALTER TABLE addresses ADD FOREIGN KEY (created_by_id) REFERENCES members(id);
ALTER TABLE addresses ADD FOREIGN KEY (updated_by_id) REFERENCES members(id);

/* phone_numbers */
ALTER TABLE phone_numbers ADD FOREIGN KEY (member_id) REFERENCES members(id);
ALTER TABLE phone_numbers ADD FOREIGN KEY (phone_number_type_id) REFERENCES phone_number_enums(id);
ALTER TABLE phone_numbers ADD FOREIGN KEY (created_by_id) REFERENCES members(id);
ALTER TABLE phone_numbers ADD FOREIGN KEY (updated_by_id) REFERENCES members(id);

/* methods_of_contact */
ALTER TABLE methods_of_contact ADD FOREIGN KEY (member_id) REFERENCES members(id);
ALTER TABLE methods_of_contact ADD FOREIGN KEY (created_by_id) REFERENCES members(id);
ALTER TABLE methods_of_contact ADD FOREIGN KEY (updated_by_id) REFERENCES members(id);

/* births_deaths */
ALTER TABLE births_deaths ADD FOREIGN KEY (member_id) REFERENCES members(id);
ALTER TABLE births_deaths ADD FOREIGN KEY (created_by_id) REFERENCES members(id);
ALTER TABLE births_deaths ADD FOREIGN KEY (updated_by_id) REFERENCES members(id);

/* change_histories */
ALTER TABLE change_histories ADD FOREIGN KEY (updated_by_id) REFERENCES members(id);

/* social_media */
ALTER TABLE social_media ADD FOREIGN KEY (member_id) REFERENCES members(id);
ALTER TABLE social_media ADD FOREIGN KEY (created_by_id) REFERENCES members(id);
ALTER TABLE social_media ADD FOREIGN KEY (updated_by_id) REFERENCES members(id);

/* alumni_board_positions */
ALTER TABLE alumni_board_positions ADD FOREIGN KEY (alumni_board_id) REFERENCES alumni_boards(id);
ALTER TABLE alumni_board_positions ADD FOREIGN KEY (category_id) REFERENCES alumni_board_position_categories(id);

/* alumni_board_history */
ALTER TABLE alumni_board_history ADD FOREIGN KEY (position_id) REFERENCES alumni_board_positions(id);
ALTER TABLE alumni_board_history ADD FOREIGN KEY (member_id) REFERENCES members(id);
ALTER TABLE alumni_board_history ADD FOREIGN KEY (created_by_id) REFERENCES members(id);
ALTER TABLE alumni_board_history ADD FOREIGN KEY (updated_by_id) REFERENCES members(id);

/* event_locations */
ALTER TABLE event_locations ADD FOREIGN KEY (created_by_id) REFERENCES members(id);
ALTER TABLE event_locations ADD FOREIGN KEY (updated_by_id) REFERENCES members(id);

/* events */
AlTER TABLE events ADD FOREIGN KEY (location_id) REFERENCES event_locations(id);
ALTER TABLE events ADD FOREIGN KEY (created_by_id) REFERENCES members(id);
ALTER TABLE events ADD FOREIGN KEY (updated_by_id) REFERENCES members(id);

/* event_registrations */
ALTER TABLE event_registrations ADD FOREIGN KEY (event_id) REFERENCES events(id);
ALTER TABLE event_registrations ADD FOREIGN KEY (member_id) REFERENCES members(id);
ALTER TABLE event_registrations ADD FOREIGN KEY (created_by_id) REFERENCES members(id);
ALTER TABLE event_registrations ADD FOREIGN KEY (updated_by_id) REFERENCES members(id);

/* paid_alumni_dues */
ALTER TABLE paid_alumni_dues ADD FOREIGN KEY (dues_id) REFERENCES alumni_dues(id);
ALTER TABLE paid_alumni_dues ADD FOREIGN KEY (member_id) REFERENCES members(id);
ALTER TABLE paid_alumni_dues ADD FOREIGN KEY (created_by_id) REFERENCES members(id);
ALTER TABLE paid_alumni_dues ADD FOREIGN KEY (updated_by_id) REFERENCES members(id);