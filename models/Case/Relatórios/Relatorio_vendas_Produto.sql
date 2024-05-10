with tabela1 as (SELECT Nome_Produto,SUM(Quantidade_Vendida) as Total_Vendido, sum(Total_Venda) as Total_Venda, 
FROM {{ref('Relatorio_Geral')}}
group by Nome_Produto)

select Nome_Produto, Total_Vendido,Total_Venda, round(((Total_Venda/sum(Total_Venda) over())*100),2) as Representatividade from tabela1
group by Nome_Produto,Total_Vendido,Total_Venda
order by Representatividade desc