with endereco as (
    select *
    from {{ source('erp', 'ADDRESS') }}
)
, renomeado as (
    select
        cast(addressid as int) as pk_id_endereco
        ,cast(stateprovinceid as int) as fk_id_estado
        ,cast(addressline1 as string) as endereco
        ,cast(city as string) as cidade
        ,cast(postalcode as string) as Codigo_portal
    from endereco
)
select * from renomeado