with tabela1 as (
    SELECT *, current_date() as Data_Atual FROM {{ref('Clientes_Raw')}}
)

select  ID_Cliente,
        Nome_Cliente,
        REGEXP_EXTRACT(Nome_Cliente, r'^\S+') AS Primeiro_Nome,
        Email,
        Telefone,
        Sexo,
        Data_Nascimento,
        date_diff(Data_Atual,Data_Nascimento, year) as Idade,        REGEXP_REPLACE(Nome_Cliente, r'^\S+\s*', '') AS Sobrenome
from tabela1