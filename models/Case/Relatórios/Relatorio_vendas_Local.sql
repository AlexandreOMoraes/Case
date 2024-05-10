with tabela1 as (SELECT Nome_Loja, Estado, Cidade, SUM(Quantidade_Vendida) as Total_Vendido, sum(Total_Venda) as Total_Venda
FROM {{ref('Relatorio_Geral')}}
group by Nome_Loja, Estado, Cidade)

select Nome_Loja,Estado,Cidade, Total_Venda, round(((Total_Venda/sum(Total_Venda) over())*100),2) as Representatividade 
from tabela1
group by Nome_Loja,Estado,Cidade,Total_Venda
order by Representatividade desc