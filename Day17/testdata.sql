DROP TABLE IF EXISTS Workshops;
CREATE TABLE Workshops (
    workshop_id INT PRIMARY KEY,
    workshop_name VARCHAR(100),
    timezone VARCHAR(50),
    business_start_time TIME,
    business_end_time TIME
);

INSERT INTO Workshops (workshop_id, workshop_name, timezone, business_start_time, business_end_time) VALUES
(1, 'North Pole HQ', 'UTC', '09:00', '17:00'),
(2, 'London Workshop', 'Europe/London', '09:00', '17:00'),
(3, 'New York Workshop', 'America/New_York', '09:00', '17:00');
