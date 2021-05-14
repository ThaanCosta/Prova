SET LANGUAGE 'Brazilian';

INSERT INTO dbo.TbCronograma
(
    IDContrato,
    DataFoto,
    IDTranche,
    Tipo,
    [DataBase],
    DataBaixa,
    DataEvento,
    Projetado,
    Realizado,
    TaxaCambio,
    TaxaVariante,
    Taxa,
    FoiRealizado
)

SELECT IDContrato,
       CAST(DataFoto AS DATE) AS DataFoto,
       CAST(IDTranche AS INT) AS IDTranche,
       CAST(Tipo AS INT) AS Tipo,
       CAST([DataBase] AS DATE) AS [DataBase],
       CAST(DataBaixa AS DATE) AS DataBaixa,
       CAST(DataEvento AS DATE) AS DataEvento,
	   CAST(REPLACE(Projetado,',','.') AS DECIMAL(38, 2)) AS Projetado,
       CAST(REPLACE(Realizado,',','.')  AS DECIMAL(38, 2)) AS Realizado,
       CAST(REPLACE(TaxaCambio,',','.')  AS DECIMAL(38, 2)) AS TaxaCambio,
       CAST(REPLACE(TaxaVariante,',','.')  AS DECIMAL(38, 2)) AS TaxaVariante,
       CAST(REPLACE(Taxa,',','.')  AS DECIMAL(38, 2)) AS Taxa,
       CAST(FoiRealizado AS BIT) AS FoiRealizado
FROM dbo.TbCronograma2


INSERT INTO dbo.TbDeltaCronograma
(
    IDContrato,
    DataFoto,
    IDTranche,
    Tipo,
    [DataBase],
    DataBaixa,
    DataEvento,
    Projetado,
    Realizado,
    TaxaCambio,
    TaxaVariante,
    Taxa,
    FoiRealizado
)

SELECT IDContrato,
       CAST(DataFoto AS DATE) AS DataFoto,
       CAST(IDTranche AS INT) AS IDTranche,
       CAST(Tipo AS INT) AS Tipo,
       CAST([DataBase] AS DATE) AS [DataBase],
       CAST(DataBaixa AS DATE) AS DataBaixa,
       CAST(DataEvento AS DATE) AS DataEvento,
       CAST(REPLACE(Projetado,',','.') AS DECIMAL(38, 2)) AS Projetado,
       CAST(REPLACE(Realizado,',','.')  AS DECIMAL(38, 2)) AS Realizado,
       CAST(REPLACE(TaxaCambio,',','.')  AS DECIMAL(38, 2)) AS TaxaCambio,
       CAST(REPLACE(TaxaVariante,',','.')  AS DECIMAL(38, 2)) AS TaxaVariante,
       CAST(REPLACE(Taxa,',','.')  AS DECIMAL(38, 2)) AS Taxa,
       CAST(FoiRealizado AS BIT) AS FoiRealizado
FROM dbo.TbDeltaCronograma2
