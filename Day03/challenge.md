# Day 3

Mrs. Claus has a delightful but daunting task ahead of her. Every year, she hosts a magnificent Christmas dinner for all
the elves, reindeer handlers, and special holiday helpers at the North Pole. This year, she's expecting more guests than
ever - over 78 helpers in total! So she's only interested in past events where there were more than 78 guests. She keeps
meticulous records of all previous Christmas dinners in her magical database, stored as XML data that captures
everyone's preferences and reactions to different dishes. She needs your help to understand which dishes are the most
popular.

## Table schemas
```sql
DROP TABLE IF EXISTS christmas_menus CASCADE;

CREATE TABLE christmas_menus (
  id SERIAL PRIMARY KEY,
  menu_data XML
)
```

## Example data
### Version 1
```sql
INSERT INTO christmas_menus (id, menu_data) VALUES
(1, '<menu version="1.0">
    <dishes>
        <dish>
            <food_item_id>99</food_item_id>
        </dish>
        <dish>
            <food_item_id>102</food_item_id>
        </dish>
    </dishes>
    <total_count>80</total_count>
</menu>');
```

### Version 2
```sql
INSERT INTO christmas_menus (id, menu_data) VALUES
(2, '<menu version="2.0">
    <total_guests>85</total_guests>
    <dishes>
        <dish_entry>
            <food_item_id>101</food_item_id>
        </dish_entry>
        <dish_entry>
            <food_item_id>102</food_item_id>
        </dish_entry>
    </dishes>
</menu>');
```

### Version that shouldn't be parsed
Because there must have been more than 78 guests at this event.

```sql
INSERT INTO christmas_menus (id, menu_data) VALUES
(3, '<menu version="beta">
  <guestCount>15</guestCount>
  <foodList>
      <foodEntry>
          <food_item_id>102</food_item_id>
      </foodEntry>
  </foodList>
</menu>');
```

### Sample result
```sql
food_item_id | frequency
-------------+-----------
102          | 2
```

## The challenge 🎁

The challenge is that some records are stored in different XML schemas. Mrs. Claus needs help writing a SQL query that
can search through all schema versions to find the most beloved dishes from the busiest celebrations. As she's having
more than 78 guests this year, she wants to make sure the dishes are popular with a large crowd, so only use years where
she had more than 78 guests.

You will have to do some prep-work before you write your final query, like understanding how many unique schema versions
exist and how to parse each schema using SQL.

Help Mrs. Claus write a SQL query that can:

1. Parse through all different schema versions of menu records
1. Find menu entries where the guest count was above 78
1. Extract the food_item_ids from those successful big dinners
1. From this enormous list of items, determine which dish (by food_item_id) appears most frequently across all of the
   dinners.

Input the food_item_id of the food item that appears the most often