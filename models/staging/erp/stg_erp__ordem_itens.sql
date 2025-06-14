with detalhe_pedido as (
    select *
    from {{ source('erp', 'SALESORDERDETAIL') }}
)
, renomeado as (
    select
         cast(salesorderdetailid as int) as pk_id_detalhepedido
        ,cast(salesorderid as int) as fk_id_pedido
        ,cast(productid as int) as fk_id_produto
        ,cast(orderqty as float) as qtd_pedida
        ,cast(unitprice as float) as valor_unidade_pedida
        ,cast(unitpricediscount as float) as desconto_unidade_pedida
        ,cast(modifieddate as date) as ultima_modificacao_pedido
    from detalhe_pedido
)
select * from renomeado