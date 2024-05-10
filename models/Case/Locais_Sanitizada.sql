with tabela1 as (SELECT * 
   , current_date() as Data_Atual FROM {{ref('Locais_Raw')}}
)

select  ID_Loja,
        Nome_Loja, 
        REGEXP_REPLACE(Endere__o, r'Av\.\s', 'Avenida ') AS Endereco,
        Estado,
        Cidade,
        Gerente,
        Telefone,
        Data_Abertura,
        extract(year from Data_Abertura) as ano_Abertura,
        date_diff(Data_Atual,Data_Abertura, month) as Meses_Aberta
from tabela1