--Coloque o seu BD em uso
USE master

--Crie uma VIEW que retorne os clientes que receberam suas compras nos últimos 30 dias
CREATE VIEW VW_CLIENTES_30D
AS
SELECT DISTINCT	
	TB_CLIENTE.*
FROM DB_MADA_VAREJO..TB_CLIENTE
	INNER JOIN DB_MADA_VAREJO..TB_VENDA
		ON TB_VENDA.ID_CLIENTE = TB_CLIENTE.ID_CLIENTE
--WHERE DT_ENTREGA >= DATEADD(DAY,-30,GETDATE())
WHERE DATEDIFF(DAY,DT_ENTREGA,GETDATE()) <= 30

SELECT * FROM DBO.VW_CLIENTES_30D


--Crie uma function que receba uma coluna ou variável DATETIME e retorne no formato “dia do mês do ano”, 
--conforme o seguinte padrão “1 de janeiro de 2021”
CREATE FUNCTION FN_DT_COMPLETA (@DT DATETIME)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @DT_COMPLETA VARCHAR(100)

	SET @DT_COMPLETA = 
		CONCAT(DAY(@DT),
				' de ',
				CASE MONTH(@DT)
					WHEN 1 THEN 'janeiro'
					WHEN 2 THEN 'fevereiro'
					WHEN 3 THEN 'março'
					WHEN 4 THEN 'abril'
					WHEN 5 THEN 'maio'
					WHEN 6 THEN 'junho'
					WHEN 7 THEN 'julho'
					WHEN 8 THEN 'agosto'
					WHEN 9 THEN 'setembro'
					WHEN 10 THEN 'outubro'
					WHEN 11 THEN 'novembro'
					WHEN 12 THEN 'dezembro'
				END,
				' de ',
			YEAR(@DT))

	 RETURN @DT_COMPLETA

END

SELECT DBO.FN_DT_COMPLETA(GETDATE())

SELECT
	ID_VENDA,
	DT_VENDA,
	DBO.FN_DT_COMPLETA(DT_VENDA) AS DT_VENDA_FORMATADA
FROM DB_MADA_VAREJO..TB_VENDA

CREATE FUNCTION FN_DT_COMPLETA2 (@DT DATETIME)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @DT_COMPLETA VARCHAR(100)

	IF MONTH(@DT) = 1 
		SET @DT_COMPLETA = 	CONCAT(DAY(@DT),' de janeiro de ', YEAR(@DT)) 
	ELSE IF MONTH(@DT) = 2 
		SET @DT_COMPLETA = 	CONCAT(DAY(@DT),' de fevereiro de ', YEAR(@DT))  
	ELSE IF MONTH(@DT) = 3 
		SET @DT_COMPLETA = 	CONCAT(DAY(@DT),' de março de ', YEAR(@DT))
	ELSE IF MONTH(@DT) = 4 
		SET @DT_COMPLETA = 	CONCAT(DAY(@DT),' de abril de ', YEAR(@DT))
	ELSE IF MONTH(@DT) = 5 
		SET @DT_COMPLETA = 	CONCAT(DAY(@DT),' de maio de ', YEAR(@DT))
	ELSE IF MONTH(@DT) = 6 
		SET @DT_COMPLETA = 	CONCAT(DAY(@DT),' de junho de ', YEAR(@DT))
	ELSE IF MONTH(@DT) = 7 
		SET @DT_COMPLETA = 	CONCAT(DAY(@DT),' de julho de ', YEAR(@DT))
	ELSE IF MONTH(@DT) = 8 
		SET @DT_COMPLETA = 	CONCAT(DAY(@DT),' de agosto de ', YEAR(@DT))
	ELSE IF MONTH(@DT) = 9 
		SET @DT_COMPLETA = 	CONCAT(DAY(@DT),' de setembro de ', YEAR(@DT))
	ELSE IF MONTH(@DT) = 10
		SET @DT_COMPLETA = 	CONCAT(DAY(@DT),' de outubro de ', YEAR(@DT))
	ELSE IF MONTH(@DT) = 11
		SET @DT_COMPLETA = 	CONCAT(DAY(@DT),' de novembro de ', YEAR(@DT))
	ELSE IF MONTH(@DT) = 12
		SET @DT_COMPLETA = 	CONCAT(DAY(@DT),' de dezembro de ', YEAR(@DT))


	RETURN @DT_COMPLETA

END

select dbo.fn_dt_completa2(getdate())


--
CREATE FUNCTION FN_DATAS_EXTENSO (@DATA DATETIME)RETURNS VARCHAR(8000)AS BEGIN    DECLARE @DATA_NOVA VARCHAR(100)    DECLARE @MES VARCHAR (20)    DECLARE @DIA CHAR (2)    DECLARE @ANO CHAR (4)    SET @DIA = DAY(@DATA)    SET @ANO = YEAR(@DATA)    IF MONTH(@DATA) = 01         SET @MES = 'JANEIRO'        ELSE IF MONTH(@DATA) = 02             SET @MES =  'FEVEREIRO'        ELSE IF MONTH(@DATA) = 03             SET @MES =  'MARÇO'        ELSE IF MONTH(@DATA) = 04             SET @MES =  'ABRIL'        ELSE IF MONTH(@DATA) = 05             SET @MES =  'MAIO'        ELSE IF MONTH(@DATA) = 06             SET @MES =  'JUNHO'        ELSE IF MONTH(@DATA) = 07             SET @MES =  'JULHO'        ELSE IF MONTH(@DATA) = 08             SET @MES =  'AGOSTO'                    ELSE IF MONTH(@DATA) = 09             SET @MES =  'SETEMBRO'        ELSE IF MONTH(@DATA) = 10             SET @MES =  'OUTUBRO'        ELSE IF MONTH(@DATA) = 11             SET @MES =  'NOVEMBRO'
				ELSE             SET @MES =  'DEZEMBRO'       SET @DATA_NOVA = CONCAT((@DIA), ' de ', (@MES), ' de ', (@ANO))	 RETURN @DATA_NOVA    END

select dbo.FN_DATAS_EXTENSO(getdate()) 