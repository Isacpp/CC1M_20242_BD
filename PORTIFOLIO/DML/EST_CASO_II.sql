#FASE 1: CRIAR O BANCO DE DADOS (SCHEMA OU DATABASE):
#MEU PRIMEIRO BANQUINHO
CREATE SCHEMA EC1_CC1M;

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

ALTER TABLE FORNECEDORES ADD COLUMN TESTE TEXT;
ALTER TABLE FORNECEDORES DROP COLUMN TESTE;

INSERT INTO FORNECEDORES (FORNEC_COD, FORNEC_NOME, FORNEC_RUA, FORNEC_NUMRUA, FORNEC_BAIRRO, FORNEC_CIDADE, FORNEC_ESTADO, FORNEC_PAIS, FORNEC_CODPOSTAL, FORNEC_TELEFONE, FORNEC_CONTATO)
VALUES 
(4, 'Fornecedor D', 'Rua das Oliveiras', 101, 'Centro', 'Cidade D', 'SP', 'Brasil', '04040404', '(11) 9876-5432', 'Contato D'),
(5, 'Fornecedor E', 'Rua das Mangueiras', 202, 'Bairro E', 'Cidade E', 'RJ', 'Brasil', '05050505', '(21) 8765-4321', 'Contato E'),
(6, 'Fornecedor F', 'Avenida Rio Branco', 303, 'Bairro F', 'Cidade F', 'MG', 'Brasil', '06060606', '(31) 7654-3210', 'Contato F'),
(7, 'Fornecedor G', 'Rua do Sol', 404, 'Centro', 'Cidade G', 'BA', 'Brasil', '07070707', '(71) 1234-4321', 'Contato G'),
(8, 'Fornecedor H', 'Avenida Paulista', 505, 'Bairro H', 'Cidade H', 'PR', 'Brasil', '08080808', '(41) 2345-6789', 'Contato H');

UPDATE FORNECEDORES
SET FORNEC_NOME = 'Fornecedor A Atualizado', FORNEC_CIDADE = 'Nova Cidade A'
WHERE FORNEC_COD = 1;

UPDATE FORNECEDORES
SET FORNEC_BAIRRO = 'Novo Bairro C', FORNEC_TELEFONE = '(31) 9876-5432'
WHERE FORNEC_COD = 3;

DELETE FROM FORNECEDORES WHERE FORNEC_COD = 8;

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

ALTER TABLE FILIAIS ADD COLUMN TESTE TEXT;
ALTER TABLE FILIAIS DROP COLUMN TESTE;

INSERT INTO FILIAIS (FILIAL_COD, FILIAL_NOME, FILIAL_RUA, FILIAL_NUMRUA, FILIAL_BAIRRO, FILIAL_CIDADE, FILIAL_ESTADO, FILIAL_PAIS, FILIAL_CODPOSTAL, FILIAL_CAPACIDADE)
VALUES 
(4, 'Filial D', 'Rua das Oliveiras', 411, 'Centro', 'Cidade D', 'SP', 'Brasil', '04040404', '80'),
(5, 'Filial E', 'Rua do Sol', 522, 'Bairro E', 'Cidade E', 'RJ', 'Brasil', '05050505', '90'),
(6, 'Filial F', 'Avenida Brasiliana', 633, 'Bairro F', 'Cidade F', 'MG', 'Brasil', '06060606', '100'),
(7, 'Filial G', 'Rua da Paz', 744, 'Centro', 'Cidade G', 'BA', 'Brasil', '07070707', '110'),
(8, 'Filial H', 'Avenida das Américas', 855, 'Bairro H', 'Cidade H', 'PR', 'Brasil', '08080808', '120');

UPDATE FILIAIS
SET FILIAL_NOME = 'Filial A Atualizada', FILIAL_CIDADE = 'Cidade A Alterada'
WHERE FILIAL_COD = 1;

UPDATE FILIAIS
SET FILIAL_CAPACIDADE = '95', FILIAL_ESTADO = 'MG'
WHERE FILIAL_COD = 2;

DELETE FROM FILIAIS WHERE FILIAL_COD = 8;

#CRIANDO A TABELINHA PRODUTOS
CREATE TABLE IF NOT EXISTS PRODUTOS(
PROD_COD INT PRIMARY KEY,
PROD_NOME VARCHAR(50) NOT NULL,
PROD_DESCRICAO TEXT NOT NULL,
PROD_ESPECTEC TEXT NOT NULL,
PROD_QUANT DECIMAL(10,3) NOT NULL,
PROD_PRECOUNIT DECIMAL(10,2) NOT NULL,
PROD_UNIDMEDIDA VARCHAR(10) NOT NULL,
PROD_ESTOQ_MIN DECIMAL(10,3) NOT NULL
);

ALTER TABLE PRODUTOS ADD COLUMN TESTE TEXT;
ALTER TABLE PRODUTOS DROP COLUMN TESTE;

INSERT INTO PRODUTOS (PROD_COD, PROD_NOME, PROD_DESCRICAO, PROD_ESPECTEC, PROD_QUANT, PROD_PRECOUNIT, PROD_UNIDMEDIDA, PROD_ESTOQ_MIN)
VALUES 
(4, 'Produto D', 'Descrição do Produto D', 'Especificação D', 200.000, 40.00, 'kg', 30.000),
(5, 'Produto E', 'Descrição do Produto E', 'Especificação E', 250.000, 50.00, 'kg', 40.000),
(6, 'Produto F', 'Descrição do Produto F', 'Especificação F', 300.000, 60.00, 'kg', 50.000),
(7, 'Produto G', 'Descrição do Produto G', 'Especificação G', 350.000, 70.00, 'kg', 60.000),
(8, 'Produto H', 'Descrição do Produto H', 'Especificação H', 400.000, 80.00, 'kg', 70.000);

UPDATE PRODUTOS
SET PROD_QUANT = 120.000, PROD_PRECOUNIT = 28.00
WHERE PROD_COD = 1;

UPDATE PRODUTOS
SET PROD_ESTOQ_MIN = 25.000, PROD_DESCRICAO = 'Nova descrição do Produto B'
WHERE PROD_COD = 2;

DELETE FROM PRODUTOS WHERE PROD_COD = 8;

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

ALTER TABLE PEDIDOS ADD COLUMN TESTE TEXT;
ALTER TABLE PEDIDOS DROP COLUMN TESTE;

INSERT INTO PEDIDOS (PED_CODIGO, PED_DATA, PED_HORA, PED_PREVISAO, PED_STATUS, PED_FORNECEDOR)
VALUES 
(4, '2024-11-04', '09:00', '2024-11-14', 'PENDENTE', 4),
(5, '2024-11-05', '10:30', '2024-11-16', 'CONCLUÍDO', 5),
(6, '2024-11-06', '14:45', '2024-11-17', 'EM ESPERA', 6),
(7, '2024-11-07', '08:00', '2024-11-18', 'PENDENTE', 7),
(8, '2024-11-08', '16:00', '2024-11-19', 'CONCLUÍDO', 8);

UPDATE PEDIDOS
SET PED_STATUS = 'CONCLUÍDO', PED_PREVISAO = '2024-11-11'
WHERE PED_CODIGO = 1;

UPDATE PEDIDOS
SET PED_DATA = '2024-11-10', PED_STATUS = 'EM ESPERA'
WHERE PED_CODIGO = 3;

DELETE FROM PEDIDOS WHERE PED_CODIGO = 8;

#CRIANDO A TABELA RECEBIMENTOS (VEIO DEPOIS POIS TEM DEPENDÊNCIA DE PEDIDOS)
CREATE TABLE IF NOT EXISTS RECEBIMENTOS(
RECEB_DATA DATE NOT NULL,
RECEB_HORA TIME NOT NULL,
RECEB_QUANT_PROD DECIMAL(10,3),
RECEB_CONDICAO TEXT NOT NULL,
RECEB_PEDIDOS INT PRIMARY KEY,
CONSTRAINT FK_PEDIDOS FOREIGN KEY(RECEB_PEDIDOS) REFERENCES PEDIDOS(PED_CODIGO));

ALTER TABLE RECEBIMENTOS ADD COLUMN TESTE TEXT;
ALTER TABLE RECEBIMENTOS DROP COLUMN TESTE;

INSERT INTO RECEBIMENTOS (RECEB_DATA, RECEB_HORA, RECEB_QUANT_PROD, RECEB_CONDICAO, RECEB_PEDIDOS)
VALUES 
('2024-11-04', '10:00', 40.000, 'Boa', 4),
('2024-11-05', '11:00', 90.000, 'Boa', 5),
('2024-11-06', '12:00', 70.000, 'Boa', 6),
('2024-11-07', '13:00', 80.000, 'Boa', 7),
('2024-11-08', '14:00', 100.000, 'Boa', 8);

UPDATE RECEBIMENTOS
SET RECEB_QUANT_PROD = 60.000, RECEB_CONDICAO = 'Excelente'
WHERE RECEB_PEDIDOS = 1;

UPDATE RECEBIMENTOS
SET RECEB_CONDICAO = 'Boa', RECEB_QUANT_PROD = 120.000
WHERE RECEB_PEDIDOS = 3;

DELETE FROM RECEBIMENTOS WHERE RECEB_PEDIDOS = 8;

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

ALTER TABLE PEDIDOS_PRODUTOS ADD COLUMN TESTE TEXT;
ALTER TABLE PEDIDOS_PRODUTOS DROP COLUMN TESTE;

INSERT INTO PEDIDOS_PRODUTOS (PDPR_PEDIDOS, PDPR_PRODUTOS, PDPR_QUANT)
VALUES 
(1, 1, 10.000),
(2, 2, 20.000),
(3, 3, 15.000),
(4, 4, 25.000),
(5, 5, 30.000);

UPDATE PEDIDOS_PRODUTOS
SET PDPR_QUANT = 12.000
WHERE PDPR_PEDIDOS = 1 AND PDPR_PRODUTOS = 1;

UPDATE PEDIDOS_PRODUTOS
SET PDPR_QUANT = 18.000
WHERE PDPR_PEDIDOS = 2 AND PDPR_PRODUTOS = 2;

DELETE FROM PEDIDOS_PRODUTOS WHERE PDPR_PEDIDOS = 3 AND PDPR_PRODUTOS = 3;

#CRIANDO A TABELA FILIAIS_PRODUTOS
CREATE TABLE IF NOT EXISTS FILIAIS_PRODUTOS(
FLPR_FILIAL INT,
FLPR_PRODUTOS INT,
PRIMARY KEY(FLPR_FILIAL,FLPR_PRODUTOS),
FLPR_QUANT DECIMAL(10,3) NOT NULL,
CONSTRAINT FILIAIS_PRODUTOSI FOREIGN KEY(FLPR_FILIAL) REFERENCES FILIAIS(FILIAL_COD),
CONSTRAINT FILIAIS_PRODUTOSII FOREIGN KEY(FLPR_PRODUTOS) REFERENCES PRODUTOS(PROD_COD));

ALTER TABLE FILIAIS_PRODUTOS ADD COLUMN TESTE TEXT;
ALTER TABLE FILIAIS_PRODUTOS DROP COLUMN TESTE;

INSERT INTO FILIAIS_PRODUTOS (FLPR_FILIAL, FLPR_PRODUTOS, FLPR_QUANT)
VALUES 
(1, 1, 50.000),
(2, 2, 100.000),
(3, 3, 75.000),
(4, 4, 60.000),
(5, 5, 80.000);

UPDATE FILIAIS_PRODUTOS
SET FLPR_QUANT = 55.000
WHERE FLPR_FILIAL = 1 AND FLPR_PRODUTOS = 1;

UPDATE FILIAIS_PRODUTOS
SET FLPR_QUANT = 85.000
WHERE FLPR_FILIAL = 2 AND FLPR_PRODUTOS = 2;

DELETE FROM FILIAIS_PRODUTOS WHERE FLPR_FILIAL = 3 AND FLPR_PRODUTOS = 3;

#CRIAR A TABELA FORNECEDORES_PRODUTOS
CREATE TABLE IF NOT EXISTS FORNECEDORES_PRODUTOS(
FRPR_FORNECEDOR INT,
FRPR_PRODUTOS INT,
PRIMARY KEY(FRPR_FORNECEDOR,FRPR_PRODUTOS),
CONSTRAINT FRPR_FK_FORNECEDORES FOREIGN KEY(FRPR_FORNECEDOR) REFERENCES FORNECEDORES(FORNEC_COD),
CONSTRAINT FRPR_FK_PRODUTOS FOREIGN KEY(FRPR_PRODUTOS) REFERENCES PRODUTOS(PROD_COD));

ALTER TABLE FORNECEDORES_PRODUTOS ADD COLUMN TESTE TEXT;
ALTER TABLE FORNECEDORES_PRODUTOS DROP COLUMN TESTE;

INSERT INTO FORNECEDORES_PRODUTOS (FRPR_FORNECEDOR, FRPR_PRODUTOS)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

UPDATE FORNECEDORES_PRODUTOS
SET FRPR_FORNECEDOR = 6
WHERE FRPR_FORNECEDOR = 1 AND FRPR_PRODUTOS = 1;

UPDATE FORNECEDORES_PRODUTOS
SET FRPR_PRODUTOS = 6
WHERE FRPR_FORNECEDOR = 2 AND FRPR_PRODUTOS = 2;

DELETE FROM FORNECEDORES_PRODUTOS WHERE FRPR_FORNECEDOR = 3 AND FRPR_PRODUTOS = 3;

DROP SCHEMA EC2_CC1M;
