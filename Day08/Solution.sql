-- Solution from https://www.reddit.com/r/adventofsql/comments/1h95wqq/comment/m109u8g/
WITH RECURSIVE subordinates AS (SELECT staff_id, staff_name, 1 as level, CAST(1 AS TEXT) AS path
                                FROM staff
                                WHERE staff_id = 1
                                UNION
                                SELECT e.staff_id,
                                       e.staff_name,
                                       (s.level + 1)                           as level,
                                       s.path::TEXT || ',' || e.staff_id::TEXT AS path
                                FROM staff e
                                         INNER JOIN subordinates s ON s.staff_id = e.manager_id)
SELECT *
FROM subordinates
ORDER BY level DESC;