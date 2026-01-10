/*Query para subir para o Power Bi*/
/*Tabela Google Analytics*/

select * 
from INFORMATION_SCHEMA.COLUMNS
where table_name = 'ga';

select * from ga

create view	vw_ga1 as
select
	id,
	date,
	account_id as id_conta,
	source_medium as recursos,
	campaign as campanha,
	sessions as sessoes,
	transactions as transacoes,
	transactions_revenue as transacoes_receita,
	goal1_competions,
	goal2_competions,
	goal3_competions,
	source_system
from ga;

