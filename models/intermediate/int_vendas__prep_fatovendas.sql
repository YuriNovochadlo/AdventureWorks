with itens_pedidos as (
        select *
        from {{ ref('stg_erp__ordem_itens') }}
)

, pedidos as (
        select *
        from {{ ref('stg_erp__ordem_vendas') }}
)

, enriquecer_vendas as (
    select
        itens_pedidos.PK_ID_DETALHEPEDIDO
        ,itens_pedidos.FK_ID_PEDIDO
        ,itens_pedidos.FK_ID_PRODUTO
        ,pedidos.FK_ID_CLIENTE_PEDIDO
        ,pedidos.FK_ID_LOCALIZACAO_PEDIDO
        ,pedidos.FK_ID_CARTAO_DE_CREDITO
        ,pedidos.DATA_PEDIDO
        ,pedidos.DATA_ENVIO_PEDIDO
        ,itens_pedidos.QTD_PEDIDA
        ,itens_pedidos.VALOR_UNIDADE_PEDIDA
        ,itens_pedidos.DeSCONTO_UNIDADE_PEDIDA
        ,pedidos.TOTAL_TAXAS_PEDIDO
        ,pedidos.FRETE
        ,pedidos.STATUS_PEDIDO

    from itens_pedidos

    inner join pedidos
        on pedidos.PK_ID_PEDIDO = itens_pedidos.FK_ID_PEDIDO
)
, metricas as (
    select
        PK_ID_DETALHEPEDIDO
        ,FK_ID_PEDIDO
        ,FK_ID_PRODUTO
        ,FK_ID_CLIENTE_PEDIDO
        ,FK_ID_LOCALIZACAO_PEDIDO
        ,FK_ID_CARTAO_DE_CREDITO
        ,DATA_PEDIDO
        ,DATA_ENVIO_PEDIDO
        ,QTD_PEDIDA
        ,VALOR_UNIDADE_PEDIDA
        ,DESCONTO_UNIDADE_PEDIDA
        , QTD_PEDIDA * VALOR_UNIDADE_PEDIDA as total_bruto
        , VALOR_UNIDADE_PEDIDA * (1 - DeSCONTO_UNIDADE_PEDIDA)* QTD_PEDIDA as total_liquido
        ,cast(FRETE / count(*) over(partition by FK_ID_PEDIDO) as float) as frete_rateado
        ,cast(TOTAL_TAXAS_PEDIDO /  count(*) over(partition by FK_ID_PEDIDO) as float) as taxas_rateadas
        ,Case 
            when DESCONTO_UNIDADE_PEDIDA > 0 then true
            else false
        end as teve_desconto
        ,STATUS_PEDIDO

    from enriquecer_vendas

)
select * from metricas