
with dim_clientes as (
    select *
    from {{ ref("int_clientes__prep_clientes") }}
)
Select * 
from dim_clientes