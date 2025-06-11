with cliente as (
    select *
    from {{ source('erp', 'CUSTOMER') }}
)
, renomeado as (
    select 
        cast(customerid as string) as pk_id_cliente
        ,cast(personid as string) as fk_id_pessoa
        ,cast(storeid as string) as fk_id_loja
        ,cast(territoryid as string) as  fk_id_territorio
    from cliente
)
select * from renomeado