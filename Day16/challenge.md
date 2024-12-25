# Santa's Delivery Time Analysis

After reading The Unicorn Project, Santa has become fascinated with applying DevOps principles to his gift delivery
system. This December, the North Pole Command Center is activating their advanced GPS tracking system to identify
bottlenecks and optimize Santa's Christmas Eve journey across the globe. They've implemented a sophisticated PostgreSQL
database with spatial tracking capabilities to measure dwell time and movement patterns, capturing every stop the
magical sleigh makes with precise coordinates and timestamps.

The data reveals Santa's current delivery pattern: multiple visits to major metropolitan areas, showing how he
systematically covers different neighbourhoods within each city. While this demonstrates good coverage, it may not
represent the most efficient delivery flow. By analyzing the time spent in each zone, we can identify where the delivery
pipeline might be experiencing constraints.

Each location in the database is carefully mapped using PostGIS geometry, with polygonal boundaries defining the
delivery zones of major cities. The timestamps and coordinates will allow us to calculate key metrics such as time spent
per zone, frequency of visits, and delivery density patterns. This data-driven approach will help identify where the "
magic" of Christmas delivery might benefit from some modern efficiency principles.

Our goal is to analyze where Santa is spending most of his time, identify potential bottlenecks, and suggest
improvements based on the principles of flow optimization. This report will examine the duration spent in each delivery
zone, helping Santa and his team implement continuous improvement in their gift delivery pipeline.

Now we need to find out where he's spending most of his time so he can try to find efficiencies.

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
    ('2024-12-24 21:00:00+00', ST_SetSRID(ST_Point(-73.985130, 40.758896), 4326)), -- Times Square, New York
    ('2024-12-24 22:00:00+00', ST_SetSRID(ST_Point(-73.850272, 40.817577), 4326)), -- Albany, New York State
    ('2024-12-24 23:00:00+00', ST_SetSRID(ST_Point(-118.243683, 34.052235), 4326)), -- Downtown Los Angeles
    ('2024-12-25 00:00:00+00', ST_SetSRID(ST_Point(139.691706, 35.689487), 4326)), -- Tokyo
    ('2024-12-25 01:00:00+00', ST_SetSRID(ST_Point(25.729066, 66.500000), 4326)); -- Rovaniemi, Lapland
```

```sql
INSERT INTO areas (place_name, polygon) VALUES
    ('New_York', ST_SetSRID(ST_GeomFromText('POLYGON((-74.25909 40.477399, -73.700272 40.477399, -73.700272 40.917577, -74.25909 40.917577, -74.25909 40.477399))'), 4326)),
    ('Los_Angeles', ST_SetSRID(ST_GeomFromText('POLYGON((-118.668176 33.703652, -118.155289 33.703652, -118.155289 34.337306, -118.668176 34.337306, -118.668176 33.703652))'), 4326)),
    ('Tokyo', ST_SetSRID(ST_GeomFromText('POLYGON((138.941375 35.523222, 140.68074 35.523222, 140.68074 35.898782, 138.941375 35.898782, 138.941375 35.523222))'), 4326)),
    ('Lapland', ST_SetSRID(ST_GeomFromText('POLYGON((25.629066 66.450000, 25.829066 66.450000, 25.829066 66.550000, 25.629066 66.550000, 25.629066 66.450000))'), 4326));
```

### Example result
```
| place_name | total_hours_spent |
|------------|-------------------------|
| New_York     | 2.0000000000000000 |
| Los_Angeles   | 1.0000000000000000 |
| Tokyo         | 1.0000000000000000 |
| Lapland      | null |
```

### Explanation

This is because he spent 2 hours in New York. Each timestamp is when Santa entered the timezone.

### Example to submit

```
New_York
```

## The challenge 🎁

In which timezone has Santa spent the most time?

Assume that each timestamp is when Santa entered the timezone.

Ignore the last timestamp when Santa is in Lapland.