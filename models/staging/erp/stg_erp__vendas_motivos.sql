with motivo_vendas as(
    select *
    from {{ source('erp', 'SALESREASON') }}
)
, renomeado as (
    select
        cast(salesreasonid as int) as pk_id_motivo_venda
        ,cast(name as string) as descricao_motivo_venda
        ,cast(reasontype as string) as tipo_motivo_venda
    from motivo_vendas
)
select * from renomeado