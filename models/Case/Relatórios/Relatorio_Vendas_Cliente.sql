with tabela1 as (SELECT Sexo, SUM(Quantidade_Vendida) as Total_Vendido, sum(Total_Venda) as Total_Venda
FROM {{ref('Relatorio_Geral')}}
group by Sexo)

select Sexo, Total_Vendido, round(((Total_Venda/sum(Total_Venda) over())*100),2) as Representatividade 
from tabela1
group by Sexo, Total_Vendido,Total_Venda
order by Representatividade desc