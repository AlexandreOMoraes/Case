with tabela1 as (select * 
   , current_date() as Data_Atual from {{ref('Vendas_Raw')}}
)

select  ID_Venda,
        ID_Produto,
        ID_Local,
        ID_Cliente,
        Quantidade as Quantidade_Vendida,
        Data_Venda,
        Metodo_Pagamento,
        Total_Venda,
        extract(YEAR from Data_Venda) as Ano_Venda,
        extract(Month from Data_Venda) as Mes_Venda,
        extract(Day from Data_Venda) as Dia_Venda,
        case extract(DAYOFWEEK from Data_Venda)
        when 1 then 'Domingo'
        when 2 then 'Segunda-feira'
        when 3 then 'Terça-feira'
        when 4 then 'Quarta-feira'
        when 5 then 'Quinta-feira'
        when 6 then 'Sexta-feira'
        else 'Sábado'
    end as Dia_Semana_Venda
from tabela1