with tabela1 as (select * 
   , current_date() as Data_Atual from {{ref('Produtos_Raw')}}
)
select  ID_Produto,
        Nome_Produto,
        Descricao_Produto,
        regexp_replace(Descricao_Produto, ',.*', '') as Descricao_Primeiro_Nivel,
        regexp_replace(Descricao_Produto, '.*,', '') as Descricao_Segundo_Nivel,
        preco,
        Categoria,
        Marca,
        Peso
from tabela1