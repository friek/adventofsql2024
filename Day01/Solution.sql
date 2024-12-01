select c.name,
wl.wishes ->> 'first_choice' as primary_wish,
wl.wishes ->> 'second_choice' as backup_wish,
wl.wishes -> 'colors' ->> 0 as favorite_color,
json_array_length(wl.wishes -> 'colors') as color_count,
case
when tc.difficulty_to_make = 1 then 'Simple Gift'
when tc.difficulty_to_make = 2 then 'Moderate Gift'
when tc.difficulty_to_make >= 3 then 'Complex Gift'
end gift_complexity,
--
case tc.category
when 'outdoor' then 'Outside Workshop'
when 'educational' then 'Learning Workshop'
else 'General Workshop'
end as workshop_assignment
from children c
     join wish_lists wl on wl.child_id = c.child_id
     join toy_catalogue tc on tc.toy_name = wl.wishes ->> 'first_choice'
order by c.name desc
limit 5
;

