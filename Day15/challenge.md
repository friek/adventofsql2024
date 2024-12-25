# Santa is missing!

The North Pole was in chaos. Santa hadn't been seen since December 26th when his GPS tracker showed him landing at O'
Malley's Bar in Manhattan. Mrs. Claus was beside herself with worry, and the elves were frantically checking their
location devices.

"Look!" squeaked Tinker the elf, pointing at the blinking monitor. "His last coordinates are 40.7589° N, 73.9851° W -
but what does that mean?"

Your job is to help locate him.

### Example schema
```sql
CREATE TABLE sleigh_locations (
    id SERIAL PRIMARY KEY,
    timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    coordinate GEOGRAPHY(POINT) NOT NULL
);
```

```sql
CREATE TABLE areas (

    id SERIAL PRIMARY KEY,
    place_name VARCHAR(255) NOT NULL,
    polygon GEOGRAPHY(POLYGON) NOT NULL
);
```

### Example data

```sql
INSERT INTO sleigh_locations (timestamp, coordinate) VALUES
    ('2024-12-24 22:00:00+00', ST_SetSRID(ST_Point(-73.985130, 40.758896), 4326)), -- Times Square, New York
    ('2024-12-24 23:00:00+00', ST_SetSRID(ST_Point(-118.243683, 34.052235), 4326)), -- Downtown Los Angeles
    ('2024-12-25 00:00:00+00', ST_SetSRID(ST_Point(139.691706, 35.689487), 4326)); -- Tokyo
```

```sql
INSERT INTO areas (place_name, polygon) VALUES
    ('New_York', ST_SetSRID(ST_GeomFromText('POLYGON((-74.25909 40.477399, -73.700272 40.477399, -73.700272 40.917577, -74.25909 40.917577, -74.25909 40.477399))'), 4326)),
    ('Los_Angeles', ST_SetSRID(ST_GeomFromText('POLYGON((-118.668176 33.703652, -118.155289 33.703652, -118.155289 34.337306, -118.668176 34.337306, -118.668176 33.703652))'), 4326)),
    ('Tokyo', ST_SetSRID(ST_GeomFromText('POLYGON((138.941375 35.523222, 140.68074 35.523222, 140.68074 35.898782, 138.941375 35.898782, 138.941375 35.523222))'), 4326));
```

### Example question

Which area was Santa on 2024-12-24 23:00:00+00?

### Example result

```
timestamp         |	area
----------------------|-----------------------
2024-12-24 22:00:00+00	| New_York
2024-12-24 23:00:00+00	| Los_Angeles
2024-12-25 00:00:00+00	| Tokyo
```

### Example to submit

```
Los_Angeles
```

## The challenge 🎁

Using the list of areas you need to find which city the last sleigh_location is located in.

Submit the city name only.

Note: This task might seem simple but its going to get much trickier tomorrow and its essential you nail this part first.