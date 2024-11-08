#FASE 1: CRIAR O BANCO DE DADOS (SCHEMA OU DATABASE):
#MEU PRIMEIRO BANQUINHO
#CREATE SCHEMA EC1_CC1M;

#FASE 2: SELECIONAR O NOVO SCHEMA OU DATABASE PARA USO:
#USANDO MEU BANQUINHO
USE EC1_CC1M;


# FASE 3: CRIANDO AS TABELAS SEM CHAVES ESTRANGEIRAS

#CRIANDO A TABELINHA FORNECEDORES
CREATE TABLE IF NOT EXISTS FORNECEDORES(
#NOMEDOATRIBUTO - TIPO - RESTRIÇÃO DE INTEGRIDADE(OPCIONAL)
FORNEC_COD INT PRIMARY KEY,
FORNEC_NOME VARCHAR(45) NOT NULL,
FORNEC_RUA VARCHAR(45) NOT NULL,
FORNEC_NUMRUA INT,
FORNEC_BAIRRO VARCHAR(45) NOT NULL,
FORNEC_CIDADE VARCHAR(45) NOT NULL,
FORNEC_ESTADO VARCHAR(45) NOT NULL,
FORNEC_PAIS VARCHAR(30) NOT NULL,
FORNEC_CODPOSTAL VARCHAR(10) NOT NULL,
FORNEC_TELEFONE VARCHAR(15) NOT NULL,
FORNEC_CONTATO TEXT NOT NULL
);

-- 5 INSERTs na tabela FORNECEDORES
INSERT INTO FORNECEDORES (FORNEC_COD, FORNEC_NOME, FORNEC_RUA, FORNEC_NUMRUA, FORNEC_BAIRRO, FORNEC_CIDADE, FORNEC_ESTADO, FORNEC_PAIS, FORNEC_CODPOSTAL, FORNEC_TELEFONE, FORNEC_CONTATO)
VALUES 
(1, 'Fornecedor A', 'Rua X', 123, 'Bairro Y', 'Cidade Z', 'Estado W', 'Brasil', '12345-678', '1234567890', 'Contato A'),
(2, 'Fornecedor B', 'Rua W', 456, 'Bairro X', 'Cidade Y', 'Estado Z', 'Brasil', '23456-789', '2345678901', 'Contato B'),
(3, 'Fornecedor C', 'Rua Z', 789, 'Bairro W', 'Cidade X', 'Estado Y', 'Brasil', '34567-890', '3456789012', 'Contato C'),
(4, 'Fornecedor D', 'Rua Y', 101, 'Bairro Z', 'Cidade W', 'Estado X', 'Brasil', '45678-901', '4567890123', 'Contato D'),
(5, 'Fornecedor E', 'Rua A', 202, 'Bairro Y', 'Cidade Z', 'Estado W', 'Brasil', '56789-012', '5678901234', 'Contato E');

-- 2 UPDATEs na tabela FORNECEDORES
UPDATE FORNECEDORES 
SET FORNEC_NOME = 'Fornecedor A Atualizado', FORNEC_TELEFONE = '1231231234'
WHERE FORNEC_COD = 1;

UPDATE FORNECEDORES 
SET FORNEC_BAIRRO = 'Bairro Alterado'
WHERE FORNEC_COD = 2;

-- 1 DELETE na tabela FORNECEDORES
DELETE FROM FORNECEDORES WHERE FORNEC_COD = 1;


#CRIANDO A TABELINHA FILIAIS
CREATE TABLE IF NOT EXISTS FILIAIS(
FILIAL_COD INT PRIMARY KEY,
FILIAL_NOME VARCHAR(45) NOT NULL,
FILIAL_RUA VARCHAR(100) NOT NULL,
FILIAL_NUMRUA INT,
FILIAL_BAIRRO VARCHAR(50) NOT NULL,
FILIAL_CIDADE VARCHAR(50) NOT NULL,
FILIAL_ESTADO VARCHAR(50) NOT NULL,
FILIAL_PAIS VARCHAR(50) NOT NULL,
FILIAL_CODPOSTAL VARCHAR(10) NOT NULL,
FILIAL_CAPACIDADE TEXT NOT NULL);

ALTER TABLE FILIAIS ADD TESTE TEXT;
ALTER TABLE FILIAIS DROP TESTE;

-- 5 INSERTs na tabela FILIAIS
INSERT INTO FILIAIS (FILIAL_COD, FILIAL_NOME, FILIAL_RUA, FILIAL_NUMRUA, FILIAL_BAIRRO, FILIAL_CIDADE, FILIAL_ESTADO, FILIAL_PAIS, FILIAL_CODPOSTAL, FILIAL_CAPACIDADE)
VALUES
(1, 'Filial A', 'Rua A', 101, 'Bairro A', 'Cidade A', 'Estado A', 'Brasil', '00001-000', 'Alta capacidade'),
(2, 'Filial B', 'Rua B', 202, 'Bairro B', 'Cidade B', 'Estado B', 'Brasil', '00002-000', 'Média capacidade'),
(3, 'Filial C', 'Rua C', 303, 'Bairro C', 'Cidade C', 'Estado C', 'Brasil', '00003-000', 'Baixa capacidade'),
(4, 'Filial D', 'Rua D', 404, 'Bairro D', 'Cidade D', 'Estado D', 'Brasil', '00004-000', 'Alta capacidade'),
(5, 'Filial E', 'Rua E', 505, 'Bairro E', 'Cidade E', 'Estado E', 'Brasil', '00005-000', 'Média capacidade');

-- 2 UPDATEs na tabela FILIAIS
UPDATE FILIAIS 
SET FILIAL_NOME = 'Filial A Atualizada'
WHERE FILIAL_COD = 1;

UPDATE FILIAIS 
SET FILIAL_CAPACIDADE = 'Capacidade Atualizada'
WHERE FILIAL_COD = 2;

-- 1 DELETE na tabela FILIAIS
DELETE FROM FILIAIS WHERE FILIAL_COD = 2;

#CRIANDO A TABELINHA PRODUTOS
CREATE TABLE IF NOT EXISTS PRODUTOS(
PROD_COD INT PRIMARY KEY,
PROD_NOME VARCHAR(50) NOT NULL,
PROD_DESCRICAO TEXT,
PROD_ESPECTEC TEXT,
PROD_QUANT DECIMAL(10,3) NOT NULL,
PROD_PRECOUNIT DECIMAL(10,2) NOT NULL,
PROD_UNIDMEDIDA VARCHAR(10) NOT NULL,
PROD_ESTOQ_MIN DECIMAL(10,3) NOT NULL
);

-- 5 INSERTs na tabela PRODUTOS
INSERT INTO PRODUTOS (PROD_COD, PROD_NOME, PROD_DESCRICAO, PROD_ESPECTEC, PROD_QUANT, PROD_PRECOUNIT, PROD_UNIDMEDIDA, PROD_ESTOQ_MIN)
VALUES 
(1, 'Produto A', 'Descrição A', 'Especificação A', 100, 50.00, 'Unidade', 10),
(2, 'Produto B', 'Descrição B', 'Especificação B', 150, 30.00, 'Unidade', 20),
(3, 'Produto C', 'Descrição C', 'Especificação C', 200, 20.00, 'Unidade', 15),
(4, 'Produto D', 'Descrição D', 'Especificação D', 250, 40.00, 'Unidade', 25),
(5, 'Produto E', 'Descrição E', 'Especificação E', 300, 10.00, 'Unidade', 5);

-- 2 UPDATEs na tabela PRODUTOS
UPDATE PRODUTOS 
SET PROD_PRECOUNIT = 60.00
WHERE PROD_COD = 1;

UPDATE PRODUTOS 
SET PROD_QUANT = 120
WHERE PROD_COD = 2;

-- 1 DELETE na tabela PRODUTOS
DELETE FROM PRODUTOS WHERE PROD_COD = 3;

#FASE 4: CRIAR AS TABELAS COM DEPENDÊNCIA DE CHAVE ESTRANGEIRA

#CRIANDO A TABELA PEDIDOS
CREATE TABLE IF NOT EXISTS PEDIDOS(
PED_CODIGO INT PRIMARY KEY,
PED_DATA DATE NOT NULL,
PED_HORA TIME NOT NULL,
PED_PREVISAO DATE NOT NULL,
PED_STATUS ENUM('PENDENTE','CONCLUÍDO','EM ESPERA'),
PED_FORNECEDOR INT NOT NULL, #NOSSA CHAVE ESTRANGEIRA DE FORNECEDOR
#CRIANDO A REFERENCIA PARA A CHAVE ESTRANGEIRA
#RESTRIÇÃO APELIDO CH.ESTRANGEIRA(CAMPO CRIADO) REFERENCIA TABELA(CH.PRIMÁRIA)
CONSTRAINT FK_FORNECEDOR FOREIGN KEY (PED_FORNECEDOR) #DAR NOME A RESTRIÇÃO(CONSTRAINT) É UMA BOA PRÁTICA
REFERENCES FORNECEDORES(FORNEC_COD) #REFERENCIA A CHAVE PRIMÁRIA DE FORNECEDORES
);

-- 5 INSERTs na tabela PEDIDOS
INSERT INTO PEDIDOS (PED_CODIGO, PED_DATA, PED_HORA, PED_PREVISAO, PED_STATUS, PED_FORNECEDOR)
VALUES 
(1, '2024-10-10', '10:00:00', '2024-10-15', 'PENDENTE', 1),
(2, '2024-10-11', '11:00:00', '2024-10-16', 'CONCLUÍDO', 2),
(3, '2024-10-12', '12:00:00', '2024-10-17', 'EM ESPERA', 3),
(4, '2024-10-13', '13:00:00', '2024-10-18', 'PENDENTE', 4),
(5, '2024-10-14', '14:00:00', '2024-10-19', 'CONCLUÍDO', 5);

-- 2 UPDATEs na tabela PEDIDOS
UPDATE PEDIDOS 
SET PED_STATUS = 'CONCLUÍDO'
WHERE PED_CODIGO = 3;

UPDATE PEDIDOS 
SET PED_PREVISAO = '2024-10-20'
WHERE PED_CODIGO = 4;

-- 1 DELETE na tabela PEDIDOS
DELETE FROM PEDIDOS WHERE PED_CODIGO = 4;

#CRIANDO A TABELA RECEBIMENTOS (VEIO DEPOIS POIS TEM DEPENDÊNCIA DE PEDIDOS)
CREATE TABLE IF NOT EXISTS RECEBIMENTOS(
RECEB_DATA DATE NOT NULL,
RECEB_HORA TIME NOT NULL,
RECEB_QUANT_PROD DECIMAL(10,3),
RECEB_CONDICAO TEXT NOT NULL,
RECEB_PEDIDOS INT PRIMARY KEY,
CONSTRAINT FK_PEDIDOS FOREIGN KEY(RECEB_PEDIDOS) REFERENCES PEDIDOS(PED_CODIGO));

-- 5 INSERTs na tabela RECEBIMENTOS
INSERT INTO RECEBIMENTOS (RECEB_DATA, RECEB_HORA, RECEB_QUANT_PROD, RECEB_CONDICAO, RECEB_PEDIDOS)
VALUES 
('2024-10-10', '15:00:00', 100, 'Recebido OK', 1),
('2024-10-11', '16:00:00', 150, 'Recebido OK', 2),
('2024-10-12', '17:00:00', 200, 'Recebido OK', 3),
('2024-10-13', '18:00:00', 250, 'Recebido OK', 4),
('2024-10-14', '19:00:00', 300, 'Recebido OK', 5);

-- 2 UPDATEs na tabela RECEBIMENTOS
UPDATE RECEBIMENTOS 
SET RECEB_QUANT_PROD = 110
WHERE RECEB_PEDIDOS = 1;

UPDATE RECEBIMENTOS 
SET RECEB_CONDICAO = 'Recebido em boas condições'
WHERE RECEB_PEDIDOS = 2;

-- 1 DELETE na tabela RECEBIMENTOS
DELETE FROM RECEBIMENTOS WHERE RECEB_PEDIDOS = 5;

#FASE 5: CRIANDO AS TABELAS ASSOCIATIVAS (ENTIDADES ASSOCIATIVAS)

#CRIANDO A TABELA PEDIDOS_PRODUTOS
CREATE TABLE IF NOT EXISTS PEDIDOS_PRODUTOS(
PDPR_PEDIDOS INT,
PDPR_PRODUTOS INT,
PRIMARY KEY(PDPR_PEDIDOS,PDPR_PRODUTOS),
PDPR_QUANT DECIMAL(10,3) NOT NULL,
CONSTRAINT PDPR_FK_PEDIDOS FOREIGN KEY(PDPR_PEDIDOS) REFERENCES PEDIDOS(PED_CODIGO),
CONSTRAINT PDPR_FK_PRODUTOS FOREIGN KEY(PDPR_PRODUTOS) REFERENCES PRODUTOS(PROD_COD)
);

INSERT INTO PEDIDOS_PRODUTOS (PDPR_PEDIDOS, PDPR_PRODUTOS, PDPR_QUANT)
VALUES 
(1, 1, 72.000),
(2, 2, 65.000),  
(3, 3, 54.000), 
(1, 2, 30.000),  
(2, 3, 15.000);  

UPDATE PEDIDOS_PRODUTOS
SET PDPR_QUANT = 80.000
WHERE PDPR_PEDIDOS = 1 AND PDPR_PRODUTOS = 1;

UPDATE PEDIDOS_PRODUTOS
SET PDPR_QUANT = 75.000
WHERE PDPR_PEDIDOS = 2 AND PDPR_PRODUTOS = 2;

DELETE FROM PEDIDOS_PRODUTOS 
WHERE PDPR_PEDIDOS = 3 AND PDPR_PRODUTOS = 3;

#CRIANDO A TABELA FILIAIS_PRODUTOS
CREATE TABLE IF NOT EXISTS FILIAIS_PRODUTOS(
FLPR_FILIAL INT,
FLPR_PRODUTOS INT,
PRIMARY KEY(FLPR_FILIAL,FLPR_PRODUTOS),
FLPR_QUANT DECIMAL(10,3) NOT NULL,
CONSTRAINT FLPR_FK_FILIAIS FOREIGN KEY(FLPR_FILIAL) REFERENCES FILIAIS(FILIAL_COD),
CONSTRAINT FLPR_FK_PRODUTOS FOREIGN KEY(FLPR_PRODUTOS) REFERENCES PRODUTOS(PROD_COD));

INSERT INTO FILIAIS_PRODUTOS (FLPR_FILIAL, FLPR_PRODUTOS, FLPR_QUANT)
VALUES 
(1, 1, 72.000),
(2, 2, 65.000),
(3, 3, 54.000),
(1, 2, 45.000),
(2, 3, 21.000);

UPDATE FILIAIS_PRODUTOS
SET FLPR_QUANT = 80.000
WHERE FLPR_FILIAL = 1 AND FLPR_PRODUTOS = 1;

UPDATE FILIAIS_PRODUTOS
SET FLPR_QUANT = 75.000
WHERE FLPR_FILIAL = 2 AND FLPR_PRODUTOS = 2;

DELETE FROM FILIAIS_PRODUTOS WHERE FLPR_FILIAL = 3 AND FLPR_PRODUTOS = 3;

#CRIAR A TABELA FORNECEDORES_PRODUTOS
CREATE TABLE IF NOT EXISTS FORNECEDORES_PRODUTOS(
FRPR_FORNECEDOR INT,
FRPR_PRODUTOS INT,
PRIMARY KEY(FRPR_FORNECEDOR,FRPR_PRODUTOS),
CONSTRAINT FRPR_FK_FORNECEDORES FOREIGN KEY(FRPR_FORNECEDOR)
REFERENCES FORNECEDORES(FORNEC_COD),
CONSTRAINT FRPR_FK_PRODUTOS FOREIGN KEY(FRPR_PRODUTOS) 
REFERENCES PRODUTOS(PROD_COD));

INSERT INTO FORNECEDORES_PRODUTOS (FRPR_FORNECEDOR, FRPR_PRODUTOS)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(1, 2),
(2, 3);

UPDATE FORNECEDORES_PRODUTOS
SET FRPR_FORNECEDOR = 4
WHERE FRPR_FORNECEDOR = 1 AND FRPR_PRODUTOS = 1;

UPDATE FORNECEDORES_PRODUTOS
SET FRPR_PRODUTOS = 4
WHERE FRPR_FORNECEDOR = 2 AND FRPR_PRODUTOS = 2;

DELETE FROM FORNECEDORES_PRODUTOS WHERE FRPR_FORNECEDOR = 3 AND FRPR_PRODUTOS = 3;


DROP SCHEMA EC1_CC1M;
