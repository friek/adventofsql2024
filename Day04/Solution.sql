WITH entries as (SELECT toy_id,
                        toy_name,
                        (SELECT array_agg(e)
                         FROM unnest(new_tags) WITH ORDINALITY AS s1(e, id)
                         WHERE NOT EXISTS
                                   (SELECT 1
                                    FROM unnest(previous_tags) as s2(e)
                                    WHERE s2.e = s1.e))                                          AS added_tags,
                        ARRAY(SELECT * FROM unnest(previous_tags) WHERE unnest = ANY (new_tags)) AS unchanged_tags,
                        (SELECT array_agg(e)
                         FROM unnest(previous_tags) WITH ORDINALITY AS s1(e, id)
                         WHERE NOT EXISTS
                                       (SELECT 1 FROM unnest(new_tags) AS s2(e) WHERE s2.e = s1.e))
                                                                                                 AS removed_tags
                 FROM toy_production),
     lengths AS (SELECT *,
                        coalesce(array_length(added_tags, 1), 0)     AS len_added_tags,
                        coalesce(array_length(unchanged_tags, 1), 0) AS len_unchanged_tags,
                        coalesce(array_length(removed_tags, 1), 0)   AS len_removed_tags
                 FROM entries)
SELECT toy_id, toy_name, len_added_tags, len_unchanged_tags, len_removed_tags
FROM lengths
ORDER BY lengths.len_added_tags DESC NULLS LAST
LIMIT 1
;

-- Better solution from https://www.reddit.com/r/adventofsql/comments/1h62b9e/comment/m0cd9bn/
SELECT toy_id,
       (SELECT count(*) FROM (SELECT unnest(new_tags) EXCEPT SELECT unnest(previous_tags)) a)    AS added,
       (SELECT count(*) FROM (SELECT unnest(previous_tags) INTERSECT SELECT unnest(new_tags)) a) AS unchanged,
       (SELECT count(*) FROM (SELECT unnest(previous_tags) EXCEPT SELECT unnest(new_tags)) a)    AS removed
FROM toy_production
ORDER BY added DESC
LIMIT 1;