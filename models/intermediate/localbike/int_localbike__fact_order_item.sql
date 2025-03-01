select  oi.order_item_id
        , oi.order_id
        , o.customer_id
        , c.zip_code as customer_zipcode
        , o.order_status
        , o.order_date
        , o.store_id
        , s.zip_code as store_zipcode
        , o.staff_id
        , oi.product_id
        , oi.quantity
        , oi.list_price
        , oi.discount
from {{ ref('stg_localbike__order_items') }} AS oi
left join {{ ref('stg_localbike__orders') }} AS o ON o.order_id = oi.order_id
left join {{ ref("stg_localbike__customers") }} AS c ON c.customer_id = o.customer_id
left join {{ ref("stg_localbike__stores") }} AS s ON s.store_id = o.store_id