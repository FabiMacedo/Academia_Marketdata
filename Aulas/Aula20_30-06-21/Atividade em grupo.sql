--Atividade em grupo Juan - Camile - Fabiana

/*1. Exiba sem repeticões os domínios de e-mails 
cadastrados de clientes(exemplo: gferreira@marketdata.com; 
o domínio é marketdata.com)*/

SELECT DISTINCT
	RIGHT(DS_EMAIL,LEN(DS_EMAIL)-CHARINDEX('@',DS_EMAIL)) AS DOMINIO
	--SUBSTRING (DS_EMAIL, CHARINDEX('@',DS_EMAIL)+1,LEN(DS_EMAIL)-CHARINDEX('@',DS_EMAIL)) AS DOMINIO
FROM TB_CLIENTE
ORDER BY DOMINIO


/*2. Há registros de vendas entregues sem data de 
entrega registrada. Selecione as colunas ID_VENDA, DS_STATUS
e exiba uma terceira coluna que traga "CANCELADO" quando 
a DT_ENTREGA estiver nulo; quando estiver preenchido, retorne 
o próprio DS_STATUS. Filtrar apenas o DS_STATUS "ENTREGUE" */

SELECT * FROM TB_VENDA
SELECT
	ID_VENDA, 
	DS_STATUS,
	IIF(DT_ENTREGA IS NULL, 'CANCELADA', DS_STATUS) SITUACAO_ENTREGA
FROM TB_VENDA
WHERE DS_STATUS = 'ENTREGUE'


/*3. Selecione os dados das vendas entregues aos finais de 
semana, retorne uma coluna extra calculando o tempo da entrega 
com a diferença em dias da data da venda até a data da entrega.*/

SELECT 
	ID_VENDA, 
	DT_ENTREGA,
	DATEDIFF(DAY,DT_VENDA, DT_ENTREGA) TEMPO_ENTREGA,
	DATEPART(WEEKDAY, DT_ENTREGA) DIA_DA_SEMANA
FROM TB_VENDA
WHERE DATEPART(WEEKDAY, DT_ENTREGA) IN (7,1)


/*4. Selecione todos os endereços do Sul, ordenando de forma 
que sejam retornados por estado na seguinte ordem: RS, SC e PR*/

SELECT
	DS_ENDERECO,
	NM_ESTADO,
	CASE NM_ESTADO
		WHEN 'RS' THEN '1' 
		WHEN 'SC' THEN '2'
		WHEN 'PR' THEN '3'
	END ESTADO_ORDEM
FROM TB_ENDERECO
WHERE  NM_ESTADO IN ('PR','RS','SC') 
ORDER BY ESTADO_ORDEM
	
 
/*5. Retorne todos os dados dos itens vendidos e calcule o valor 
total do item vendido(multiplique a quantidade pelo subtotal 
menos o dedsconto), retorne apenas o valor inteiro*/

SELECT *, 
	FLOOR(QT_ITEM * (VL_PRECOUNITARIO - ISNULL(VL_DESCONTOUNITARIO,0))) AS VALOR_ARREDONDADO
FROM TB_VENDAITEM
--WHERE QT_ITEM = 2