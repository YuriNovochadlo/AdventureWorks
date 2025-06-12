with cartao_credito as (
    select *
    from {{ source('erp', 'CREDITCARD') }}
)
, renomeado as (
    select 
        cast(creditcardid as int) as pk_id_cartao_de_credito
        ,cast(cardtype as string) as tipo_cartao_de_credito
    from cartao_credito
)
select * from renomeado