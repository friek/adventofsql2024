with email_addresses as (select unnest(email_addresses) as email_address
                         from contact_list),
     domains as (select email_address, substr(email_address, position('@' in email_address) + 1) as domain
                 from email_addresses)
select domain, count(*), array_agg(email_address)
from domains
group by domain
order by count(*) desc
;