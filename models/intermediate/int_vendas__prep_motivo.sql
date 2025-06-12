with motivos as (
    select *
    from {{ ref('stg_erp__vendas_motivos') }}
)

, motivo_vendas as (
    select *
    from {{ ref('stg_erp__vendas_Motivo_da_Venda') }}
)

, enriquecer_motivo as (
    select
        motivo_vendas.FK_ID_PEDIDO
        ,motivos.DESCRICAO_MOTIVO_VENDA
        ,motivos.TIPO_MOTIVO_VENDA

    from motivo_vendas

    left join motivos
        on motivo_vendas.FK_ID_MOTIVO_VENDA = motivos.pK_ID_MOTIVO_VENDA
)

select * from enriquecer_motivo