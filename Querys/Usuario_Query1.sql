/*Seleciando o banco atual*/

SELECT DB_NAME() AS banco_atual;

/*Conecta ao banco*/
USE WideWorldImporters;
GO

/*Tabelas trabalhadas na Querys*/

select * from Application.Countries

select * from Application.Cities

select * from Application.People

select * from Application.People_Archive

select * from Application.StateProvinces



/*Correção Copilot*/
SELECT 
  pa.FullName AS nome_completo,
  COUNT(*) AS total_registros,
  SUM(CASE WHEN p.isSystemUser = 1 THEN 1 ELSE 0 END) AS total_usuarios_sistema,
  SUM(CASE WHEN p.isEmployee = 1 THEN 1 ELSE 0 END) AS total_funcionarios,
  SUM(CASE WHEN p.isSalesPerson = 1 THEN 1 ELSE 0 END) AS total_vendedores
FROM Application.People AS p
LEFT JOIN Application.People_Archive AS pa ON p.PersonID = pa.PersonID
GROUP BY pa.FullName;



/*Colunas sobre pessoas separadas*/
select p.ValidFrom AS Data_Registro,
	'PER' + Cast(p.PersonID AS VARCHAR) ID_Pessoa,
	pa.FullName AS nome_completo,
	p.PhoneNumber as Numero_Telefone,
	CASE
		WHEN p.isSystemUser = 1 THEN 'Usuário de Sistema'
		WHEN p.isEmployee = 1 THEN 'Funcionário'
		WHEN p.isSalesPerson = 1 THEN 'Vendedor'
		ELSE 'Outro'
	END AS Tipo_Usuario
from Application.People p
	left join Application.People_Archive pa on p.PersonID = pa.PersonID




/*Verificar quais colunas tem na tabela e os Schemas*/
SELECT 
  COLUMN_NAME,
  DATA_TYPE,
  CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'People'
  AND TABLE_SCHEMA = 'Application';

/*Ver valores unicos dos telefones para vincular os paises*/
SELECT DISTINCT PhoneNumber
FROM Application.People_Archive
WHERE PhoneNumber IS NOT NULL;


SELECT DISTINCT FaxNumber
FROM Application.People_Archive
WHERE PhoneNumber IS NOT NULL;