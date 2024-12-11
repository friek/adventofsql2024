-- I didn't figure it out myself because I just lack basic knowledge of window functions.
-- Here are some interesting ones from reddit

-- https://www.reddit.com/r/adventofsql/comments/1hbg92v/comment/m1i9cpx/
WITH season_sorted AS (SELECT *,
                              CASE season
                                  WHEN 'Spring' THEN 1
                                  WHEN 'Summer' THEN 2
                                  WHEN 'Fall' THEN 3
                                  WHEN 'Winter' THEN 4
                                  END season_order
                       FROM treeharvests),
     calc_avg AS (SELECT AVG(trees_harvested) OVER (PARTITION BY field_name
         ORDER BY harvest_year, season_order
         ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS three_season_moving_avg
                  FROM season_sorted)
SELECT round(max(three_season_moving_avg), 2) AS max_three_season_moving_avg
FROM calc_avg;

-- https://www.reddit.com/r/adventofsql/comments/1hbg92v/comment/m1iavrd/
-- My favorite solution
SELECT ROUND(AVG(trees_harvested) OVER (PARTITION BY field_name
    ORDER BY harvest_year, season_order
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS three_season_moving_avg
FROM treeharvests th
         JOIN LATERAL (SELECT CASE th.season
                                  WHEN 'Spring' THEN 1
                                  WHEN 'Summer' THEN 2
                                  WHEN 'Fall' THEN 3
                                  WHEN 'Winter' THEN 4
                                  END season_order) a ON TRUE
ORDER BY three_season_moving_avg DESC
LIMIT 1
;

-- https://www.reddit.com/r/adventofsql/comments/1hbg92v/comment/m1iciyg/
SELECT round((avg(trees_harvested) OVER (
    PARTITION BY field_name
    ORDER BY
        harvest_year,
        array_position(
                array ['Spring','Summer','Fall','Winter'],
                treeharvests.season::text
        )
    ROWS 2 preceding
    )), 2) as avg
FROM treeharvests
ORDER BY avg DESC
LIMIT 1;