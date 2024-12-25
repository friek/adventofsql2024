-- Fail 1: no result
with requests as (select g.gift_name, count(*) as num_requests
                  from gift_requests gr
                           join gifts g on g.gift_id = gr.gift_id
                  group by g.gift_name)
select gift_name, percent_rank() over (partition by gift_name order by gift_name)
from requests
;

-- Fail 2: result without grouping
select g.gift_name, percent_rank() over (order by g.gift_id)
from gift_requests gr
         join gifts g on gr.gift_id = g.gift_id
-- group by g.gift_name
;

-- Fail 3: only ranking, no percentage
select g.gift_name, percentile_disc(0.2) within group(order by g.gift_id)
from gift_requests gr
         join gifts g on gr.gift_id = g.gift_id
group by g.gift_name
;

-- Actual solution: https://www.reddit.com/r/adventofsql/comments/1hc7zyw/comment/m1op0g8/
-- Again lacking knowledge to perform such queries 😭
SELECT gift_name,
       COUNT(g.gift_name),
       ROUND(CAST(PERCENT_rank() OVER (ORDER BY COUNT(g.gift_name)) as NUMERIC), 2) perc
FROM gifts g
         INNER JOIN gift_requests gr
                    ON gr.gift_id = g.gift_id
GROUP BY gift_name
ORDER BY perc DESC, gift_name;