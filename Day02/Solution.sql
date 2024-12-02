select string_agg(c, '')
from (
  select chr(value) as c from letters_a
  union all
  select chr(value) from letters_b
) t
where c ~* '[a-z\s,.!]';
