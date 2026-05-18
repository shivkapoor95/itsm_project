{% snapshot snp_incident_assignments %}

{{
    config(
        target_schema='snapshots',
        unique_key='ticket_number',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select
    ticket_number,
    assignment_group,
    assigned_to,
    incident_state,
    priority,
    updated_at
from {{ ref('stg_incident_event_log') }}

{% endsnapshot %}