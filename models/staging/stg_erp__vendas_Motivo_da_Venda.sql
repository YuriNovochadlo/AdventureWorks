with motivo_vendas as (
    select * 
    from {{ source('erp', 'SALESORDERHEADERSALESREASON') }}
)
, renomeado as (
    select
        cast(salesorderid as int) as fk_id_pedido
        ,cast(salesreasonid as int) as fk_id_motivo_venda
        ,cast(modifieddate as date) as data
    from motivo_vendas
)
select * from renomeado