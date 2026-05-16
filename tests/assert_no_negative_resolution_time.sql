SELECT *
FROM {{ref('fct_incidents')}}
WHERE opened_at > resolved_at