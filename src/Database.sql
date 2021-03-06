USE DbTest;
GO

IF OBJECT_ID('dbo.Patrimonio', 'U') IS NOT NULL
	DROP TABLE Patrimonio;
GO
IF OBJECT_ID('dbo.Marca', 'U') IS NOT NULL
	DROP TABLE Marca;
GO
IF OBJECT_ID('dbo.Modelo', 'U') IS NOT NULL
	DROP TABLE Modelo;
GO


CREATE TABLE Marca (
	MarcaId INT NOT NULL IDENTITY PRIMARY KEY,
	Nome VARCHAR(60) NOT NULL,
	DataCriacao DATETIME NOT NULL
);
CREATE TABLE Modelo (
	ModeloId INT NOT NULL IDENTITY PRIMARY KEY,
	Nome VARCHAR(60) NOT NULL,
	DataCriacao DATETIME NOT NULL
);
CREATE TABLE Patrimonio (
	PatrimonioId INT NOT NULL IDENTITY PRIMARY KEY,
	MarcaId INT NOT NULL,
	ModeloId  INT NOT NULL,
	Nome VARCHAR(60) NOT NULL,
	Descricao VARCHAR(140) NULL,
	DataCriacao DATETIME NOT NULL,
	NroTombo INT NOT NULL,
    CONSTRAINT FK_Patrimonio_Marca FOREIGN KEY (MarcaId) REFERENCES Marca(MarcaId),
    CONSTRAINT FK_Patrimonio_Modelo FOREIGN KEY (ModeloId) REFERENCES Modelo(ModeloId)
);
GO


INSERT INTO Marca (Nome, DataCriacao) VALUES
	('Marca01', GETDATE()),
	('Marca02', GETDATE());

INSERT INTO Modelo (Nome, DataCriacao) VALUES
	('Modelo01', GETDATE());

INSERT INTO Patrimonio (MarcaId, ModeloId, Nome, Descricao, DataCriacao, NroTombo) VALUES
	(1, 1, 'Patrimonio-1', 'Descrição-1', GETDATE(), 1),
    (2, 1, 'Patrimonio-2', 'Descrição-2', GETDATE(), 2);


