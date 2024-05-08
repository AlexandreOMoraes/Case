with tabela1 as (SELECT * 
   , current_date() as Data_Atual FROM {{ref('Vendas')}}
)

select  ID_Venda,
        ID_Produto,
        ID_Local,
        ID_Cliente,
        Quantidade as Quantidade_Vendida,
        Data_Venda,
        Metodo_Pagamento,
        Total_Venda,
        Data_Atual
from tabela1