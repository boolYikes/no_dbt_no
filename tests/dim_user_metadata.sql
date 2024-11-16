-- unique pk test
SELECT
    *
FROM (
    select
        user_id, count(*) cnt
    FROM
        {{ ref("dim_user_metadata") }}
    group by 1
    order by 2 desc
    limit 1
)
where cnt > 1