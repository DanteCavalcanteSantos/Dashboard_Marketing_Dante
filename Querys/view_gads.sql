/*Query para subir para o Power Bi*/
/*Tabela Google Ads*/
select * from gads

select *
from INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'gads';

create view vw_gads1 as 
select
     id,
	 date,
	 account_id as id_conta,
	 campaign_name as nome_campanha,
	 cost as custo,
	 impressions as impressoes,
	 clicks,
	 video_views,
	 watch_25,
	 watch_50,
	 watch_75,
	 watch_100,
	 source_system as dados_gads
from gads

	