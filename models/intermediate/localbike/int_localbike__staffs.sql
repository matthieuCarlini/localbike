WITH manager as (
                SELECT  staff_id
                        , first_name as manager_first_name
                        , last_name as manager_last_name
                FROM {{ ref("stg_localbike__staffs") }}
                )
SELECT  sta.staff_id
        , sta.first_name
        , sta.last_name
        , sto.store_id
        , sto.store_name
        , sto.city
        , sto.state
        , m.manager_first_name
        , m.manager_last_name
FROM {{ ref("stg_localbike__staffs") }} sta
left join manager m on m.staff_id = sta.manager_id 
left join {{ ref("stg_localbike__stores") }} sto on sto.store_id=sta.store_id