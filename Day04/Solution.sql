with entries as (select toy_id,
                        toy_name,
                        (select array_agg(e)
                         FROM unnest(new_tags) with ordinality as s1(e, id)
                         WHERE not exists
                                   (SELECT 1
                                    FROM unnest(previous_tags) as s2(e)
                                    where s2.e = s1.e))                                          as added_tags,
                        ARRAY(SELECT * FROM UNNEST(previous_tags) WHERE UNNEST = ANY (new_tags)) as unchanged_tags,
                        (select array_agg(e)
                         FROM unnest(previous_tags) with ordinality as s1(e, id)
                         WHERE not exists
                                       (SELECT 1 FROM unnest(new_tags) as s2(e) where s2.e = s1.e))
                                                                                                 as removed_tags
                 from toy_production),
     lengths as (select *,
                        array_length(added_tags, 1)     as len_added_tags,
                        array_length(unchanged_tags, 1) as len_unchanged_tags,
                        array_length(removed_tags, 1)   as len_removed_tags
                 from entries)
select toy_id, toy_name, len_added_tags, len_unchanged_tags, len_removed_tags
from lengths
order by lengths.len_added_tags desc nulls last
limit 1
;

-- Better solution from https://www.reddit.com/r/adventofsql/comments/1h62b9e/comment/m0cd9bn/
SELECT toy_id,
       (SELECT COUNT(*) FROM (SELECT UNNEST(new_tags) EXCEPT SELECT UNNEST(previous_tags)) a)    AS added,
       (SELECT COUNT(*) FROM (SELECT UNNEST(previous_tags) INTERSECT SELECT UNNEST(new_tags)) a) AS unchanged,
       (SELECT COUNT(*) FROM (SELECT UNNEST(previous_tags) EXCEPT SELECT UNNEST(new_tags)) a)    AS removed
FROM toy_production
ORDER BY added DESC
LIMIT 1;