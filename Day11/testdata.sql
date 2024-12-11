DROP TABLE IF EXISTS TreeHarvests;
CREATE TABLE TreeHarvests
(
    field_name      VARCHAR(50),
    harvest_year    INT,
    season          VARCHAR(6),
    trees_harvested INT
);

INSERT INTO TreeHarvests
VALUES ('Rudolph Ridge', 2023, 'Spring', 150),
       ('Rudolph Ridge', 2023, 'Summer', 180),
       ('Rudolph Ridge', 2023, 'Fall', 220),
       ('Rudolph Ridge', 2023, 'Winter', 300),
       ('Dasher Dell', 2023, 'Spring', 165),
       ('Dasher Dell', 2023, 'Summer', 195),
       ('Dasher Dell', 2023, 'Fall', 210),
       ('Dasher Dell', 2023, 'Winter', 285);
