
CREATE PROCEDURE dbo.CronogramaContrato @IDCONTRATO INT, @DATAFOTO DATE
AS
BEGIN
SELECT A.IDContrato,
		--IDContrato, IDTranche, Tipo e dataBase
		CONCAT(CONCAT(CONCAT(A.IDContrato,'_', B.IDTranche),'_',B.Tipo),'_',LEFT(B.[DataBase],10)) AS IDFLUXO,
		B.Tipo,
		CAST(LEFT(B.[DataBase],10) AS DATE) AS [DataBase],
		B.DataBaixa,
		B.DataEvento,
		B.FoiRealizado,
		B.Projetado,
		B.Realizado,
		B.TaxaCambio,
		B.TaxaVariante,
		B.Taxa,
		CAST(LEFT(B.DataFoto,10) AS DATE)
FROM dbo.TbContrato A
INNER JOIN dbo.TbCronograma B ON B.IDContrato = A.IDContrato
WHERE A.IDContrato = @IDCONTRATO
AND B.DataFoto = @DATAFOTO

END
GO