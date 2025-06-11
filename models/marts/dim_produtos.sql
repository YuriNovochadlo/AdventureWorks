with dim_produtos as (
    select *
    from {{ ref('int_produtos__prep_produtos') }}
)
Select * 
from dim_produtos