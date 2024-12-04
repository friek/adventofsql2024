# The Great Toy Tag Migration of 2024

'Twas the month before Christmas, and all through Santa's workshop, the elves were in a panic! During the annual toy
database upgrade, something went terribly wrong with the magical toy-tracking system. The enchanted database that keeps
track of all toy descriptions and magical properties had undergone a massive update, changing how toys were tagged and
categorized.

Head Elf Database Administrator (HEDA) Pixelspring discovered that while they still had all the previous toy tags and
the new ones, they desperately needed to understand what exactly changed during the upgrade. Some toys gained new
magical properties, others lost their old enchantments, and some maintained their original charm.

Santa needs your help! As a consulting Database Wizard, you must help the elves analyze these changes so they can ensure
each toy maintains its Christmas magic before being delivered to children around the world. Your task is to write a
query that will help identify which magical properties (tags) were added, which remained constant, and which were lost
during the great toy tag migration.

The fate of Christmas organization rests in your hands - can you help the elves make sense of their toy tags before
Santa's big night?

## Table Schema

```sql
DROP TABLE IF EXISTS toy_production CASCADE;
CREATE TABLE toy_production (
toy_id INT,
toy_name VARCHAR(100),
previous_tags TEXT[],
new_tags TEXT[]
);
```

## Example data

```sql
INSERT INTO toy_production
VALUES (1, 'Robot', ARRAY['fun', 'battery'], ARRAY['smart', 'battery', 'educational', 'scientific']),
(2, 'Doll', ARRAY['cute', 'classic'], ARRAY['cute', 'collectible', 'classic']),
(3, 'Puzzle', ARRAY['brain', 'wood'], ARRAY['educational', 'wood', 'strategy']);
```

## Sample result:

# The challenge 🎁

Help the elves analyze toy tags by finding:

* New tags that weren't in previous_tags (call this added_tags)
* Tags that appear in both previous and new tags (call this unchanged_tags)
* Tags that were removed (call this removed_tags)
* For each toy, return toy_name and these three categories as arrays.

Find the toy with the most added tags, there is only 1, and submit the following:

* toy_id
* added_tags length
* unchanged_tags length
* removed_tags length
* 
Remember to handle cases where the array is empty, their output should be 0.