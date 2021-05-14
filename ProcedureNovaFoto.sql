
CREATE PROCEDURE dbo.insereNovasFotosCronograma
WITH RECOMPILE
AS
BEGIN
	/*
		Construção de uma stored procedure que apartir dos dados do arquivo 3 irá inserir novas fotos no modelo. 
	*/
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
           DataFoto,
           IDTranche,
           3 AS Tipo,
           [DataBase],
           DataBaixa,
           DataEvento,
           SUM(Projetado) AS Projetado,
           Realizado,
           TaxaCambio,
           TaxaVariante,
           Taxa,
           FoiRealizado
	FROM dbo.TbDeltaCronograma
	WHERE FoiRealizado = 0
	GROUP BY IDContrato,
           DataFoto,
           IDTranche,
           [DataBase],
           DataBaixa,
           DataEvento,
		   Realizado,
           TaxaCambio,
           TaxaVariante,
           Taxa,
           FoiRealizado
	
	EXCEPT
	SELECT IDContrato,
           CAST(LEFT(DataFoto,10) AS DATE) AS DataFoto,
           IDTranche,
           Tipo,
           CAST(LEFT([DataBase],10) AS DATE) AS [DataBase],
           CAST(LEFT(DataBaixa,10) AS DATE) AS DataBaixa,
           CAST(LEFT(DataEvento,10) AS DATE) AS DataEvento,
           CAST(Projetado AS DECIMAL(38,2)) AS Projetado,
           Realizado,
           TaxaCambio,
           TaxaVariante,
           Taxa,
           FoiRealizado
	FROM dbo.TbCronograma 
	
END
GO
