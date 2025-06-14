with
    dim_calendario as (
        select *
        from {{ ref('int_calendario') }}
    )

select *
from dim_calendario