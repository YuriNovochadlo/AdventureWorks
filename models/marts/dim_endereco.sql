with dim_endereco as (
    select *
    from {{ ref("int_local_prep_endereco") }}
)
Select * 
from dim_endereco