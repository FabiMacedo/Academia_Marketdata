--Revis?o da aula de Join
SELECT * FROM TB_PRODUTO
ORDER BY ID_CATEGORIA

SELECT * FROM TB_CATEGORIA
WHERE ID_CATEGORIA IN (25, 18, 76, 17, 57)

--INNER JOIN - INTERSEC??O DAS TABELAS
SELECT * FROM TB_PRODUTO
INNER JOIN TB_CATEGORIA
ON TB_PRODUTO.ID_CATEGORIA = TB_CATEGORIA.ID_CATEGORIA
ORDER BY TB_PRODUTO.ID_CATEGORIA

--TRAZENDO TODOS OS DADOS DE TB_PRODUTO E SOMENTE UM 
--CAMPO DA TB_CATEGORIA
SELECT
	TB_PRODUTO. *,
	TB_CATEGORIA.NM_CATEGORIA
	FROM TB_PRODUTO
	INNER JOIN TB_CATEGORIA
	ON TB_PRODUTO.ID_CATEGORIA = TB_CATEGORIA.ID_CATEGORIA

--OBS: MUITO CUIDADO PARA REFERENCIAR OS CAMPOS DE COMPARA??O CORRETOS

--JUN??O DAS 3 TABELAS
SELECT 
	TB_VENDA.DT_VENDA,
	TB_VENDAITEM.QT_ITEM,
	TB_PRODUTO.NM_PRODUTO
FROM TB_PRODUTO
	INNER JOIN TB_VENDAITEM
		ON TB_PRODUTO.ID_PRODUTO = TB_VENDAITEM.ID_PRODUTO
	INNER JOIN TB_VENDA
		ON TB_VENDA.ID_VENDA = TB_VENDAITEM.ID_VENDA

--PRODUTOS VENDIDOS EM MAR?O 2019

SELECT 
	TB_VENDA.DT_VENDA,
	TB_PRODUTO.NM_PRODUTO
FROM TB_PRODUTO
	INNER JOIN TB_VENDAITEM
		ON TB_PRODUTO.ID_PRODUTO = TB_VENDAITEM.ID_PRODUTO
	INNER JOIN TB_VENDA
		ON TB_VENDA.ID_VENDA = TB_VENDAITEM.ID_VENDA
WHERE TB_VENDA.DT_VENDA BETWEEN '20190301' AND '20190331 23:59:59'


--ALIAS
SELECT 
	V.DT_VENDA,
	P.NM_PRODUTO
FROM TB_PRODUTO AS P
	INNER JOIN TB_VENDAITEM AS VI
		ON P.ID_PRODUTO = VI.ID_PRODUTO
	INNER JOIN TB_VENDA AS V
		ON V.ID_VENDA = VI.ID_VENDA
WHERE V.DT_VENDA BETWEEN '20190301' AND '20190331 23:59:59'