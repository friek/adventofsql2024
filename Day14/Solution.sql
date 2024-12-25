-- My own solution
select receipts.*
from santarecords sr,
     json_table(sr.cleaning_receipts, '$[*]' columns(
receipt_id for ordinality,
garment text path '$.garment',
color text path '$.color',
    drop_off date path '$.drop_off'
)) as receipts
where garment = 'suit'
  and color = 'green'
order by drop_off desc
;