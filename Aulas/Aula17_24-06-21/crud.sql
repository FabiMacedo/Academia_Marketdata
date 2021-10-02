-- INSERINDO DADOS TB_PRODUTO

INSERT INTO TB_PRODUTO 
(NM_PRODUTO, CD_PRODUTO, DS_COR, VL_PRECOCUSTO, VL_PRECOVENDA, 
VL_PESO, DT_INICIOVENDA, DT_FIMVENDA, ID_CATEGORIA, DS_ARQUIVOFOTO)
VALUES 
('Fritadeira Elétrica sem Óleo/Air Fryer Nell Smart - 2,4L com Timer', '2224789009876', 'Preta', 
449.90, 289.00, 4.400, '2021-06-01', '2021-06-10', 1, 'fritadeira_eletrica.jpg'), 

('Sofá Retrátil Reclinável 3 Lugares Suede Veludo', '1219362089876', 'Cinza', 
1372.00, 854.99, 30.000, '2021-06-03', '2021-06-09', 3, 'sofa.jpg'),

('Smartphone Samsung Galaxy S20 FE 128GB Cloud', '1556300009876', 'Branco', 
4999.00, 2199.60, 0.500,'2021-06-02', '2021-06-10', 2, 'smartphone.jpg'), 

('Notebook Acer Aspire 5 A515-54-57EN Intel Core i5', '9876500009876', 'Preto', 
 5999.00, 3656.55, 2.500, '2021-06-10', '2021-06-20', 4, 'notebook.jpg'),

 ('Smart TV Crystal UHD 4K LED 50” Samsung', '1234500009876', 'Preto', 
 3699.00, 2519.10, 10.500, '2021-06-15', '2021-06-20', 5, 'smart_tv.jpg');

-- INSERINDO DADOS TB_CATEGORIA
INSERT INTO TB_CATEGORIA (NM_CATEGORIA) VALUES
('Eletroportáteis'), ('Celulares'), ('Móveis'), ('Informática'), ('TV e Vídeo');

INSERT INTO TB_ENDERECOCLIENTE VALUES
('RESIDENCIAL'), ('COMERCIAL');

INSERT INTO TB_CLIENTE VALUES
('Samanta', 'sam@gmail.com', '11923456789'),
('Gustavo', 'gus@gmail.com', '11955555555'),
('Daniel', 'dani@gmail.com', '11777777777'),
('Rafaela', 'rafa@gmail.com', '1144444444'),
('Simone', 'simone@gmail.com', '1188888888')

INSERT INTO TB_ENDERECO VALUES
('Rua dos Bobos, 0', NULL, 'São Paulo', 'São Paulo', 'Brasil', '08583630'),
('Rua Sto Antônio, 876', 'Apto 34', 'Guarulhos', 'São Paulo', 'Brasil', '08583631'),
('Rua Jorge Amado, 842', NULL, 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil', '08583632'),
('Rua Treze de Maio, 1256', 'Casa', 'Curitiba', 'Paraná', 'Brasil', '08583633'),
('Rua Canto da Tarde, 55', 'Apto 51 A', 'São Paulo', 'São Paulo', 'Brasil', '08583634'),

--Correção do Gu
SELECT * FROM TB_CLIENTE;