with pessoa as (
    select *
    from {{ source('erp', 'PERSON') }}
)
, renomeado as (
    select 
        cast(businessentityid as int) as pk_id_pessoa
        ,cast(firstname as string) as primeiro_nome
        ,cast(middlename as string) as nome_do_meio
        ,cast(lastname as string) as Ultimo_nome
     from pessoa
)
select * from renomeado