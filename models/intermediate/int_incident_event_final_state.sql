{{ config(materialized='table') }}
with source as (

    select * from {{ ref('stg_incident_event_log') }}

),

ranked as (

    select ticket_number,
incident_state,
is_active,
made_sla,
category,
subcategory,
contact_type,
location,
configuration_item,
assignment_group,
assigned_to,
caller,
opened_by,
resolved_by,
impact,
urgency,
priority,
reassignment_count,
reopen_count,
modification_count,
opened_at,
created_at,
updated_at,
resolved_at,
closed_at,
closed_code,
symptom,
ROW_NUMBER() OVER (
            PARTITION BY ticket_number 
            ORDER BY updated_at DESC
        ) as row_num
    from source

),

final as (

    select ticket_number,
incident_state,
is_active,
made_sla,
category,
subcategory,
contact_type,
location,
configuration_item,
assignment_group,
assigned_to,
caller,
opened_by,
resolved_by,
impact,
urgency,
priority,
reassignment_count,
reopen_count,
modification_count,
opened_at,
created_at,
updated_at,
resolved_at,
closed_at,
closed_code,
symptom from ranked
    where row_num = 1

)

select * from final



