/*Query para subir para o Power Bi*/
/*Tabela Meta*/


select * from meta

select *
from INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'meta';


create view vw_meta as
select
	id,
	date,
	account_id as id_conta,
	campaign_name as nome_campanha,
	cost as custo,
	impressions as impressoes,
	link_clicks,
	video_views,
	watch_25,
	watch_50,
	watch_75,
	watch_100,
	source_system as dados_meta
from meta
