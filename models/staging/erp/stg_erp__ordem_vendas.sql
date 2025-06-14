with
    fonte_PedidoVendas as (
        select *
        from {{ source('erp', 'SALESORDERHEADER') }}    
    )
    , renomeado as (
        select
        cast(salesorderid as int) as pk_id_pedido
        ,cast(customerid as int) as fk_id_cliente_pedido
        ,cast(territoryid as int) as fk_id_localizacao_pedido
        ,cast(creditcardid as int) as fk_id_cartao_de_credito
        ,cast(orderdate as date) as data_pedido
        ,cast(shipdate as date) as data_envio_pedido
        ,cast(status as int) as status_pedido
        ,cast(taxamt as float) as total_taxas_pedido
        ,cast(freight as float) as frete
        from fonte_PedidoVendas

    )
select * from renomeado 