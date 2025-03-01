select  first_name
        , last_name
        , customer_zipcode
        , customer_state
        , customer_city
        , MIN(order_date) AS first_order_date
        , MAX(order_date) AS last_order_date
        , COUNT(order_id) as total_orders
        , SUM(orderitem_amount) as total_amount
        , case when DATE_DIFF(DATE(MAX(order_date)), DATE(MIN(order_date)), DAY) = 0 then 'one time' else 'regular' end as customer_type
from {{ ref('mrt_flat_orderitem' )}} 
group by first_name
        , last_name
        , customer_zipcode
        , customer_state
        , customer_city