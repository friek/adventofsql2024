-- First attempt: misunderstood the question. Would be correct if the question was how many times santa
-- was within a zone
with locations as (select a.place_name, count(*) as num_times
                   from sleigh_locations sl
                            join areas a on st_intersects(a.polygon, sl.coordinate)
                   group by a.place_name)
select place_name, num_times
from locations
order by num_times desc
;

-- Second attempt: actual solution although without lead/lag as the hints suggest
with locations as (select a.place_name, sl.timestamp
                   from sleigh_locations sl
                            join areas a on st_intersects(a.polygon, sl.coordinate)),
     times as (select place_name, min(timestamp) as time_entered, max(timestamp) as time_exited
               from locations
               group by place_name)
select *
from times
order by time_exited - time_entered desc
;