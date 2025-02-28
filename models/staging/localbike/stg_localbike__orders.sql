select order_id
  , customer_id
  , order_status
  , order_date
  , required_date
  , shipped_date
  , store_id
  , CAST (staff_id AS string) AS staff_id
from {{ source('localbike', 'orders') }}