{{
    config(
        materialized = 'table',
    )
}}
WITH RECURSIVE date_spine AS (
    SELECT DATE '2000-01-01' AS date_day
    UNION ALL
    SELECT date_day + INTERVAL '1' DAY
    FROM date_spine
    WHERE date_day < DATE '2027-01-01'
),
final AS (
    SELECT date_day
    FROM date_spine
)
SELECT * FROM final