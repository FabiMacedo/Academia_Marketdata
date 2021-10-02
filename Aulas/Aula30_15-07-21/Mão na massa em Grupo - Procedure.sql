--M�o na massa em Grupo - Procedure
--Coloque seu BD em uso
USE fabiana


/*Crie uma procedure SP_COMPRAS no seu BD que:
	*Cria uma tabela TB_VENDAS com as vendas dos X �ltimos 
	dias (quantidade passada por par�metro)
	* Lembre-se de excluir a tabela, caso ela j� exista
     Execute a procedure com par�metro de 30 dias;
     Execute a procedure com par�metro de 60 dias;
     Execute a procedure com par�metro de 90 dias;*/  

CREATE PROCEDURE SP_COMPRAS @QTDE_DIAS_VENDAS INT
AS
BEGIN
	DROP TABLE IF EXISTS fabiana.TB_VENDAS

	SELECT *	
	INTO TB_VENDAS
	FROM DB_MADA_VAREJO..TB_VENDA
	WHERE DATEDIFF(DAY,DT_VENDA,GETDATE()) <= @QTDE_DIAS_VENDAS
END

select  * from TB_VENDAS
EXECUTE fabiana.DBO.SP_COMPRAS 30

EXECUTE fabiana.DBO.SP_COMPRAS 60

EXECUTE fabiana.DBO.SP_COMPRAS 90





