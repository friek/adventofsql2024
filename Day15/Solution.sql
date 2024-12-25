select a.place_name
from sleigh_locations sl
         join areas a on st_intersects(a.polygon, sl.coordinate)
order by sl.timestamp desc
;