{% macro clean_severity_field(column_name) %}
    CAST(split_part({{ column_name }}, ' - ', 1) AS INTEGER)
{% endmacro %}