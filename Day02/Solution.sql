select array_to_string(array_agg(c), '') as result
from (select chr(value) as c
      from letters_a
      union all
      select chr(value)
      from letters_b) t
where c ~* '[a-zA-Z\s,.!]';
