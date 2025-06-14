with
    calendario as (
        {{ dbt_date.get_date_dimension("2011-01-01", "2014-12-31")}}
    )
        , int_calendar as (
        select
            {{ dbt_utils.generate_surrogate_key(['date_day', 'week_of_year']) }} as sk_calendario
            , *
        from calendario)

    , dcalendario as (
        SELECT 
            SK_CALENDARIO
            ,DATE_DAY as DATA
            ,DAY_OF_MONTH as DIA
            ,WEEK_OF_YEAR as SEMANA
            ,MONTH_OF_YEAR as Numero_Mes
            ,MONTH_NAME as Nome_mes
            ,MONTH_NAME_SHORT as Mes_abrev
            ,QUARTER_OF_YEAR as Trimeste
            ,YEAR_NUMBER as ano
        from int_calendar



    )


select *
from dcalendario

