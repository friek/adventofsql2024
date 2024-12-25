# The Christmas tree famine 🎄

Santa's Workshop faces an urgent crisis. The North Pole's Christmas tree farms, which have supplied trees to children
worldwide for centuries, are showing mysterious patterns in their harvest numbers. Mrs. Claus has personally requested
an analysis after noticing some fields producing record numbers while others struggle. She wants to find out which field
has been performing well over recent seasons.

The TreeHarvests database contains vital information about every Christmas tree harvest since 2022. Understanding these
patterns is crucial for maintaining the magic of Christmas in homes across the globe.

### Example Schema

```sql
CREATE TABLE TreeHarvests (
field_name VARCHAR(50),
harvest_year INT,
season VARCHAR(6),
trees_harvested INT
);
```

### Example Data

```sql
INSERT INTO TreeHarvests
VALUES ('Rudolph Ridge', 2023, 'Spring', 150),
('Rudolph Ridge', 2023, 'Summer', 180),
('Rudolph Ridge', 2023, 'Fall', 220),
('Rudolph Ridge', 2023, 'Winter', 300),
('Dasher Dell', 2023, 'Spring', 165),
('Dasher Dell', 2023, 'Summer', 195),
('Dasher Dell', 2023, 'Fall', 210),
('Dasher Dell', 2023, 'Winter', 285);
```

### Example Result

```
 field_name   | harvest_year | season | three_season_moving_avg 
---------------+--------------+--------+-------------------------
 Rudolph Ridge |         2023 | Winter |                  233.33
 Dasher Dell   |         2023 | Winter |                  230.00
 Dasher Dell   |         2023 | Fall   |                  190.00
 Rudolph Ridge |         2023 | Fall   |                  183.33
 Dasher Dell   |         2023 | Summer |                  180.00
 Dasher Dell   |         2023 | Spring |                  165.00
 Rudolph Ridge |         2023 | Summer |                  165.00
 Rudolph Ridge |         2023 | Spring |                  150.00
```

Example submission:

```
233.33
```

## The challenge 🎁

Mrs. Claus needs a comprehensive analysis of the tree farms. Using window functions, create a query that will shed some
light on the field perfomance.

**Show the 3-season moving average per field per season per year**

Write a single SQL query using window functions that will reveal these vital patterns. Your analysis will help ensure
that every child who wishes for a Christmas tree will have one for years to come.

Order them by three_season_moving_avg descending to make it easier to find the largest figure.

Seasons are ordered as follows:  
* Spring THEN 1
* Summer THEN 2
* Fall THEN 3
* Winter THEN 4

Find the row with the most `three_season_moving_avg`