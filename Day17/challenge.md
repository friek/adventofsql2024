# Christmas time zone madness

Santa’s global operation spans multiple workshops, with the North Pole HQ coordinating a vast network of elves. From New York to London and further, each workshop plays a critical role in ensuring Christmas magic happens on time, managing everything from toy production to sleigh logistics. But there’s a challenge—time. Each location operates on 9 AM to 5 PM local hours, creating a complex puzzle of finding meeting windows when everyone can connect.

For the operation to run smoothly, aligning schedules is crucial. The elves need to pinpoint the rare moments when all workshops can virtually gather, sharing updates and solving problems without disrupting productivity. It’s a race against the clock to ensure the entire operation is synchronized for holiday delivery. Despite the challenge, the magic of teamwork keeps the North Pole’s mission stronger than ever.

### Example schema

```sql
CREATE TABLE Workshops (
    workshop_id INT PRIMARY KEY,
    workshop_name VARCHAR(100),
    timezone VARCHAR(50),
    business_start_time TIME,
    business_end_time TIME
);
```

### Example data

```sql
INSERT INTO Workshops (workshop_id, workshop_name, timezone, business_start_time, business_end_time) VALUES
(1, 'North Pole HQ', 'UTC', '09:00', '17:00'),
(2, 'London Workshop', 'Europe/London', '09:00', '17:00'),
(3, 'New York Workshop', 'America/New_York', '09:00', '17:00');
```

### Example result

```
 meeting_start_utc | meeting_end_utc 
-------------------+-----------------
 14:00:00          | 15:00:00
 14:30:00          | 15:30:00
 15:00:00          | 16:00:00
 15:30:00          | 16:30:00
 16:00:00          | 17:00:00
```

### Example to submit

```
14:00:00
```

## The challenge 🎁

Challenge Requirements:

* Find all possible 60-minute meeting windows where all participating workshops are within their business hours
* Return results in UTC format
* Submit the earliest meeting start time that all offices can make.
