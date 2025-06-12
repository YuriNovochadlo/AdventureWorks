with cartao as (
    select *
    from {{ ref('stg_erp__cartao_credito') }}
)
select * from cartao