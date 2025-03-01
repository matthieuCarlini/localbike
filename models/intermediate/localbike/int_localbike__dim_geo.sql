WITH union_zip_code AS (
                        select  zip_code
                                , state
                                , city
                        from {{ ref("stg_localbike__customers") }}
                        UNION DISTINCT
                        select  zip_code
                                , state
                                , city
                        from {{ ref("stg_localbike__stores") }}
                        )
select  zip_code
        , state
        , city
from union_zip_code
where (CAST(zip_code as string) || city != '11432Baldwin')
order by zip_code
        , state
        , city