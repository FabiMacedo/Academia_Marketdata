--Mão na massa em grupo

--Coloque o banco DB_MADA_VAREJO em uso
USE DB_MADA_VAREJO


/*1. Crie uma tabela temporária #VENDA_MENSAL com as seguintes colunas:
* ANO_VENDA
* MES_VENDA
* ESTADO_ENTREGA
* VALOR_VENDA*/

SELECT 
	YEAR(TB_VENDA.DT_VENDA) ANO_VENDA,
	MONTH(TB_VENDA.DT_VENDA) MES_VENDA


/*2. Tendo como base a tabela #VENDA_MENSAL, classifique se o ano e mês teve mais venda ou menos venda que o mês anterior para cada estado.*/


/*3. Tendo como base a tabela #VENDA_MENSAL, selecione o mês com maior valor de venda de cada ano para cada estado.*/



SELECT 	TB_VENDA.DT_VENDA,	MONTH(DT_VENDA) AS MES_VENDA,	YEAR(DT_VENDA) AS ANO_VENDA,	TB_ENDERECO.NM_ESTADO,	RANK() OVER (ORDER BY TB_ENDERECO.NM_ESTADO) POSICAO_ESTADO,	SUM (ISNULL(QT_ITEM *(VL_PRECOUNITARIO - VL_DESCONTOUNITARIO),0)) AS VALOR_VENDA--INTO #VENDA_MENSAL  FROM TB_VENDAITEM	JOIN TB_VENDA		ON TB_VENDAITEM.ID_VENDA = TB_VENDA.ID_VENDA 	JOIN TB_ENDERECO		ON ID_ENDERECOENTREGA = TB_ENDERECO.ID_ENDERECOGROUP BY DT_VENDA,TB_ENDERECO.NM_ESTADO --ORDER BY VALOR_VENDA SELECT *FROM #VENDA_MENSAL


