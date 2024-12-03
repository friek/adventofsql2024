-- All broken --
select c::text::int
from christmas_menus
     cross join lateral unnest(xpath('//guestCount/text()', menu_data)) xp(c)
-- where  > 78
;

select (xpath('//guestCount/text()', menu_data))[1]::text::int
from christmas_menus;

select t.food_item_id, (xpath('//total_guests/text()', menu_data))[1]
from christmas_menus cm,
xmltable('//dishes/dish_entry' passing cm.menu_data
         columns food_item_id int path 'food_item_id'
) t
where (xpath('//total_guests/text()', menu_data))[1]::text::int >= 10
;

select food_item_id, count(*)
from (select t.food_item_id
      from christmas_menus cm,
      xmltable('//dish_entry' passing cm.menu_data
               columns food_item_id int path 'food_item_id'
      ) t
      where (xpath('//total_guests/text()', menu_data))[1]::text::int >= 78) t
group by food_item_id
order by count(*) desc
;

select unnest(xpath('//food_item_id/text()', menu_data))
from christmas_menus
where (unnest(xpath('//total_guests/text()', menu_data)))[1]::text::int >= 78;

select t.food_item_id
from christmas_menus cm,
xmltable('//course_details/dish_entry' passing cm.menu_data
         columns food_item_id int path 'food_item_id',

) t
where (xpath('//total_guests/text()', menu_data))[1]::text::int > 78;


-- Working solution
-- https://www.reddit.com/r/adventofsql/comments/1h59w62/comment/m08166i/
WITH menu AS (
SELECT
CASE
WHEN ARRAY_LENGTH(xpath('//total_present/text()', menu_data), 1) > 0
THEN (xpath('//total_present/text()', menu_data))[1]::text::integer -- xml cannot be casted directly to integer
WHEN ARRAY_LENGTH(xpath('//total_count/text()', menu_data), 1) > 0
THEN (xpath('//total_count/text()', menu_data))[1]::text::integer
WHEN ARRAY_LENGTH(xpath('//total_guests/text()', menu_data), 1) > 0
THEN (xpath('//total_guests/text()', menu_data))[1]::text::integer
END AS total_guest,
(xpath('//food_item_id/text()', menu_data))::text[] AS array_food_item -- array of xml element must be casted into array of text
FROM christmas_menus
)
SELECT
UNNEST(array_food_item) AS food_item
FROM menu
WHERE total_guest > 78
GROUP BY food_item
ORDER BY COUNT(*) DESC
LIMIT 1;