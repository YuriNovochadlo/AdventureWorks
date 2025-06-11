with regiao_pais as (
    select *
    from {{ source('erp', 'COUNTRYREGION') }}
)
, renomeado as (
    select
        cast(countryregioncode as string) as sigla_pais
        ,cast(name as string) as nome_pais
    from regiao_pais
)
select * from renomeado