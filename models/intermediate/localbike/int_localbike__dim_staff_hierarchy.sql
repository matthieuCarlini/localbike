WITH RECURSIVE company_hierarchy AS (
                SELECT    staff_id
                        , first_name
                        , last_name
                        , manager_id
                        , 0 AS hierarchy_level
                FROM  {{ ref("stg_localbike__staffs") }} 
                WHERE manager_id IS NULL
            UNION ALL
                SELECT    e.staff_id
                         , e.first_name
                         , e.last_name
                         , e.manager_id
                         , ch.hierarchy_level + 1 AS hierarchy_level
                FROM  {{ ref("stg_localbike__staffs") }} e CROSS JOIN company_hierarchy ch
                WHERE e.manager_id = ch.staff_id
    )
SELECT  ch.staff_id AS staff_id
        , ch.first_name AS employee_first_name
       , ch.last_name AS employee_last_name
       , e.first_name AS boss_first_name
       , e.last_name AS boss_last_name
       , ch.hierarchy_level
FROM company_hierarchy ch
LEFT JOIN  {{ ref("stg_localbike__staffs") }} e
ON ch.manager_id = e.staff_id
ORDER BY ch.hierarchy_level, ch.manager_id