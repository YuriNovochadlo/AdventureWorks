with estado as (
    select *
    from {{ source('erp', 'STATEPROVINCE') }}
)
,renomeado as(
    select
        cast(stateprovinceid as int) as pk_id_estado
        ,cast(territoryid as int) as fk_id_territorio
        ,cast(name as string) as nome_estado
        ,cast(stateprovincecode as string) as sigla_estado
    from estado
)
select * from renomeado