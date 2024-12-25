# The Great Gift Ranking 🧢

Santa was puzzled. Every year, children's wish lists grew more diverse, making it harder to know which gifts truly
captured their hearts. Mrs. Claus suggested tracking not just how many times each gift was requested, but its relative
popularity compared to others.

One evening, as elves scurried through the workshop, Santa sat at his ancient desk, reviewing a magical scroll that
ranked each gift's standing. The Hat, surprisingly, emerged as this season's most cherished item, while his usually
reliable Electronics department saw steady but lesser demand.

This insight would help him adjust his workshop's production and guide his elves' efforts more efficiently. "Sometimes
the simplest gifts bring the most joy," he chuckled, watching an elf carefully craft another warm winter hat.

With this new ranking system in place, Santa felt confident he could better understand changing trends and bring more
happiness to children worldwide.

### Example schema

```sql
DROP TABLE gifts CASCADE;
CREATE TABLE gifts (
gift_id INT PRIMARY KEY,
gift_name VARCHAR(100) NOT NULL,
price DECIMAL(10, 2)
);
DROP TABLE gift_requests CASCADE;
CREATE TABLE gift_requests (
request_id INT PRIMARY KEY,
gift_id INT,
request_date DATE,
FOREIGN KEY (gift_id) REFERENCES Gifts(gift_id)
);
```

### Example data

```sql
INSERT INTO gifts
VALUES (1, 'Robot Kit', 89.99),
(2, 'Smart Watch', 149.99),
(3, 'Teddy', 199.99),
(4, 'Hat', 59.99);

INSERT INTO gift_requests
VALUES (1, 1, '2024-12-25'),
(2, 1, '2024-12-25'),
(3, 1, '2024-12-25'),
(4, 2, '2024-12-25'),
(5, 2, '2024-12-25'),
(6, 2, '2024-12-25'),
(7, 3, '2024-12-25'),
(8, 3, '2024-12-25'),
(9, 3, '2024-12-25'),
(10, 3, '2024-12-25'),
(11, 4, '2024-12-25'),
(12, 4, '2024-12-25'),
(13, 4, '2024-12-25'),
(14, 4, '2024-12-25'),
(15, 4, '2024-12-25');
```

### Example result

```
  gift_name  | overall_rank 
-------------+--------------
 Hat         |         1.00
 Teddy       |         0.67
 Robot Kit   |         0.00
 Smart Watch |         0.00
```

### Example to submit

```
Teddy
```

```
0.67
```

## The challenge 🎁

Find the toy with the second highest percentile of requests. Submit the name of the toy and the percentile value.

If there are multiple values, choose the first occurrence.

Order by percentile descending, then gift name ascending.