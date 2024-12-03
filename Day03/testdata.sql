DROP TABLE IF EXISTS christmas_menus CASCADE;

CREATE TABLE christmas_menus (
id SERIAL PRIMARY KEY,
menu_data XML
);

-- Version 1
INSERT INTO christmas_menus (id, menu_data) VALUES
(1, '<menu version="1.0">
		<dishes>
				<dish>
						<food_item_id>99</food_item_id>
				</dish>
				<dish>
						<food_item_id>102</food_item_id>
				</dish>
		</dishes>
		<total_count>80</total_count>
</menu>');

-- Version 2
INSERT INTO christmas_menus (id, menu_data) VALUES
(2, '<menu version="2.0">
		<total_guests>85</total_guests>
		<dishes>
				<dish_entry>
						<food_item_id>101</food_item_id>
				</dish_entry>
				<dish_entry>
						<food_item_id>102</food_item_id>
				</dish_entry>
		</dishes>
</menu>');

-- Version that shouldn't be parsed
INSERT INTO christmas_menus (id, menu_data) VALUES
(3, '<menu version="beta">
		<guestCount>15</guestCount>
		<foodList>
				<foodEntry>
						<food_item_id>102</food_item_id>
				</foodEntry>
		</foodList>
</menu>');