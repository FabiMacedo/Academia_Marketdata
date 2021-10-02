-- FUN��ES DE TEXTO
-- EXTRAIR OU SELECIONAR UMA PARTE DE UM TEXTO
--SUBSTRING(TEXTO_USADO,ONDE_COME�A, QUANTIDADE) 
SELECT *,
	SUBSTRING(CD_CODIGOPOSTAL,1,5) CEP5,
	SUBSTRING(CD_CODIGOPOSTAL,6,3) CEP3_FIM,
	CONCAT(SUBSTRING(CD_CODIGOPOSTAL,1,5),'-',SUBSTRING(CD_CODIGOPOSTAL,6,3)) CEP_TRATADO
FROM TB_ENDERECO


SELECT 
	ID_CLIENTE, 
	NM_CLIENTE, 
	CONCAT('(',SUBSTRING(NR_TELEFONE,1,2),')',SUBSTRING(NR_TELEFONE,3,5),'-',SUBSTRING(NR_TELEFONE,8,4) ) AS TELEFONE_TRATADO
FROM TB_CLIENTE

--EXTRAIR OU SELECIONAR UMA PARTE DE UM TEXTO
--LEFT PEGA O INICIO DA STRING + TAMANHO
--RIGHT FINAL DA STRING + TAMANHO
SELECT *,
	LEFT (CD_CODIGOPOSTAL,5) CEP5,
	RIGHT(CD_CODIGOPOSTAL,3) CEP3_FIM,
	CONCAT(LEFT (CD_CODIGOPOSTAL,5),'-',RIGHT(CD_CODIGOPOSTAL,3)) CEP_TRATADO
FROM TB_ENDERECO

--INCLUINDO O CEP TRATADO NO BANCO
UPDATE 
	TB_ENDERECO
SET CD_CODIGOPOSTAL = CONCAT(LEFT(CD_CODIGOPOSTAL,5),'-',RIGHT(CD_CODIGOPOSTAL,3))

-- ENDERE�O E CIDADE EM MAIUSCULO, NOME PA�S EM MINUSCULO
SELECT 
	UPPER(DS_ENDERECO) ENDERECO,
	UPPER(NM_CIDADE)   CIDADE,
	LOWER(NM_PAIS)	   PAIS
FROM TB_ENDERECO

-- RETIRA ESPA�OS EM BRANCO DO COME�O (LTRIM) OU DO FIM (RTRIM)
SELECT '      12345'
SELECT 	LTRIM('      12345') 

SELECT '12345     '
SELECT RTRIM('12345     ')

SELECT TRIM('      12345      ')
SELECT RTRIM(LTRIM('      12345      '))

--QUANTIDADE DE CARACTERES LEN()
-- SEPARANDO NOME E SOBRENOME
SELECT 
	NM_CLIENTE,
	LEN(NM_CLIENTE)				QTD_CARACTERES,
	--RETORNA ONDE EST� O CARACTERE
	CHARINDEX(' ',NM_CLIENTE)	POSICAO_DO_ESPACO,
	LEFT(NM_CLIENTE,CHARINDEX(' ',NM_CLIENTE)-1) AS PRIMEIRO_NOME,
	RTRIM(LEFT(NM_CLIENTE,CHARINDEX(' ',NM_CLIENTE))) PRIMEIRO_NOME,

	LEN(NM_CLIENTE)-CHARINDEX(' ',NM_CLIENTE),
	RIGHT(NM_CLIENTE,LEN(NM_CLIENTE)-CHARINDEX(' ',NM_CLIENTE)) AS SOBRENOME,
	--TROCA UM TEXTO POR OUTRO
	REPLACE(NM_CLIENTE,LEFT(NM_CLIENTE,CHARINDEX(' ',NM_CLIENTE)),'') SOBRENOME	
FROM TB_CLIENTE

SELECT 
	DS_ENDERECO,
	REPLACE(REPLACE(DS_ENDERECO,'RUA','R.'),'AVENIDA','AV.')
FROM TB_ENDERECO
