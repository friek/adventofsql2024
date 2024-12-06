with totals as (select production_date,
                       toys_produced,
                       lag(toys_produced, 1) over (order by production_date) as previous_day_production
                from toy_production),
     change as (select *,
                       toys_produced - previous_day_production as production_change,
                       (100 * ((toys_produced::numeric(10, 2) - previous_day_production) / previous_day_production))
                                                               as percentage
                from totals)
select *
from change
order by percentage desc nulls last
;