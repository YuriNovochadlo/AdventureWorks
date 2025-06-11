with endereco as (
    select *
    from {{ ref('stg_erp__local_endereco') }}
)

, estado as (
    select *
    from {{ ref('stg_erp__local_estado') }}
)

, pais as (
    select *
    from {{ ref('stg_erp__local_pais') }}
)

, enriquecer_endereco as (
    Select
    endereco.PK_ID_ENDERECO
    ,estado.FK_ID_TERRITORIO
    ,endereco.ENDERECO
    ,endereco.CIDADE
    ,endereco.CODIGO_PORTAL
    ,estado.NOME_ESTADO
    ,estado.SIGLA_ESTADO
    ,pais.NOME_PAIS
    ,pais.SIGLA_PAIS

    from endereco

    left join estado
        on estado.PK_ID_ESTADO = endereco.FK_ID_ESTADO

    left join pais
        on estado.SIGLA_PAIS = pais.SIGLA_PAIS
)

select * from enriquecer_endereco
