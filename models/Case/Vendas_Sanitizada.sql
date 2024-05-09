with tabela1 as (SELECT * 
   , current_date() as Data_Atual FROM {{ref('Vendas_Raw')}}
)

select  ID_Venda,
        ID_Produto,
        ID_Local,
        ID_Cliente,
        Quantidade as Quantidade_Vendida,
        Data_Venda,
        Metodo_Pagamento,
        Total_Venda,
        Data_Atual,
        EXTRACT(YEAR FROM Data_Venda) AS Ano_Venda,
        EXTRACT(Month FROM Data_Venda) AS Mes_Venda,
        EXTRACT(Day FROM Data_Venda) AS Dia_Venda
from tabela1