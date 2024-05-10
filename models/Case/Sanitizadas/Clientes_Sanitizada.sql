with tabela1 as (
    select *, current_date() as Data_Atual from {{ref('Clientes_Raw')}}
)
select  ID_Cliente,
        Nome_Cliente,
        regexp_extract(Nome_Cliente, r'^\S+') as Primeiro_Nome,
        regexp_replace(Nome_Cliente, r'^\S+\s*', '') as Sobrenome, 
        Email,
        Telefone,
        Case 
        when Sexo = 'male' then 'Masculino'
        else 'Feminino' 
        end Sexo,
        Data_Nascimento,
        extract(year from Data_Nascimento) as Ano_Nascimento,
        date_diff(Data_Atual,Data_Nascimento, year) as Idade
from tabela1