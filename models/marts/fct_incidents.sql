with incidents as (
SELECT ticket_number,
       reassignment_count,
       reopen_count,
       modification_count,
       made_sla,
       is_active,
       opened_at,
       resolved_at,
       closed_at,
       (resolved_at - opened_at) as resolution_time
FROM {{ref('int_incident_event_final_state')}}
)
SELECT * from incidents
