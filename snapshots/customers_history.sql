{% snapshot customers_history%}

{{
    config(
        target_schema='DBT_JMUGNOLO_DEV',
        unique_key='CUSTOMERID',
        strategy='timestamp',
        updated_at='updated_at',
    )
}}

SELECT * FROM {{source('staging','customers')}}

{% endsnapshot %}