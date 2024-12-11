# The Christmas party drinking list 🍸

**Subject**: URGENT - Internal Memo from Santa  
**To**: Mrs. Claus  
**CC**: Head of Elf Resources  
**Date**: December 10, 2024

My dearest Mrs. Claus,

I must share some concerns that have been weighing heavily on my mind. Over the past month, I've noticed some rather
worrying trends in our workshop productivity. Just yesterday, I found three elves sleeping in the wrapping paper bin,
and another group was singing "Jingle Bells" in what I can only describe as questionable harmony at 10 AM.

After reviewing our North Pole beverage inventory records, I'm starting to suspect that our holiday spirits might be a
bit too... spirited. The empty Baileys bottles in the recycling bin are piling up faster than children's Christmas wish
lists! And while I appreciate the elves' enthusiasm for traditional holiday beverages, I need to understand exactly
what's being consumed in our workshop.

I've tasked our Data Elf Analytics team with creating a comprehensive report of all beverage consumption. They've been
tracking every drink served in the workshop over the past few weeks, from Hot Cocoa (which I hope is the majority) to
the more "festive" options like Baileys and Sherry. I'm particularly concerned about the Mulled Wine situation after
last week's incident with the toy train assembly line - those wooden trains should NOT have been painted in zig-zags!

We need to analyze this data carefully to ensure our workshop maintains its magical efficiency while keeping our elves'
holiday cheer at appropriate levels. Remember, we still have thousands of toys to make before Christmas Eve!

Could you help me review the attached beverage consumption data? I'm especially interested in identifying which drinks
are being consumed in the highest quantities. This information will be crucial for our upcoming "Responsible Revelry"
workshop planning.

With worried holiday wishes,
Santa

P.S. - Please don't mention this to the elves yet. Tinker, our Head Elf, is already sensitive about his "quality
control" testing of the Eggnog.

### Example schema

```sql
DROP TABLE IF EXISTS Drinks CASCADE;
CREATE TABLE Drinks
(
    drink_id   SERIAL PRIMARY KEY,
    drink_name VARCHAR(50) NOT NULL,
    date       DATE        NOT NULL,
    quantity   INTEGER     NOT NULL
);
```

### Example Question

Submit the **date** where the following total quantity of drinks were consumed:

* Hot Cocoa: 75
* Eggnog: 50
* Peppermint Schnapps: 30

### Example Data

```sql
INSERT INTO Drinks (drink_name, date, quantity)
VALUES ('Eggnog', '2024-12-24', 50),
       ('Eggnog', '2024-12-25', 60),
       ('Hot Cocoa', '2024-12-24', 75),
       ('Hot Cocoa', '2024-12-25', 80),
       ('Peppermint Schnapps', '2024-12-24', 30),
       ('Peppermint Schnapps', '2024-12-25', 40);
```

### Example result

```
    date    | eggnog | hot cocoa | peppermint schnapps 
------------+--------+----------+--------------------
 2024-12-24 |     50 |       75 |                 30
 2024-12-25 |     60 |       80 |                 40

```

Results to submit:

```
2024-12-24
```

## The challenge 🎁

You are working with a table named drinks, which logs various types of beverages consumed over the Christmas parties,
along with the date and quantity consumed. Your task is to determine which drinks were the most popular by calculating
the total quantity consumed for each type of drink.

Submit the **date** where the following total quantity of drinks were consumed:

* HotCocoa: 38
* PeppermintSchnapps: 298
* Eggnog: 198
