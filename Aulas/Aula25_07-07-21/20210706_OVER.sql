-- CLAUSULA OVER
SELECT * FROM TB_PRODUTO

SELECT AVG(VL_PRECOCUSTO) FROM TB_PRODUTO


SELECT 
	ID_CATEGORIA,
	AVG(VL_PRECOCUSTO)
FROM TB_PRODUTO
GROUP BY ID_CATEGORIA
ORDER BY 1

SELECT 
	NM_PRODUTO,
	ID_CATEGORIA,
	VL_PRECOCUSTO,
	AVG(VL_PRECOCUSTO) OVER() VL_PRECOCUSTO_MEDIO_GERAL,
	AVG(VL_PRECOCUSTO) OVER( PARTITION BY ID_CATEGORIA) VL_PRECOCUSTO_MEDIO_CATEGORIA
FROM TB_PRODUTO

-- FUN��ES DE CLASSIFICA�AO

-- ROW_NUMBER: numera sem repetir (toda a tabela ou a "janela")
SELECT 
	NM_PRODUTO,
	ID_CATEGORIA,
	VL_PRECOVENDA,
	ROW_NUMBER() OVER (ORDER BY VL_PRECOVENDA) POSICAO_NA_TABELA,
	ROW_NUMBER() OVER (PARTITION BY ID_CATEGORIA ORDER BY VL_PRECOVENDA) POSICAO_DENTRO_CATEGORIA
INTO #TB_PRODUTO_CLASSIFICADO
FROM TB_PRODUTO
ORDER BY POSICAO_DENTRO_CATEGORIA

SELECT * FROM #TB_PRODUTO_CLASSIFICADO
WHERE POSICAO_DENTRO_CATEGORIA = 1

-- RANK E DENSE_RANK
SELECT 
	NM_PRODUTO,
	ID_CATEGORIA,
	VL_PRECOVENDA,
	ROW_NUMBER() OVER (ORDER BY VL_PRECOVENDA) POSICAO_NA_TABELA,
	RANK() OVER (ORDER BY VL_PRECOVENDA) POSICAO_NA_TABELA_COM_EMPATE_E_PULO,
	DENSE_RANK() OVER (ORDER BY VL_PRECOVENDA) POSICAO_NA_TABELA_COM_EMPATE_SEM_PULO
FROM TB_PRODUTO
ORDER BY VL_PRECOVENDA

-- NTILE
SELECT
	NM_PRODUTO,
	ID_CATEGORIA,
	VL_PRECOVENDA,
	NTILE(4) OVER (ORDER BY VL_PRECOVENDA) AS GRUPOS
FROM TB_PRODUTO
ORDER BY VL_PRECOVENDA