with tabela1 as (SELECT * 
   , current_date() as Data_Atual FROM {{ref('Produtos')}}
)

select  ID_Produto,
        Nome_Produto,
        Descricao_Produto,
        REGEXP_REPLACE(Descricao_Produto, ',.*', '') AS Descricao_Primeiro_Nivel,
        REGEXP_REPLACE(Descricao_Produto, '.*,', '') AS Descricao_Segundo_Nivel,
        preco,
        Categoria,
        Marca,
        Peso
from tabela1