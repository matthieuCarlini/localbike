select  fact.order_item_id
        , fact.order_id
        , fact.order_status
        , fact.order_date
        , customer.first_name
        , customer.last_name
        , customergeo.zip_code as customer_zipcode
        , customergeo.state as customer_state
        , customergeo.city as customer_city
        , store.store_name
        , storegeo.zip_code as store_zipcode
        , storegeo.state as store_state
        , storegeo.city as store_city
        , bike.product_name
        , bike.category_name
        , bike.brand_name
        , staff.employee_first_name
        , staff.employee_last_name
        , fact.quantity
        , fact.list_price
        , fact.discount
        , fact.quantity * (fact.list_price * (1 - fact.discount)) as orderitem_amount
from {{ ref("int_localbike__fact_order_item") }} as fact
left join {{ ref("int_localbike__dim_customer") }} as customer on customer.customer_id = fact.customer_id
left join {{ ref("int_localbike__dim_geo") }} as customergeo on customergeo.zip_code = fact.customer_zipcode
left join {{ ref("int_localbike__dim_store") }} as store on store.store_id = fact.store_id
left join {{ ref("int_localbike__dim_geo") }} as storegeo on storegeo.zip_code = fact.store_zipcode
left join {{ ref("int_localbike__dim_bikes") }} as bike on bike.product_id = fact.product_id
left join {{ ref("int_localbike__dim_staff_hierarchy") }} as staff on staff.staff_id = fact.staff_id
order by fact.order_item_id