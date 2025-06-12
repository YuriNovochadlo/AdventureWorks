with dim_cartao_credito as (
    select *
    from {{ ref("int_cartao__prep_cartaocredito") }}
)
Select * 
from dim_cartao_credito