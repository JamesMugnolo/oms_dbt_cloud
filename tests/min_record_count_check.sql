{% set expected_counts = {
    'customers': 50,
    'Employees': 20,
    'Stores': 10,
    'Suppliers': 5,
    'Products': 100,
    'OrderItems': 1000,
    'Orders': 200
}%}

{% for table, expected_count in expected_counts.items() %}
    SELECT 
        '{{table}}' AS table_name,
        (SELECT COUNT(*) FROM {{source('landing',table)}}) AS record_count,
        {{expected_count}}
    WHERE
        (SELECT COUNT(*) FROM {{source('landing',table)}}) AS record_count < {{expected_count}}
    {% if not loop.last %} UNION ALL {% endif %}
{% endfor %}