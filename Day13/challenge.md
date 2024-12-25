# Santas Christmas card list 💌

Santa slumped in his ergonomic office chair, squinting at spreadsheets through his half-moon spectacles. The Board of
Christmas Directors had raised concerns about certain corporations receiving a disproportionate number of gift hampers.

"Mrs. Claus," he called out, "these numbers from MegaCorp look suspicious. How did one company get 40% of our premium
gift hampers last year?"

Mrs. Claus, who had recently completed her MBA in Christmas Analytics, pulled up their new database. "We need to analyze
the email domain patterns. Some companies might be gaming the system by having employees register multiple addresses."

They discovered that certain corporations had employees submitting wish lists through personal emails, corporate
addresses, and subsidiary company domains. The database queries revealed patterns: TechGiant Industries had somehow
accumulated more deluxe gift hampers than the entire nation of Luxembourg.

"Look at this clustering," Mrs. Claus pointed to a visualization. "These five domains - they're all shell companies for
Winter Wonderland Corp. They're artificially inflating their gift hamper quotas!"

Santa nodded gravely, his workshop's integrity at stake. They spent the night writing queries to identify suspicious
gift hamper-receiving patterns across corporate domains. The results were startling: three major companies had been
operating sophisticated gift hamper-maximizing schemes across hundreds of email domains.

"We'll need to implement domain aggregation rules," Santa decided. "One corporate entity, one gift hamper quota."

### Example schema

```sql
CREATE TABLE contact_list
(
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    email_addresses TEXT[] NOT NULL,
);
```

### Example data

```sql
INSERT INTO contact_list (name, email_addresses)
VALUES ('Santa Claus',
        ARRAY['santa@northpole.com', 'kringle@workshop.net', 'claus@giftsrus.com']),
       ('Head Elf',
        ARRAY['supervisor@workshop.net', 'elf1@northpole.com', 'toys@workshop.net']),
       ('Grinch',
        ARRAY['grinch@mountcrumpit.com', 'meanie@whoville.org']),
       ('Rudolph',
        ARRAY['red.nose@sleigh.com', 'rudolph@northpole.com', 'flying@reindeer.net']);
```

### Example result

```
      Domain      | Total Users |                              Users                               
------------------+-------------+------------------------------------------------------------------
 workshop.net     |           3 | {kringle@workshop.net,supervisor@workshop.net,toys@workshop.net}
 northpole.com    |           3 | {santa@northpole.com,elf1@northpole.com,rudolph@northpole.com}
 whoville.org     |           1 | {meanie@whoville.org}
 sleigh.com       |           1 | {red.nose@sleigh.com}
 giftsrus.com     |           1 | {claus@giftsrus.com}
 mountcrumpit.com |           1 | {grinch@mountcrumpit.com}
 reindeer.net     |           1 | {flying@reindeer.net}
```

### Example to submit

```workshop.net```
```northpole.com```