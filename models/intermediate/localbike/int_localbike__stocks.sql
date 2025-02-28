SELECT stocks.stock_id,
    stocks.store_id, 
    stocks.product_id, 
    stocks.stock_quantity
FROM {{ ref('stg_localbike__stocks') }} AS stocks