select  staff_id
        , first_name
        , last_name
        , email
        , phone
        , case when active = 1 THEN true else false end as is_active
        , store_id
        , manager_id
from {{ source('localbike', 'staffs') }}