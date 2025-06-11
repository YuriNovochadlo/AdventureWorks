with produtos as (
    select *
    from {{ ref('stg_erp__produtos') }}
)

, subcategorias as (
    select *
    from {{ ref('stg_erp__produtos_subcategoria') }}
)

, categorias as (
    select *
    from {{ ref('stg_erp__product_categorias') }}
)
, enriquecer_produtos as (
    select
        produtos.PK_ID_PRODUTO
        ,produtos.NOME_PRODUTO
        ,produtos.COR_PRODUTO
        ,produtos.TAMANHO_PRODUTO
        ,produtos.PESO_PRODUTO
        ,produtos.VALOR_PRODUTO
        ,subcategorias.nome_subcategoria
        ,categorias.nome_categoria

    from produtos
    left join subcategorias
        on subcategorias.pk_id_subcategoria = produtos.fk_id_subcategoria
    
    left join categorias
        on categorias.pk_id_categoria = subcategorias.fk_id_categoria
)

select * from enriquecer_produtos