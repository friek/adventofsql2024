# Santa's Cartesian Elf Skill-Matching Program

Santa's workshop is implementing a new mentoring program! He noticed that some elves excel at certain tasks but could
benefit from working with others who share the same skills. To make the workshop more efficient, Santa needs to pair up
elves who have the same skills so they can collaborate and learn from each other. However, he wants to make sure each
pair is only listed once (no duplicates where Elf1/Elf2 are reversed) and that elves aren't paired with themselves.

### Example schema

```sql
DROP TABLE workshop_elves CASCADE;
CREATE TABLE workshop_elves
(
    elf_id           SERIAL PRIMARY KEY,
    elf_name         VARCHAR(100) NOT NULL,
    primary_skill    VARCHAR(50)  NOT NULL,
    years_experience INTEGER      NOT NULL
);
```

### Example Data

```sql
INSERT INTO workshop_elves (elf_name, primary_skill, years_experience)
VALUES ('Tinker', 'Toy Making', 150),
       ('Sparkle', 'Gift Wrapping', 75),
       ('Twinkle', 'Toy Making', 90),
       ('Holly', 'Cookie Baking', 200),
       ('Jolly', 'Gift Wrapping', 85),
       ('Berry', 'Cookie Baking', 120),
       ('Star', 'Toy Making', 95);
```

### Expected output

```
elf_1_id | elf_2_id | shared_skill  
----------+----------+---------------
        4 |        6 | Cookie Baking
        5 |        2 | Gift Wrapping
        1 |        3 | Toy Making
```

### Expected submission

```
4,6,Cookie Baking
5,2,Gift Wrapping
1,3,Toy Making
```

## The challenge 🎁

Create a query that returns pairs of elves who share the same primary_skill. The pairs should be comprised of the elf
with the `most (max)` and `least (min`) years of experience in the primary_skill.

When you have multiple elves with the same years_experience, order the elves by elf_id in ascending order.

Your query should return:

* The ID of the first elf with the Max years experience
* The ID of the first elf with the Min years experience
* Their shared skill

Notes:

* Each pair should be returned only once.
* Elves can not be paired with themselves, a primary_skill will always have more than 1 elf.
* Order by primary_skill, there should only be one row per primary_skill.
* In case of duplicates order first by elf_1_id, then elf_2_id.

In the inputs below provide one row per primary_skill in the format, with no spaces and comma separation:

`elf_id_1,elf_id_2,shared_skill`

Do not use any special characters such as " or ' in your answer.

