select  customer_id
        , first_name
        , last_name
        , phone
        , email
from {{ ref("stg_localbike__customers") }}