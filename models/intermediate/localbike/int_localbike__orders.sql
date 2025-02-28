select  oi.order_id
        , oi.order_item_id
        , o.customer_id
        , o.order_status
        , o.order_date
        , o.store_id
        , o.staff_id
        , oi.product_id
        , oi.quantity
        , oi.list_price
        , oi.discount
        , s.store_name
        , s.city
        , s.state
from {{ ref('stg_localbike__order_items') }} AS oi
left join {{ ref('stg_localbike__orders') }} AS o ON o.order_id = oi.order_id
left join {{ ref("stg_localbike__stores") }} AS s ON o.store_id = s.store_id