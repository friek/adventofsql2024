# The Great North Pole Bureaucracy Bust of 2024

"Red alert! Red alert!" Jingle, the Systems Administrator Elf, burst into Santa's office, waving a stack of papers
frantically. "The organizational database has hit 100,000 employees!"

Santa, who had been enjoying his morning cookie, nearly choked. "One hundred thousand? That can't be right. When I
started, it was just me and a dozen elves."

Mrs. Claus, peering over her candy-cane striped reading glasses, sighed. "I warned you about implementing that 'Elf
Resource Management' system. Remember when the Productivity Optimization Department created a Task Force to study the
efficiency of the Gift Wrapping Committee's Ribbon Selection Subcommittee?"

Santa nodded grimly. The signs had been there. The multiplication of middle managers. The proliferation of pointless
meetings. The emergence of terms like "synergistic gift-giving strategies" and "cross-functional workshop initiatives."

"Last week," Jingle continued, "I discovered seventeen different departments dedicated to optimizing the hot cocoa
supply chain. Seventeen! And none of them actually make hot cocoa!"

Mrs. Claus pulled up the database on her tablet. "It gets worse. We have elves managing elves who manage elves who
oversee elves who supervise elves who coordinate with elves who report to elves about toy production... but nobody's
actually making toys anymore!"

"That's it!" Santa slammed his cookie down. "We need to map this entire organizational structure. Every manager, every
report, every level. No more hiding behind bureaucratic tinsel! Jingle, fire up the database. We're going to write a
recursive query that'll make the Grinch's heart shrinking look like child's play."

And so began Operation Database Delight, a massive effort to untangle the most convoluted organizational structure the
North Pole had ever seen. The goal? To transform Santa's Workshop from a bureaucratic nightmare back into the lean,
mean, toy-making machine it was meant to be.

As Santa rolled up his sleeves and prepared to dive into the data, he couldn't help but chuckle at the irony. He'd spent
centuries making lists of naughty and nice children, but never thought he'd need one for middle management.

"Ho ho ho," he muttered, cracking his knuckles as he sat down at his terminal. "Let's see who's been padding their
departments with unnecessary positions. Recursive CTEs don't lie, my dear elves. They don't lie at all."

### Example schema

```sql
CREATE TABLE staff
(
    staff_id   INT PRIMARY KEY,
    staff_name VARCHAR(100) NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES Staff (staff_id)
);
```

### Example data

```sql
INSERT INTO staff (staff_id, staff_name, manager_id)
VALUES (1, 'Santa Claus', NULL),      -- CEO level
       (2, 'Head Elf Operations', 1), -- Department Head
       (3, 'Head Elf Logistics', 1),  -- Department Head
       (4, 'Senior Toy Maker', 2),    -- Team Lead
       (5, 'Senior Gift Wrapper', 2), -- Team Lead
       (6, 'Inventory Manager', 3),   -- Team Lead
       (7, 'Junior Toy Maker', 4),    -- Staff
       (8, 'Junior Gift Wrapper', 5), -- Staff
       (9, 'Inventory Clerk', 6),     -- Staff
       (10, 'Apprentice Toy Maker', 7); -- Entry Level
```

### Expected output

```
staff_id |      staff_name      | level |    path    
----------+----------------------+-------+------------
       10 | Apprentice Toy Maker |     5 | 1,2,4,7,10
        9 | Inventory Clerk      |     4 | 1,3,6,9
        8 | Junior Gift Wrapper  |     4 | 1,2,5,8
        7 | Junior Toy Maker     |     4 | 1,2,4,7
        6 | Inventory Manager    |     3 | 1,3,6
        4 | Senior Toy Maker     |     3 | 1,2,4
        5 | Senior Gift Wrapper  |     3 | 1,2,5
        3 | Head Elf Logistics   |     2 | 1,3
        2 | Head Elf Operations  |     2 | 1,2
        1 | Santa Claus          |     1 | 1
```

### Expected submission

```sql
5
```

## The challenge 🎁

We want to find out how many managers the most over-managed employee has (levels deep).

To do this, you're going to need to go through all the employees and find out who their manager is, and who their manger
is, and who their manger is... you see where this is going

You need to produce a report that calculates this management depth for all employees

Order it by the number of levels in descending order.

**Submit the highest total number of levels of all the staff in the DB.**

If there are multiple with the same level submit that.