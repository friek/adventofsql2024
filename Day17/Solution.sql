select w.*, tz.utc_offset
from workshops w
         left join pg_timezone_names tz on tz.name = w.timezone;

select extract('hours' from ('17:00:00'::time - '9:00:00'::time));

select '17:00:00'::time at time zone 'Europe/Amsterdam';

select *
from generate_series('2024-12-25 07:00:00'::timestamp at time zone 'Europe/Amsterdam',
                     '2024-12-25 18:00:00'::timestamp at time zone 'Europe/Amsterdam');