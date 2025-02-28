select  order_id
        , item_id
        , CONCAT(order_id,"_", item_id) AS order_item_id
        , product_id
        , quantity
        , list_price
        , discount
from {{ source('localbike', 'order_items') }}