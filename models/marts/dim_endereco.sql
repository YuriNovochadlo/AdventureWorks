with dim_endereco as (
    select *
    from {{ ref("int_local__prep_endereco") }}
)
Select * 
from dim_endereco