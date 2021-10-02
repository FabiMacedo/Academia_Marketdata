--ATIVIDADE SUBQUERY
USE DB_MADA_VAREJO


--JUAN CORRIGIDO
SELECT * FROM TB_CLIENTEWHERE ID_CLIENTE IN (SELECT ID_CLIENTE FROM TB_VENDA					WHERE ID_VENDA IN	(SELECT ID_VENDA FROM TB_VENDAITEM										WHERE ID_PRODUTO IN (SELECT 																ID_PRODUTO															FROM TB_PRODUTO															WHERE NM_PRODUTO = 'Hd Seagate Externo Portatil Lacie 2tb Sthg2000400 -'															)										)					)AND ID_CLIENTE IN (SELECT ID_CLIENTE FROM TB_VENDA					WHERE  ID_VENDA IN		(SELECT ID_VENDA FROM TB_VENDAITEM										WHERE ID_PRODUTO IN (SELECT 																ID_PRODUTO															FROM TB_PRODUTO															WHERE NM_PRODUTO = 'Mesa de Cabeceira com Casinha para Cachorro Gato Pet - Branco - Ofertamo'															)										)					)
