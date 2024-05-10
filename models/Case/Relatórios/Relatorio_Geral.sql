SELECT  ID_Venda,Quantidade_Vendida,
        Data_Venda,
        Ano_Venda,
        Mes_Venda,
        Dia_Venda,
        Dia_Semana_Venda,
        Metodo_Pagamento,
        Total_Venda,
        Nome_Produto,
        Descricao_Produto,
        Categoria,
        Marca,
        Sexo,
        Idade,
        Nome_Loja,
        Estado,
        Cidade
        from {{ref('Vendas_Sanitizada')}} as vendas
        left join {{ref('Produtos_Sanitizada')}} as produtos on vendas.ID_Produto = produtos.ID_Produto
        left join {{ref('Clientes_Sanitizada')}} as clientes on vendas.ID_Cliente = clientes.ID_Cliente
        left join {{ref('Locais_Sanitizada')}} as locais on vendas.ID_Local = locais.ID_Loja
        order by ID_Venda