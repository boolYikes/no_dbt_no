{% snapshot scd_user_metadata %}

{{
    config(
        target_schema='tunacome',
        unique_key='user_id',
        strategy='timestamp',
        updated_at='updated_at',
        invalidate_hard_delete=True
    )
}}

select * from {{ source('tunacome', 'user_metadata') }}

{% endsnapshot %}