/*
    Esse teste busca garantir que as vendas em 2011 estão corretas e de acordo com o 
    valor passado pelo CEO Carlos Silveira. Em 2011 as vendas brutas foram de  $12.646.112,16
*/

with vendas_em_2011 as (
        select round(sum(total_bruto), 2) as total_bruto_2011
        from {{ref ('int_vendas__prep_fatovendas')}}
        where DATA_PEDIDO between '2011-01-01' and '2011-12-31'
    )

select * from vendas_em_2011
where total_bruto_2011 not between 12646111.16 and 12646113.16