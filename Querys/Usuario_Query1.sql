/*Seleciando o banco atual*/

SELECT DB_NAME() AS banco_atual;

/*Conecta ao banco*/
USE WideWorldImporters;
GO


/*Colunas sobre pessoas separadas*/
select p.ValidFrom AS Data_Registro,
	'PER' + Cast(p.PersonID AS VARCHAR) ID_Pessoa,
	pa.FullName AS nome_completo,
	CASE
		WHEN p.isSystemUser = 1 THEN 'Usuário de Sistema'
		WHEN p.isEmployee = 1 THEN 'Funcionário'
		WHEN p.isSalesPerson = 1 THEN 'Vendedor'
		ELSE 'Outro'
	END AS Tipo_Usuario
from Application.People p
	left join Application.People_Archive pa on p.PersonID = pa.PersonID;


select * from Application.Countries

select * from Application.Cities

select * from Application.People

select * from Application.People_Archive