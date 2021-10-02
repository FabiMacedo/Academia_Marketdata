--LISTA DE EXERCÍCIOS SELECT Fabiana Macedo

--1. Coloque em uso o banco de dados DB_MADA_VAREJO
USE DB_MADA_VAREJO;

--2. Selecione todas as colunas de todas as tabelas (um select por tabela).
SELECT * FROM TB_CATEGORIA;
SELECT * FROM TB_CLIENTE;
SELECT * FROM TB_ENDERECO;
SELECT * FROM TB_ENDERECOCLIENTE;
SELECT * FROM TB_PRODUTO;
SELECT * FROM TB_VENDA;
SELECT * FROM TB_VENDAITEM;


--3. Selecione as colunas nome e email de todos os clientes.
SELECT NM_CLIENTE, DS_EMAIL FROM TB_CLIENTE;


/*4. Exiba todos os produtos com seu nome, código (não o utilize o ID), preço de venda,
preço de custo e calcule o lucro estimado de cada produto. Ordene os produtos pelo
valor do lucro estimado, trazendo primeiro os que terão maior lucro.*/SELECT
	NM_PRODUTO, 
	CD_PRODUTO, 
	VL_PRECOVENDA, 
	VL_PRECOCUSTO,
	VL_PRECOVENDA - VL_PRECOCUSTO AS VALOR_LUCRO
FROM TB_PRODUTO
ORDER BY VALOR_LUCRO DESC;


/*5. Exiba quais as cidades de São Paulo cadastradas nos endereços. Se a cidade possuir mais de um endereço, exibir uma única vez.*/
SELECT  DISTINCT 
	NM_CIDADE 
FROM TB_ENDERECO
WHERE NM_ESTADO = 'SP';


/*6. Exibir todos os dados das 5 vendas mais recentes que estão em transporte.*/
SELECT TOP 5 * FROM TB_VENDA
WHERE DS_STATUS = 'EM TRANSPORTE'
ORDER BY DT_VENDA DESC


/*7. Retornar os produtos com custo superior a R$1.000 que começaram a ser vendidos em 2021.*/
SELECT * FROM TB_PRODUTO 
WHERE VL_PRECOCUSTO > 1000 AND DT_INICIOVENDA BETWEEN '2021-01-01' AND '2021-12-31';


/*8. Exibir o nome das categorias que não possuem categorias superiores.*/
SELECT NM_CATEGORIA, ID_CATEGORIA_SUPERIOR FROM TB_CATEGORIA
WHERE ID_CATEGORIA_SUPERIOR IS NULL;


/*9. Exibir todos os dados dos produtos da marca multilaser*/
SELECT * FROM TB_PRODUTO
WHERE NM_PRODUTO LIKE '%multilaser%';


/*10.Selecionar as vendas de 2019 que foram canceladas e que tinham frete grátis.*/
SELECT DT_VENDA FROM TB_VENDA
WHERE DT_VENDA BETWEEN '2019-01-01' AND '2019-12-31' 
AND DS_STATUS = 'CANCELADO' AND VL_FRETE = 0;


/*11.Exibir os dados de todos os endereços que são avenidas do Sudeste*/
SELECT * FROM TB_ENDERECO
WHERE DS_ENDERECO LIKE 'Avenida%' 
AND NM_ESTADO IN ('SP', 'MG', 'RJ', 'ES');
