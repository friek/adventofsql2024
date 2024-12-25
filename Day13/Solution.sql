-- My own solution
with email_addresses as (select unnest(email_addresses) as email_address
                         from contact_list),
     domains as (select email_address, substr(email_address, position('@' in email_address) + 1) as domain
                 from email_addresses)
select domain, count(*), array_agg(email_address)
from domains
group by domain
order by count(*) desc
;

-- More eloquent: https://www.reddit.com/r/adventofsql/comments/1hcz80i/comment/m1tw3ht/
SELECT SPLIT_PART(UNNEST(email_addresses), '@', 2) AS "domain",
       COUNT(1)                                    AS cnt
FROM contact_list
GROUP BY "domain"
ORDER BY cnt DESC
LIMIT 1;