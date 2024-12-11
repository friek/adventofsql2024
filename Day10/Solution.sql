CREATE EXTENSION IF NOT EXISTS tablefunc;

-- Solution for the example question
with entries as (select *
                 from crosstab('select date, drink_name, sum(quantity) as quantity
from drinks
where drink_name in (''Hot Cocoa'', ''Peppermint Schnapps'', ''Eggnog'')
group by date, drink_name
order by date, drink_name
') as ct(date date, eggnog bigint, hotcocoa bigint, peppermint_schnapps bigint))
select date
from entries
where hotcocoa = 38
  and peppermint_schnapps = 298
  and eggnog = 198
;