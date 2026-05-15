with source as (

    select * from {{ source('itsm', 'incident_event_log') }}

),

renamed as (

    select
        number                              as ticket_number,
        caller_id                           as caller,
        opened_by                           as opened_by,
        assigned_to                         as assigned_to,
        resolved_by                         as resolved_by,
        category,
        subcategory,
        contact_type,
        location,
        cmdb_ci                             as configuration_item,
        assignment_group,
        incident_state,
        active::boolean                     as is_active,
        made_sla::boolean                   as made_sla,
        knowledge::boolean                  as has_knowledge_article,
        split_part(impact,' - ',1)::integer as impact,
        split_part(urgency,' - ',1)::integer as urgency,
        split_part(priority,' - ',1)::integer as priority,
        reassignment_count::integer         as reassignment_count,
        reopen_count::integer               as reopen_count,
        sys_mod_count::integer              as modification_count,
        strptime(opened_at, '%d/%m/%Y %H:%M') as opened_at,
        strptime(sys_created_at, '%d/%m/%Y %H:%M')            as created_at,
        strptime(sys_updated_at, '%d/%m/%Y %H:%M')          as updated_at,
        strptime(resolved_at, '%d/%m/%Y %H:%M')              as resolved_at,
        strptime(closed_at, '%d/%m/%Y %H:%M')               as closed_at,
        closed_code,
        problem_id,
        rfc,
        vendor,
        caused_by,
        u_symptom                           as symptom

    from source

)

select * from renamed