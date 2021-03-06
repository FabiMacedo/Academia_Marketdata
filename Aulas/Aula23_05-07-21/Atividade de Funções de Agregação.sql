--Atividade de Fun??es de Agrega??o
--Coloque o banco DB_MADA_VAREJO em uso
USE DB_MADA_VAREJO

/*1. Quantas compras foram entregues na cidade de
Osasco?*/

SELECT
	TB_ENDERECO.NM_CIDADE,
	COUNT(TB_VENDA.DS_STATUS) STATUS_ENTREGUE
FROM TB_VENDA
	INNER JOIN TB_ENDERECO 
		ON TB_VENDA.ID_ENDERECOCOBRANCA = TB_ENDERECO.ID_ENDERECO
WHERE TB_ENDERECO.NM_CIDADE = 'Osasco' AND TB_VENDA.DS_STATUS  = 'ENTREGUE'
GROUP BY TB_ENDERECO.NM_CIDADE



/*2. Qual produto teve o maior valor vendido (quantidade
multiplicada pelo valor unit?rio abatido do desconto) no
segundo quadrimestre de 2020?*/

SELECT
	TB_PRODUTO.ID_PRODUTO,
	TB_PRODUTO.NM_PRODUTO,
	SUM(QT_ITEM * (VL_PRECOUNITARIO - ISNULL(VL_DESCONTOUNITARIO, 0)))
FROM TB_PRODUTO
	JOIN TB_VENDAITEM
		ON TB_PRODUTO.ID_PRODUTO = TB_VENDAITEM.ID_PRODUTO
	JOIN TB_VENDA
		ON TB_VENDA.ID_VENDA = TB_VENDAITEM.ID_VENDA
WHERE DT_VENDA BETWEEN '20200501' AND '20200831 23:59:59'
GROUP BY
	TB_PRODUTO.ID_PRODUTO,
	TB_PRODUTO.NM_PRODUTO

/*3. Qual a categoria tem o maior volume (quantidade) de
vendas? E qual categoria tem o menor volume?*/




/*4. Quais clientes possuem mais de um endere?o?*/                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   