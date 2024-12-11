# Reindeer Training Records

The North Pole's evening assembly fell silent as Rudolph, his antlers showing hints of silver, limped to the front of
the gathering. For nearly three centuries, he had guided Santa's sleigh through blizzards and starlit nights. Now, his
voice trembling like winter wind, he spoke of the arthritis that had finally caught up with his legendary sprint.

Santa's brow furrowed beneath his white eyebrows. The wrong choice of successor could ripple through centuries of future
Christmases. Even Rudolf, whose red nose had saved that one foggy night, would find no favoritism here. This decision
would be made on merit alone.

At the Training Academy, scrolls of performance records lined the walls. Each graceful arc through clouds, each perfect
landing on icy rooftops - all meticulously documented. Elf Windsworth, his spectacles fogged with responsibility, knew
that pure speed alone wouldn't tell the whole story. A true leader needed to demonstrate unwavering excellence across
all conditions.

As his fingers danced across the newly installed North Pole Database terminal, Windsworth crafted his query with
precision. He needed to see each reindeer's finest moments, their top speed trials that would reveal not just their
swiftness, but their ability to perform when the stakes were highest. After all, Christmas Eve offered no second
chances.

### Example schema

```sql
DROP TABLE IF EXISTS Reindeers CASCADE;
CREATE TABLE Reindeers
(
    reindeer_id      SERIAL PRIMARY KEY,
    reindeer_name    VARCHAR(50) NOT NULL,
    years_of_service INTEGER     NOT NULL,
    speciality       VARCHAR(100)
);

DROP TABLE IF EXISTS Training_Sessions CASCADE;
CREATE TABLE Training_Sessions
(
    session_id         SERIAL PRIMARY KEY,
    reindeer_id        INTEGER REFERENCES Reindeers (reindeer_id),
    exercise_name      VARCHAR(100)  NOT NULL,
    speed_record       DECIMAL(5, 2) NOT NULL,
    session_date       DATE          NOT NULL,
    weather_conditions VARCHAR(50)
);
```

### Example Data

```sql
INSERT INTO Reindeers (reindeer_name, years_of_service, speciality)
VALUES ('Dasher', 287, 'Sprint Master'),
       ('Dancer', 283, 'Agility Expert'),
       ('Prancer', 275, 'High-Altitude Specialist'),
       ('Comet', 265, 'Long-Distance Expert'),
       ('Rudolf', 152, 'Night Navigation');

INSERT INTO Training_Sessions (reindeer_id, exercise_name, speed_record, session_date, weather_conditions)
VALUES (1, 'Sprint Start', 88.5, '2024-11-15', 'Snowy'),
       (1, 'High-Speed Turn', 92.3, '2024-11-20', 'Clear'),
       (1, 'Rooftop Landing', 85.7, '2024-11-25', 'Windy'),
       (2, 'Sprint Start', 90.1, '2024-11-15', 'Snowy'),
       (2, 'High-Speed Turn', 94.8, '2024-11-20', 'Clear'),
       (2, 'Rooftop Landing', 89.2, '2024-11-25', 'Windy'),
       (3, 'Sprint Start', 87.3, '2024-11-15', 'Snowy'),
       (3, 'High-Speed Turn', 91.5, '2024-11-20', 'Clear'),
       (3, 'Rooftop Landing', 88.9, '2024-11-25', 'Windy'),
       (4, 'Sprint Start', 89.7, '2024-11-15', 'Snowy'),
       (4, 'High-Speed Turn', 93.2, '2024-11-20', 'Clear'),
       (4, 'Rooftop Landing', 87.8, '2024-11-25', 'Windy'),
       (5, 'Sprint Start', 86.9, '2024-11-15', 'Snowy'),
       (5, 'High-Speed Turn', 90.8, '2024-11-20', 'Clear'),
       (5, 'Rooftop Landing', 88.1, '2024-11-25', 'Windy');
```

### Example result

```
 reindeer_name | top_speed 
---------------+-----------
 Dancer        |     94.80
 Comet         |     93.20
 Dasher        |     92.30
```

## The challenge 🎁

Rudolph is retiring as lead reindeer, and Santa needs to analyze each reindeer's speed records to choose the new leader.

To do this you need to:

* Calculate the average speed for each reindeer in each exercise type, excluding Rudolf.
* Find the highest average speed for each reindeer amongst those average speeds.
* Select the top 3 reindeer based on their highest average speed. Round the score to 2 decimal places.

Enter the name and score of the top 3 reindeer in the format `name,highest_average_score`, but remember Rudolph is
retiring so don't pick him.