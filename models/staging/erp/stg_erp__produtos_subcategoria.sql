with subcategoria_produto as (
    select *
    from {{ source('erp', 'PRODUCTSUBCATEGORY') }}
)
, renomeado as(
    Select
        cast(productsubcategoryid as int) as pk_id_subcategoria
         ,cast(productcategoryid as int) as fk_id_categoria
         ,cast(name as string) as nome_subcategoria

    from subcategoria_produto
)

select * from renomeado