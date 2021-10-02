-- COLOCANDO O BD EM USO
USE DB_MADA_VAREJO

-- SELECINANDO TODAS COLUNAS
SELECT * FROM TB_CLIENTE

-- SELECIONANDO ALGUMAS COLUNAS
SELECT 
	NM_PRODUTO, 
	VL_PRECOCUSTO,
	VL_PRECOVENDA
FROM TB_PRODUTO

SELECT 
	NM_PRODUTO, 
	VL_PRECOVENDA,
	VL_PRECOCUSTO
FROM TB_PRODUTO

-- UTILIZANDO O ALIAS
SELECT 
	ID_VENDA	AS	IDENTIFICADOR_DA_VENDA,
	DT_VENDA	AS	DATA_DA_VENDA, 
	DT_ENVIO	AS	DATA_DE_ENVIO
FROM TB_VENDA

SELECT
	ID_VENDA	AS [IDENTIFICADOR DA VENDA],
	DT_VENDA	AS "DATA DA VENDA",
	DT_ENVIO	AS 'DATA DE ENVIO'
FROM TB_VENDA

SELECT 
	DS_ENDERECO [ENDERE�O],
	NM_CIDADE	CIDADE,
	NM_PAIS		"PA�S"
FROM TB_ENDERECO

-- CUIDADO COM AS V�RGULAS E OS ALIAS
SELECT
	DS_ENDERECO NM_CIDADE, NM_PAIS
FROM TB_ENDERECO

-- ALIAS PARA TABELA
SELECT * FROM TB_ENDERECO ENDE
SELECT * FROM TB_ENDERECO AS ENDE

-- CALCULANDO O TOTAL DO ITEM
SELECT 
 *,
 VL_PRECOUNITARIO - VL_DESCONTOUNITARIO AS VL_SUBTOTAL_ITEM,
 QT_ITEM * (VL_PRECOUNITARIO - VL_DESCONTOUNITARIO) AS VL_TOTAL_ITEM
FROM TB_VENDAITEM

SELECT 
 ID_VENDA,
 ID_PRODUTO, 
 VL_PRECOUNITARIO,
 VL_DESCONTOUNITARIO,
 VL_DESCONTOUNITARIO / VL_PRECOUNITARIO AS DESCONTO,
 CONCAT(CONVERT(DECIMAL(4,1),VL_DESCONTOUNITARIO / VL_PRECOUNITARIO * 100),' %')
FROM TB_VENDAITEM

SELECT 
	ID_VENDA,
	ID_CLIENTE,
	VL_SUBTOTAL + VL_FRETE AS VL_TOTAL_VENDA
FROM TB_VENDA

-- Resto da divis�o
SELECT  '9/2' AS [OPERA��O], 9 / 2 AS RESULTADO, 9 % 2 AS RESTO 

-- Valores distintos
SELECT DISTINCT
 NM_ESTADO FROM TB_ENDERECO

SELECT DISTINCT 
 NM_PAIS FROM TB_ENDERECO

 SELECT DISTINCT 
 DS_STATUS, DT_ENTREGA FROM TB_VENDA

-- RETORNANDO AS VENDAS POR DATA
SELECT * FROM TB_VENDA
ORDER BY DT_VENDA -- PADR�O CRESCENTE

SELECT * FROM TB_VENDA
ORDER BY DT_VENDA ASC -- CRESCENTE - MENOR P/ MAIOR

SELECT * FROM TB_VENDA
ORDER BY DT_VENDA DESC -- DECRESCENTE - MAIOR P/ MENOR

-- ORDENANDO POR MAIS DE UMA COLUNA
SELECT DS_STATUS, ID_VENDA, DT_VENDA
FROM TB_VENDA
ORDER BY DS_STATUS ASC, DT_VENDA DESC

-- ORDENANDO PRODUTOS (ORDENAR SEM EXIBIR O DADO)
SELECT NM_PRODUTO FROM TB_PRODUTO
ORDER BY VL_PRECOVENDA

--
-- ORDENAR PELO ALIAS
SELECT 
 *,
 VL_PRECOUNITARIO - VL_DESCONTOUNITARIO AS VL_SUBTOTAL_ITEM,
 QT_ITEM * (VL_PRECOUNITARIO - VL_DESCONTOUNITARIO) AS VL_TOTAL_ITEM
FROM TB_VENDAITEM
ORDER BY VL_TOTAL_ITEM DESC

-- ORDENAR PELA POSI��O DA "COLUNA"
SELECT 
 *,
 VL_PRECOUNITARIO - VL_DESCONTOUNITARIO AS VL_SUBTOTAL_ITEM,
 QT_ITEM * (VL_PRECOUNITARIO - VL_DESCONTOUNITARIO) AS VL_TOTAL_ITEM
FROM TB_VENDAITEM
ORDER BY 7 DESC

-- ORDENA��O POR UMA EXPRESS�O
SELECT 
 *,
 VL_PRECOUNITARIO - VL_DESCONTOUNITARIO AS VL_SUBTOTAL_ITEM,
 QT_ITEM * (VL_PRECOUNITARIO - VL_DESCONTOUNITARIO) AS VL_TOTAL_ITEM
FROM TB_VENDAITEM
ORDER BY QT_ITEM * (VL_PRECOUNITARIO - VL_DESCONTOUNITARIO) DESC

-- RESTRINGINDO A QUANTIDADE DE REGISTROS
-- QUAL A VENDA QUE TEVE O MAIOR VL_TOTAL (VALOR + FRETE)
SELECT TOP 1
	*, 
	VL_SUBTOTAL + VL_FRETE AS TOTAL 
FROM TB_VENDA
ORDER BY TOTAL DESC

-- OS 100 PRIMEIROS PRODUTOS DA TABELA
SELECT TOP 100 * FROM TB_PRODUTO

-- 10 CLIENTE DE FORMA ALEAT�RIA
SELECT TOP 10 * FROM TB_CLIENTE
ORDER BY NEWID()

-- 1% DE CLIENTES DE FORMA ALEAT�RIA
SELECT TOP 1 PERCENT * FROM TB_CLIENTE
ORDER BY NEWID()


-- SETE PRODUTOS COM OS MENORES PRE�OS DE VENDA
SELECT TOP 7 WITH TIES  * FROM TB_PRODUTO
ORDER BY VL_PRECOVENDA

SELECT TOP 7 WITH TIES  * FROM TB_PRODUTO
ORDER BY VL_PRECOVENDA DESC


-- FILTRANDO OS SELECTS
select * from tb_endereco

-- TODOS ENDERE�OS DE S�O PAULO (CIDADE)
SELECT DS_ENDERECO FROM TB_ENDERECO
WHERE NM_CIDADE = 'S�O PAULO'  --'s�o paulo' 'S�o Paulo'

-- PRODUTOS QUE PESEM MENOS DE 1 QUILO
SELECT NM_PRODUTO, VL_PESO 
FROM TB_PRODUTO
WHERE VL_PESO < 1
ORDER BY VL_PESO DESC

-- VENDAS COM FRETE MAIORES QUE R$50
SELECT * FROM TB_VENDA
WHERE VL_FRETE > 50

-- PRODUTOS QUE TENHAM ALGUMA COR CADASTRADA
SELECT DISTINCT DS_COR FROM TB_PRODUTO

SELECT * FROM TB_PRODUTO
WHERE DS_COR != 'N�O INFORMADA' -- DS_COR <> 'N�O INFORMADA'
ORDER BY DS_COR

-- ITENS DE VENDA COM r$1000 OU MAIS DE DESCONTO
SELECT * FROM TB_VENDAITEM
WHERE VL_DESCONTOUNITARIO >= 1000
ORDER BY VL_DESCONTOUNITARIO

-- PRODUTOS QUE O PRECO DE VENDA � MAIOR OU IGUAL A DO PRECO DE CUSTO MAIS 30%
SELECT * FROM TB_PRODUTO
WHERE VL_PRECOVENDA >= VL_PRECOCUSTO * 1.3

-- TODOS ENDERE�OS DE S�O PAULO (CIDADE) OU DO RIO DE JANEIRO (CIDADE)
SELECT * FROM TB_ENDERECO
WHERE NM_CIDADE = 'S�O PAULO' OR NM_CIDADE = 'RIO DE JANEIRO'

SELECT * FROM TB_ENDERECO
WHERE NM_CIDADE = 'S�O PAULO' AND NM_CIDADE = 'RIO DE JANEIRO'

-- ITENS DE VENDA COM r$1000 OU MAIS DE DESCONTO E QUANTIDADE = 2 
SELECT * FROM TB_VENDAITEM
WHERE VL_DESCONTOUNITARIO >= 1000
AND  QT_ITEM = 2

-- N�O QUERO ITENS DE VENDA COM r$1000 OU MAIS DE DESCONTO E QUANTIDADE = 2 
SELECT * FROM TB_VENDAITEM
WHERE NOT (VL_DESCONTOUNITARIO >= 1000 AND  QT_ITEM = 2)
ORDER BY QT_ITEM DESC

-- PRODUTOS QUE CUSTAM MAIS DE 1000 OU PESEM MENOS DE 10 KGS, SOMENTE PRODUTOS PRETOS. 
-- ORDEM DE EXECU��O, 1� NOT, 2� AND, 3� OR, 

SELECT * FROM TB_PRODUTO
WHERE VL_PRECOCUSTO > 1000 OR VL_PESO < 10 AND DS_COR = 'PRETO'

SELECT * FROM TB_PRODUTO
WHERE (VL_PRECOCUSTO > 1000 OR VL_PESO < 10) AND DS_COR = 'PRETO'

-- TODOS ENDERE�OS DE S�O PAULO (CIDADE) OU DO RIO DE JANEIRO (CIDADE)
SELECT * FROM TB_ENDERECO
WHERE NM_CIDADE IN ('S�O PAULO','RIO DE JANEIRO')

-- TODOS ENDERE�OS EXCETO  S�O PAULO (CIDADE) E  RIO DE JANEIRO (CIDADE)
SELECT * FROM TB_ENDERECO
WHERE NM_CIDADE NOT IN ('S�O PAULO','RIO DE JANEIRO')

-- PRODUTO COM PRECO CUSTO ENTRE r$1000 E r$3000 
SELECT * FROM TB_PRODUTO
WHERE VL_PRECOCUSTO >= 1000 AND VL_PRECOCUSTO <= 3000

SELECT * FROM TB_PRODUTO
WHERE VL_PRECOCUSTO BETWEEN 1000 AND 3000 

-- PRODUTOS QUE INICIARAM A VENDA EM 2019
SELECT * FROM TB_PRODUTO
WHERE DT_INICIOVENDA BETWEEN '2019-01-01' AND '2019-12-31'

-- PRODUTOS QUE PESEM MENOS DE 2 KGS OU MAIS DE 5KGS 
SELECT * FROM TB_PRODUTO
WHERE VL_PESO < 2 OR VL_PESO > 5

SELECT * FROM TB_PRODUTO
WHERE VL_PESO NOT BETWEEN 2 AND 5