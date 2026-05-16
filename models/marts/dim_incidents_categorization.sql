with cte1 as (
SELECT ticket_number,
category,
subcategory,
contact_type,
location,
symptom,
priority,
impact,
urgency
FROM {{ref('int_incident_event_final_state')}}
)
SELECT * from cte1
