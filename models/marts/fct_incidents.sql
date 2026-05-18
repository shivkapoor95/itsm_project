{{ config(
    materialized='incremental',
    unique_key='ticket_number'
) }}

with incidents as (
    select
        ticket_number,
        reassignment_count,
        reopen_count,
        modification_count,
        made_sla,
        is_active,
        opened_at,
        resolved_at,
        closed_at,
        (resolved_at - opened_at) as resolution_time
    from {{ ref('int_incident_event_final_state') }}

    {% if is_incremental() %}
        where opened_at > (select max(opened_at) from {{ this }})
    {% endif %}
)

select * from incidents