-- Not solved by myself unfortunately. This is a solution taken from
-- https://www.reddit.com/r/adventofsql/comments/1h8fk2y/comment/m0vx0id/
SELECT DISTINCT
    FIRST_VALUE(elf_id) OVER (PARTITION BY primary_skill ORDER BY years_experience DESC, elf_id) AS max_id,
    FIRST_VALUE(elf_id) OVER (PARTITION BY primary_skill ORDER BY years_experience, elf_id) AS min_id,
    primary_skill
FROM workshop_elves
ORDER BY max_id, min_id
;