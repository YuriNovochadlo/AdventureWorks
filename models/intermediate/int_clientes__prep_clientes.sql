with clientes as (
    select *
    from {{ ref('stg_erp__clientes') }}
)

, pessoas as (
    select *
    from {{ ref('stg_erp__pessoas') }}
)

, enriquecer_clientes as (
    select
        clientes.PK_ID_CLIENTE
        ,clientes.FK_ID_LOJA
        ,clientes.FK_ID_TERRITORIO
        ,TRIM(
        COALESCE(pessoas.PRIMEIRO_NOME, '') ||
        CASE WHEN pessoas.NOME_DO_MEIO IS NOT NULL THEN ' ' || pessoas.NOME_DO_MEIO ELSE '' END ||
        CASE WHEN pessoas.ULTIMO_NOME IS NOT NULL THEN ' ' || pessoas.ULTIMO_NOME ELSE '' END
    ) AS nome_completo


    from clientes
    left join pessoas
        on pessoas.pk_id_pessoa = clientes.fk_id_pessoa
    

)

select * from enriquecer_clientes