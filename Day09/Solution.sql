-- Solution for the example
select r.reindeer_name, max(speed_record) as top_speed
from training_sessions ts
         join reindeers r on ts.reindeer_id = r.reindeer_id
group by r.reindeer_name
order by max(speed_record) desc;

-- Challenge solution
with exercise_averages as (select r.reindeer_name,
                                  avg(speed_record) as average_speed,
                                  ts.exercise_name
                           from training_sessions ts
                                    join reindeers r on ts.reindeer_id = r.reindeer_id
                           where r.reindeer_name != 'Rudolph'
                           group by r.reindeer_name, ts.exercise_name),
     max_averages as (select reindeer_name, max(average_speed) as max_average_speed
                      from exercise_averages ea
                      group by reindeer_name)
select reindeer_name, round(max_average_speed, 2) as max_average_speed
from max_averages
order by max_average_speed desc
limit 3
;
