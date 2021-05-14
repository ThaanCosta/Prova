
/*
    SCRIPT DE CRIAÇÃO 
	MODELAGEM DE DADOS - DB PROVA
*/

--======================================--
--== QUERY PARA CRIAR A BASE DE DADOS ==--
--======================================--
CREATE DATABASE PROVA;
--======================================--

--======================================--
--===== SCRIPT CRIACAO TBContrato ======--
--======================================--
--DROP TABLE TbContrato
CREATE TABLE TbContrato
(
    IDContrato INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    CodigoContrato NVARCHAR(100),
    NomeContrato NVARCHAR(100),
    TipoInstrumento NVARCHAR(50),
    Vencimento DATETIME,
    Emissao DATETIME,
    Moeda NVARCHAR(10),
    Indexador NVARCHAR(50),
    Calendario NVARCHAR(50),
    Basis NVARCHAR(100),
    Pais NVARCHAR(50),
    SeriePreco NVARCHAR(50)
);

--======================================--
--===== SCRIPT CRIACAO TBContrato ======--
--======================================--
--DROP TABLE TbCronograma
CREATE TABLE TbCronograma
(
	IDContrato INT,
    DataFoto DATETIME,
    IDTranche INT,
    Tipo INT,
    [DataBase] DATETIME,
    DataBaixa DATETIME,
    DataEvento DATETIME,
    Projetado MONEY,
    Realizado MONEY,
    TaxaCambio DECIMAL(9, 2),
    TaxaVariante DECIMAL(9, 2),
    Taxa DECIMAL(9, 2),
    FoiRealizado BIT,
    CONSTRAINT FK_TbCronograma_TbContrato
        FOREIGN KEY (IDContrato)
        REFERENCES TbContrato (IDContrato)
);

--======================================--
--= SCRIPT CRIACAO TBDeltaCronograma ===--
--======================================--
--DROP TABLE TbDeltaCronograma
CREATE TABLE TbDeltaCronograma
(
    IDContrato INT,
    DataFoto DATETIME,
    IDTranche INT,
    Tipo INT,
    [DataBase] DATETIME,
    DataBaixa DATETIME,
    DataEvento DATETIME,
    Projetado MONEY,
    Realizado DECIMAL(9, 2),
    TaxaCambio DECIMAL(9, 2),
    TaxaVariante DECIMAL(9, 2),
    Taxa DECIMAL(9, 2),
    FoiRealizado BIT,
    CONSTRAINT FK_TbDeltaCronograma_TbContrato
        FOREIGN KEY (IDContrato)
        REFERENCES TbContrato (IDContrato)
);
GO


