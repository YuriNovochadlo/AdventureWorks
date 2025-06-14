
with fato_vendas as (
    select *
    from {{ ref("int_vendas__prep_fatovendas") }}
)
Select * 
from fato_vendas