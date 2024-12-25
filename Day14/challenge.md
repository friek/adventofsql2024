# Where is Santa's green suit?

Santa's been losing it lately - his workshop office is a maze of crumpled receipts, invoices, and tags from centuries of
shopping. "It has to be here!" he bellows, diving into another pile of papers, sending ancient toy receipts flying
everywhere. His precious green suit - the one he wanted to surprise everyone with this Christmas - is missing. Mrs.
Claus stands in the doorway, pinching the bridge of her nose. "Nicholas, dear, I've told you three times - it's at the
dry cleaners. I dropped it off myself." But Santa's too far gone, muttering about filing systems and color-coding as he
disappears beneath another avalanche of receipts.

### Context

Santa's personal assistant maintains a digital record of all his dry cleaning receipts. Each receipt is stored as a JSON
object in an array, containing details about each garment cleaned, including: receipt ID garment type color cleaning
cost drop-off date pickup date

### Table Structure

```sql
CREATE TABLE SantaRecords
(
    record_id         INT PRIMARY KEY,
    record_date       DATE,
    cleaning_receipts JSONB
);
```

### Sample Data

```sql
INSERT INTO SantaRecords (record_id, record_date, cleaning_receipts)
VALUES (1, '2024-11-25', '[
    {
        "receipt_id": "R120",
        "garment": "hat",
        "color": "red",
        "cost": 15.99,
        "drop_off": "2024-11-25",
        "pickup": "2024-11-27"
    },
    {
        "receipt_id": "R121",
        "garment": "mittens",
        "color": "white",
        "cost": 12.99,
        "drop_off": "2024-11-25",
        "pickup": "2024-11-27"
    }
]');
```

```sql
INSERT INTO SantaRecords (record_id, record_date, cleaning_receipts)
VALUES (2, '2024-12-01', '[
    {
        "receipt_id": "R122",
        "garment": "suit",
        "color": "red",
        "cost": 25.99,
        "drop_off": "2024-12-01",
        "pickup": "2024-12-03"
    },
    {
        "receipt_id": "R123",
        "garment": "boots",
        "color": "black",
        "cost": 18.99,
        "drop_off": "2024-12-01",
        "pickup": "2024-12-03"
    }
]');
```

```sql
-- Here's the record with the green suit
INSERT INTO SantaRecords (record_id, record_date, cleaning_receipts)
VALUES (3, '2024-12-10', '[
    {
        "receipt_id": "R124",
        "garment": "suit",
        "color": "green",
        "cost": 29.99,
        "drop_off": "2024-12-10",
        "pickup": "2024-12-12"
    },
    {
        "receipt_id": "R125",
        "garment": "scarf",
        "color": "green",
        "cost": 10.99,
        "drop_off": "2024-12-10",
        "pickup": "2024-12-12"
    }
]');
```

### Example result

```
 record_date |                                                        receipt_details                                                         
-------------+--------------------------------------------------------------------------------------------------------------------------------
 2024-12-10  | [{"cost": 29.99, "color": "green", "pickup": "2024-12-12", "garment": "suit", "drop_off": "2024-12-10", "receipt_id": "R124"}]
```

### Example to submit

```
2024-12-10
```

## The challenge 🎁

Mrs. Claus needs to find the receipt for Santa's green suit that was dry cleaned.

She needs to know when it was dropped off, so submit the drop off date.

Order by the latest drop off date 