
/*Criando as tabelas com dados de Marketing Digital'*/

/*create table ga(
	date DATE,
	account_id INT,
	source_medium VARCHAR(100),
	campaign VARCHAR(100),
	sessions INT,
	transactions INT,
	transactions_revenue DECIMAL(10,2),
	goal1_competions INT,
	goal2_competions INT,
	goal3_competions INT
);*/


DROP TABLE ga;
GO

CREATE TABLE ga(
    id INT IDENTITY(1,1) PRIMARY KEY,
    date DATE,
    account_id INT,
    source_medium VARCHAR(100),
    campaign VARCHAR(100),
    sessions INT,
    transactions INT,
    transactions_revenue DECIMAL(10,2),
    goal1_competions INT,
    goal2_competions INT,
    goal3_competions INT
)

DROP TABLE gads;
GO

CREATE TABLE gads (
    id INT IDENTITY(1,1) PRIMARY KEY,
    date DATE,
    account_id INT,
    campaign_name VARCHAR(100),
    cost DECIMAL(10,2),
    impressions INT,
    clicks INT,
    video_views INT,
    watch_25 INT,
    watch_50 INT,
    watch_75 INT,
    watch_100 INT
);

DROP TABLE meta;
GO

CREATE TABLE meta (
    id INT IDENTITY(1,1) PRIMARY KEY,
    date DATE,
    account_id INT,
    campaign_name VARCHAR(100),
    cost DECIMAL(10,2),
    impressions INT,
    link_clicks INT,
    video_views INT,
    watch_25 INT,
    watch_50 INT,
    watch_75 INT,
    watch_100 INT
);


select * from ga

select * from gads

select * from meta

/*Inserindo dados nas tabelas*/

/*inserindo dados no Google Analytics*/

INSERT INTO ga (
    date,
    account_id,
    source_medium,
    campaign,
    sessions,
    transactions,
    transactions_revenue,
    goal1_competions,
    goal2_competions,
    goal3_competions
)
SELECT
    DATEADD(DAY, n, '2024-01-01') AS date,
    (ABS(CHECKSUM(NEWID())) % 3) + 1 AS account_id,
    CASE 
        WHEN n % 3 = 0 THEN 'google / cpc'
        WHEN n % 3 = 1 THEN 'facebook / paid'
        ELSE 'organic / search'
    END AS source_medium,
    CASE 
          WHEN source_medium IN (
        'always_on',
        'facebook aon | conversoes',
        'instagram aon | conversoes',
        'aon | google ads | conversoes',
        'aon | youtube | conversoes'
    ) THEN 'Always On'

    WHEN source_medium IN (
        'search conversoes',
        'search conversoes | Brand'
    ) THEN 'Search'

    WHEN source_medium IN (
        'Video | awareness'
    ) THEN 'Awareness'

    WHEN source_medium IN (
        'influencer',
        'sendmail / email',
        'push'
    ) THEN 'Performance'

    ELSE 'Outros'
END AS campaign,
    sessions,
    transactions,
    transactions * (80 + ABS(CHECKSUM(NEWID())) % 150) AS transactions_revenue,
    transactions / 2 AS goal1_competions,
    transactions / 3 AS goal2_competions,
    transactions / 4 AS goal3_competions
FROM (
    SELECT 
        number AS n,
        (200 + ABS(CHECKSUM(NEWID())) % 1200) AS sessions,
        (ABS(CHECKSUM(NEWID())) % 40) + 1 AS transactions
    FROM master..spt_values
    WHERE type = 'P' AND number < 90
) t;




/*Planilha ga ajustada - inserir na hora do power bi para identificar as tabelas*/
SELECT 
    googlea.account_id AS account_id_ga,
    'GA_' + CAST(googlea.account_id AS VARCHAR(20)) AS account_id_ga_label
FROM ga AS googlea;

UPDATE ga
SET account_id = (ABS(CHECKSUM(NEWID())) % 3) + 1
FROM ga;


select * from ga

/* inserindo dados na tabela gads*/

INSERT INTO gads
SELECT
    DATEADD(DAY, n, '2024-01-01') AS date,
    (ABS(CHECKSUM(NEWID())) % 3) + 1 AS account_id,
    CASE 
        WHEN n % 2 = 0 THEN 'Search Campaign'
        ELSE 'Video Campaign'
    END AS campaign_name,
    cost,
    impressions,
    clicks,
    video_views,
    CAST(video_views * 0.75 AS INT) AS watch_25,
    CAST(video_views * 0.50 AS INT) AS watch_50,
    CAST(video_views * 0.30 AS INT) AS watch_75,
    CAST(video_views * 0.10 AS INT) AS watch_100
FROM (
    SELECT
        number AS n,
        (8000 + ABS(CHECKSUM(NEWID())) % 30000) AS impressions,
        (100 + ABS(CHECKSUM(NEWID())) % 1200) AS clicks,
        (300 + ABS(CHECKSUM(NEWID())) % 5000) AS video_views,
        (80 + ABS(CHECKSUM(NEWID())) % 600) AS cost
    FROM master..spt_values
    WHERE type = 'P'
      AND number < 90
) t;

select * from gads


/*inserindo valores na tabela da meta*/
INSERT INTO meta
SELECT
    DATEADD(DAY, n, '2024-01-01') AS date,
    (ABS(CHECKSUM(NEWID())) % 3) + 1 AS account_id,
    CASE 
        WHEN n % 2 = 0 THEN 'Awareness Campaign'
        ELSE 'Traffic Campaign'
    END AS campaign_name,
    cost,
    impressions,
    link_clicks,
    video_views,
    CAST(video_views * 0.70 AS INT) AS watch_25,
    CAST(video_views * 0.45 AS INT) AS watch_50,
    CAST(video_views * 0.25 AS INT) AS watch_75,
    CAST(video_views * 0.08 AS INT) AS watch_100
FROM (
    SELECT
        number AS n,
        (7000 + ABS(CHECKSUM(NEWID())) % 25000) AS impressions,
        (120 + ABS(CHECKSUM(NEWID())) % 1000) AS link_clicks,
        (400 + ABS(CHECKSUM(NEWID())) % 6000) AS video_views,
        (70 + ABS(CHECKSUM(NEWID())) % 550) AS cost
    FROM master..spt_values
    WHERE type = 'P'
      AND number < 90
) t;


select * from ga

select * from gads

select * from meta


/*Inserindo a coluna com "id para o Power Bi"*/
ALTER TABLE ga
ADD source_system VARCHAR(10);

ALTER TABLE gads
ADD source_system VARCHAR(10);

ALTER TABLE meta
ADD source_system VARCHAR(10);

/*preenchendo estas colunas*/

UPDATE ga
SET source_system = 'GA';



UPDATE gads
SET source_system = 'GADS'

select * from gads

UPDATE meta
SET source_system = 'META'



select * from ga

select * from gads

select * from meta


alter table ga
ADD CONSTRAINT df_ga_source_system DEFAULT 'GA' FOR source_system;


alter table gads
ADD CONSTRAINT df_gads_source_system DEFAULT 'GADS' for source_system;

alter table meta
ADD Constraint df_meta_source_system DEFAULT 'META' for source_system;




UPDATE gads
SET source_system = 'GADS'
WHERE source_system IS NULL;

UPDATE meta
SET source_system = 'META'
WHERE source_system IS NULL;


/*checando se existe dados nas tabelas*/

select count(*) from ga

select count(*) from gads

select count(*) from meta

select * from ga

select * from gads

select * from meta