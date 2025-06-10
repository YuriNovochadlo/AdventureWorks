with produto as (
    select *
    from {{ source('erp', 'PRODUCT') }}

)
, renomeado as (
    select 
        cast(productid as int) as pk_id_produto
         ,cast(productsubcategoryid as int) as fk_id_subcategoria
        ,cast(name as string) as nome_produto
        ,cast(color as string) as cor_produto
        ,cast(size as string) as tamanho_produto
        ,cast(weight as float) as peso_produto
        ,cast(listprice as numeric(18,2)) as valor_produto
    from produto        
)
select * from renomeado