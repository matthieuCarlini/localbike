select  store_id
        , store_name
        , phone
        , email
from {{ ref('stg_localbike__stores') }}