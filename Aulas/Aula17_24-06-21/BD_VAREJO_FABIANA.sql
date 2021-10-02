--Script de Fabiana Macedo

DROP TABLE TB_CLIENTE;
DROP TABLE TB_PRODUTO;
DROP TABLE TB_VENDA;

-- CRIANDO A TABELA TB_CLIENTE
 CREATE TABLE  TB_CLIENTE
 (
	ID_CLIENTE   INT IDENTITY,
	NM_CLIENTE   VARCHAR(200)  NOT NULL,
	DS_EMAIL     VARCHAR(200)  NOT NULL, 
	NR_TELEFONE  VARCHAR(15)   NOT NULL

	CONSTRAINT   PK_TB_CLIENTE_ID_CLIENTE	PRIMARY KEY (ID_CLIENTE),
	CONSTRAINT   UQ_TB_CLIENTE_DS_EMAIL UNIQUE(DS_EMAIL),
	/*CONSTRAINT CK_TB_CLIENTE_NR_TELEFONE CHECK (N�O PERMITIR LETRAS)*/
 );

 -- CRIANDO A TABELA TB_PRODUTO
CREATE TABLE TB_PRODUTO
(
	ID_PRODUTO        INT              IDENTITY,
	NM_PRODUTO        VARCHAR(150)     NOT NULL,
	CD_PRODUTO        CHAR(13)         NOT NULL,
	DS_COR            VARCHAR(30)      NOT NULL,
	VL_PRECO_CUSTO    DECIMAL(9,2)     NOT NULL,
	VL_PRECO_VENDA    DECIMAL(9,2)     NOT NULL,
	VL_PESO	          DECIMAL(9,3)     NOT NULL,
	ID_CATEGORIA      SMALLINT         NOT NULL,
	DT_INICIO_VENDA	  DATE             NOT NULL,
	DT_FIM_VENDA      DATE,
	DS_ARQ_FOTO  	  VARCHAR(100),

	CONSTRAINT PK_TB_PRODUTO_ID_PRODUTO PRIMARY KEY (ID_PRODUTO),
	CONSTRAINT UQ_TB_PRODUTO_NM_PRODUTO UNIQUE(NM_PRODUTO),
	CONSTRAINT UQ_TB_PRODUTO_CD_PRODUTO UNIQUE(CD_PRODUTO),
	CONSTRAINT CK_TB_PRODUTO_VL_PRECO_CUSTO CHECK(VL_PRECO_CUSTO >=0),
	CONSTRAINT CK_TB_PRODUTO_VL_PRECO_VENDA CHECK(VL_PRECO_VENDA >=0),
	CONSTRAINT CK_TB_PRODUTO_VL_PESO CHECK(VL_PESO >=0),
	CONSTRAINT CK_TB_PRODUTO_DT_FIM_VENDA CHECK(DT_FIM_VENDA >= DT_INICIO_VENDA),
);

-- CRIANDO A TABELA TB_VENDA
CREATE TABLE TB_VENDA 
(
	ID_VENDA	         BIGINT IDENTITY,
	DT_VENDA	         DATETIME2 NOT NULL CONSTRAINT TB_VENDA_DT_VENDA_ DEFAULT GETDATE(),
	DT_ENVIO	         DATETIME2,
	DT_ENTREGA	         DATETIME2,
	DS_STATUS	         VARCHAR(30) NOT NULL,
	ID_CLIENTE	         INT NOT NULL,
	ID_ENDERECO_ENTREGA	 INT NOT NULL,
	ID_ENDERECO_COBRANCA INT NOT NULL,
	VL_SUBTOTAL	         DECIMAL(9,2) NOT NULL,
	VL_FRETE	         DECIMAL(9,2) NOT NULL,

	CONSTRAINT PK_TB_VENDA_ID_VENDA PRIMARY KEY (ID_VENDA),
	CONSTRAINT CK_TB_VENDA_DT_ENVIO CHECK(DT_ENVIO >= DT_VENDA),
	CONSTRAINT CK_TB_VENDA_DT_ENTREGA CHECK(DT_ENTREGA >= DT_ENVIO),
	/*OUTRA POSSIBILIDADE CONSTRAINT CK_TB_VENDA_DATAS CHECK(DT_ENVIO >= DT_VENDA AND  DT_ENTREGA >= DT_ENVIO),*/
	CONSTRAINT CK_TB_VENDA_DS_STATUS CHECK(DS_STATUS = 'AGUARDANDO PAGAMENTO' OR DS_STATUS = 'EM TRANSPORTE' 
														OR DS_STATUS = 'ENTREGUE' OR DS_STATUS = 'CANCELADO'),
	CONSTRAINT CK_TB_VENDA_VL_SUBTOTAL CHECK(VL_SUBTOTAL >= 0),
	CONSTRAINT CK_TB_VENDA_VL_FRETE CHECK(VL_FRETE >= 0)
	
);

-- CRIANDO A TABELA TB_CATEGORIA
CREATE TABLE TB_CATEGORIA
(
	ID_CATEGORIA SMALLINT IDENTITY,
	NM_CATEGORIA
);


-- CRIANDO A TABELA TB_ENDERECO
CREATE TABLE TB_ENDERECO
(
	ID_ENDERECO INT IDENTITY,
	DS_ENDERECO VARCHAR(100) NOT NULL,
	DS_COMPLEMENTO VARCHAR(50),
	NM_CIDADE VARCHAR(100) NOT NULL,
	NM_ESTADO VARCHAR(50) NOT NULL,
	NM_PAIS VARCHAR(50) NOT NULL,
	CD_CODIGO_POSTAL VARCHAR(20) NOT NULL,

	CONSTRAINT PK_TB_ENDERECO_ID_ENDERECO PRIMARY KEY (ID_ENDERECO),

	CONSTRAINT UQ_TB_ENDERECO UNIQUE(DS_ENDERECO, DS_COMPLEMENTO, CD_CODIGO_POSTAL),
);


-- CRIANDO A TABELA TB_ENDERECO_CLIENTE
CREATE TABLE TB_ENDERECO_CLIENTE
(
	ID_CLIENTE INT,
	ID_ENDERECO INT,
	DS_TIPO_ENDERECO VARCHAR(15),

	CONSTRAINT PK_TB_ENDERECO_CLIENTE_ID_CLIENTE PRIMARY KEY(ID_CLIENTE),
	CONSTRAINT CK_TB_ENDERECO_CLIENTE_DS_TIPO_ENDERECO CHECK(DS_TIPO_ENDERECO = 'RESIDENCIAL' 
	                                                         OR DS_TIPO_ENDERECO =  'COMERCIAL'), 
);


 --CRIANDO A TABELA TB_VENDA_ITEM
 CREATE TABLE TB_VENDA_ITEM
 (
	ID_VENDA BIGINT,
	ID_VENDA_ITEM SMALLINT,
	ID_PRODUTO	INT NOT NULL,
	QT_ITEM	SMALLINT NOT NULL,
	VL_PRECO_UNITARIO DECIMAL(9,2) NOT NULL,
	VL_DESCONTO_UNITARIO DECIMAL(9,2),

	CONSTRAINT PK_TB_VENDA_ITEM PRIMARY KEY(ID_VENDA, ID_VENDA_ITEM),
 );

 -- CRIANDO AS CHAVES ESTRANGEIRAS
 ALTER TABLE TB_ENDERECO_CLIENTE
	ADD 
	CONSTRAINT FK_TB_ENDERECO_CLIENTE_TB_CLIENTE
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES TB_CLIENTE(ID_CLIENTE),

	CONSTRAINT FK_TB_ENDERECO_CLIENTE_TB_ENDERECO
	FOREIGN KEY(ID_ENDERECO)
	REFERENCES TB_ENDERECO(ID_ENDERECO)
