-- Complex solution
with average_price as (select avg(price) as avg_gift_price from gifts),
     above_average as (select c.name as child_name, g.name as gift_name, g.price as gift_price
                       from average_price,
                            children c
                                join gifts g on g.child_id = c.child_id
                       where g.price > avg_gift_price)
select *
from above_average
order by gift_price
limit 1
;

-- Simple solution
select c.name as child_name, g.name as gift_name, g.price as gift_price
from children c
         join gifts g on g.child_id = c.child_id
where g.price > (select avg(price) as avg_gift_price from gifts)
order by gift_price
limit 1
;