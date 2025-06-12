
with dim_motivo as (
    select *
    from {{ ref("int_vendas__prep_motivo") }}
)
Select * 
from dim_motivo