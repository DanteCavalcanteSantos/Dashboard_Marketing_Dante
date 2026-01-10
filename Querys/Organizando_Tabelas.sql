
select * from ga

select * from gads

select * from meta

/* ajustando os ID's de cada tabela*/

/*Tabela Google Analytics*/

SELECT 
    googlea.account_id AS account_id_ga,
    'GA_' + CAST(googlea.account_id AS VARCHAR(20)) AS account_id_ga_label
FROM ga AS googlea;

select * from ga


