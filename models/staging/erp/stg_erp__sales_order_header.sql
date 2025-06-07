with
    fonte_PedidoVendas as (
        select *
        from {{ source('erp', 'SALESORDERHEADER') }}    
    )
    , renomeado as (
        select
        cast(salesorderid as int) as id_pedido
        ,cast(customerid as int) as id_cliente_pedido
        ,cast(territoryid as int) as id_localizacao_pedido
        ,cast(creditcardid as int) as id_cartao_de_credito
        ,cast(orderdate as date) as data_pedido
        ,cast(shipdate as date) as data_envio_pedido
        ,cast(status as int) as status_pedido
        ,cast(subtotal as numeric) as sub_total_pedido
        ,cast(taxamt as numeric) as total_taxas_pedido
        ,cast(freight as numeric) as frete
        ,cast(totaldue as numeric) as valor_total_pedido
        from fonte_PedidoVendas

    )
select * 
from renomeado