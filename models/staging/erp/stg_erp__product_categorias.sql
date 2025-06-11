with categoria_produto as (
    select *
    from {{ source('erp', 'PRODUCTCATEGORY') }}
)
, renomeado as (
    select
        cast(productcategoryid as int) as pk_id_categoria
        ,cast(name as string) as nome_categoria
    from categoria_produto
)

select * from renomeado