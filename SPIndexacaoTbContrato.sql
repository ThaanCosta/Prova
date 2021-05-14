CREATE PROCEDURE IndexacaoContrato
AS
BEGIN
    IF (OBJECT_ID('TEMPDB.dbo.#TMPContrato') IS NOT NULL)
        DROP TABLE dbo.#TMPContrato;
    SELECT IDContrato,
           CodigoContrato,
           NomeContrato
    INTO dbo.#TMPContrato
    FROM dbo.TbContrato;

    CREATE NONCLUSTERED INDEX IDC_IndexacaoContrato
    ON tempdb.dbo.#TMPContrato (
                                   CodigoContrato ASC,
                                   NomeContrato DESC
                               );
	SELECT * FROM dbo.#TMPContrato
END;
GO

EXEC dbo.IndexacaoContrato