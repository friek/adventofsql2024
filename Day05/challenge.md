# Santa's production dashboard

In the enchanting winter wonderland of the North Pole, where the night sky dances with the aurora borealis and snow
crunches delightfully underfoot, Santa Claus was feeling a mix of excitement and concern. The big night was approaching
rapidly, and the workshop was abuzz with elves crafting toys, wrapping gifts, and preparing the sleigh for its global
journey.

Santa sat by the fireplace in his cozy study, sipping hot cocoa with a hint of peppermint, pondering over his massive '
Naughty or Nice' list. Mrs. Claus, ever the voice of wisdom, noticed his furrowed brow. "What's troubling you, dear?"
she asked softly.

"Well," Santa began, stroking his snowy beard thoughtfully, "I've been hearing reports that toy production numbers have
been fluctuating over the past few days. Some days the elves surpass all expectations, and other days production seems
to dip unexpectedly. I worry that if this trend continues, we might not meet our Christmas Eve deadline."

Mrs. Claus smiled gently. "Perhaps it's time to delve into the data and see what's causing these variations."

"You're right," Santa agreed. "I need a detailed analysis of our daily toy production to understand these trends. Maybe
then we can identify any issues and ensure that every child receives a gift on Christmas morning."

Santa called upon Figgy, the most tech-savvy elf, renowned for his expertise in data analysis and SQL magic. "Figgy, I
need your help to analyze the daily toy production trends over the past week," Santa said. "We need to compare each
day's production to the previous day to identify any significant changes."

Elated by the challenge, Figgy set out to work, determined to provide Santa with the insights he needed to keep the
magic of Christmas alive.

### Example schema

```sql
DROP TABLE IF EXISTS toy_production CASCADE;
CREATE TABLE toy_production (
production_date DATE PRIMARY KEY,
toys_produced INTEGER
);
```

### Example Data

```sql
INSERT INTO toy_production (production_date, toys_produced)
VALUES ('2024-12-18', 500),
('2024-12-19', 550),
('2024-12-20', 525),
('2024-12-21', 600),
('2024-12-22', 580),
('2024-12-23', 620),
('2024-12-24', 610);
```

### Example Answer

```
production_date | toys_produced | previous_day_production | production_change | production_change_percentage 
-----------------+---------------+-------------------------+-------------------+------------------------------
 2024-12-21      |           600 |                     525 |                75 |                        14.29
 2024-12-19      |           550 |                     500 |                50 |                        10.00
 2024-12-23      |           620 |                     580 |                40 |                         6.90
 2024-12-24      |           610 |                     620 |               -10 |                        -1.61
 2024-12-22      |           580 |                     600 |               -20 |                        -3.33
 2024-12-20      |           525 |                     550 |               -25 |                        -4.55
 2024-12-18      |           500 |                         |                   |                             
```

### Solution to submit

2024-12-21

## The challenge 🎁

Using the provided schema and data, write a SQL query that analyzes the daily toy production trends for each date in the
table, comparing a date to the date before. The query should accomplish the following:

* List each day's production date and the number of toys produced on that day.
* Include the previous day's toy production next to each current day's production.
* Calculate the change in the number of toys produced compared to the previous day.
* Calculate the percentage change in production compared to the previous day.

The result set should display the following columns:

* `production_date`: The current date.
* `toys_produced`: Number of toys produced on the current date.
* `previous_day_production`: Number of toys produced on the previous date.
* `production_change`: Difference in toys produced between the current date and the previous date.
* `production_change_percentage`: Percentage change in production compared to the previous day.

Submit the `date` of the day with the largest daily increase in percentage

