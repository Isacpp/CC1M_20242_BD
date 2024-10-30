#FASE 1: CRIAR O BANCO DE DADOS (SCHEMA OU DATABASE):
CREATE SCHEMA EC2_CC1M;

#FASE 2: SELECIONAR O NOVO SCHEMA OU DATABASE PARA USO:

USE EC2_CC1M;

# FASE 3: CRIANDO AS TABELAS SEM CHAVES ESTRANGEIRAS

#CRIANDO A TABELA PASSAGEIRO
CREATE TABLE IF NOT EXISTS PASSAGEIROS(
#NOMEDOATRIBUTO - TIPO - RESTRIÇÃO DE INTEGRIDADE(OPCIONAL)
PASS_CPF VARCHAR(14) PRIMARY KEY,
PASS_NOME VARCHAR(50) NOT NULL,
PASS_TELEFONE VARCHAR(20) NOT NULL,
PASS_RUA VARCHAR(50) NOT NULL,
PASS_NUMRUA INT,
PASS_BAIRRO VARCHAR(30) NOT NULL,
PASS_CIDADE VARCHAR(30) NOT NULL,
PASS_ESTADO VARCHAR(30) NOT NULL,
PASS_PAIS VARCHAR(50) NOT NULL,
PASS_EMAIL VARCHAR(50) NOT NULL
);

ALTER TABLE PASSAGEIROS ADD COLUMN TESTE TEXT;
ALTER TABLE PASSAGEIROS DROP COLUMN TESTE;

#CRIANDO A TABELA FUNCIONARIO
CREATE TABLE IF NOT EXISTS FUNCIONARIO(
FUNC_ID INT PRIMARY KEY,
FUNC_FUNCAO VARCHAR(30) NOT NULL,
FUNC_CPF VARCHAR(14) NOT NULL,
FUNC_RUA VARCHAR(50) NOT NULL,
FUNC_NUMRUA INT,
FUNC_BAIRRO VARCHAR(30) NOT NULL,
FUNC_CIDADE VARCHAR(30) NOT NULL,
FUNC_ESTADO VARCHAR(30) NOT NULL,
FUNC_PAIS VARCHAR(50) NOT NULL,
FUNC_DATANASC DATE NOT NULL,
FUNC_NOME VARCHAR(40)
);

ALTER TABLE FUNCIONARIO ADD COLUMN TESTE TEXT;
ALTER TABLE FUNCIONARIO DROP COLUMN TESTE;

#CRIANDO A TABELA AEROPORTOS
CREATE TABLE IF NOT EXISTS AEROPORTOS(
AEROP_ID INT PRIMARY KEY,
AEROP_LONGITUDE VARCHAR(50) NOT NULL,
AEROP_LATIDUDE VARCHAR(50) NOT NULL,
AEROP_PAIS VARCHAR(50) NOT NULL,
AEROP_CIDADE VARCHAR(50) NOT NULL,
AEROP_NOME VARCHAR(50) NOT NULL
);

ALTER TABLE AEROPORTOS ADD COLUMN TESTE TEXT;
ALTER TABLE AEROPORTOS DROP COLUMN TESTE;

#CRIANDO A TABELA AERONAVE
CREATE TABLE IF NOT EXISTS AERONAVE(
AERON_ID INT PRIMARY KEY,
AERON_PREFIXO VARCHAR(50) PRIMARY KEY,
AERON_FABRICANTE VARCHAR(50) NOT NULL,
AERON_CAPACIDADE INT NOT NULL,
AERON_AUTONOMIA VARCHAR(40) NOT NULL,
AERON_ANOFABR DATE NOT NULL,
AERON_MODELO VARCHAR(45) NOT NULL
);

ALTER TABLE AERONAVE ADD COLUMN TESTE TEXT;
ALTER TABLE AERONAVE DROP COLUMN TESTE;

#FASE 4: CRIAR AS TABELAS COM DEPENDÊNCIA DE CHAVE ESTRANGEIRA

#CRIANDO A TABELA VOOS
CREATE TABLE IF NOT EXISTS VOOS(
VOO_ID INT PRIMARY KEY,
VOO_DATA DATE NOT NULL,
VOO_HORA TIME NOT NULL,
VOO_AEROP_ORIGEM VARCHAR(45) NOT NULL,
VOO_AEROP_DESTINO VARCHAR(45) NOT NULL,
VOO_AERONAVE VARCHAR(50) NOT NULL,#NOSSA CHAVE ESTRANGEIRA DE FORNECEDOR
#CRIANDO A REFERENCIA PARA A CHAVE ESTRANGEIRA
#RESTRIÇÃO APELIDO CH.ESTRANGEIRA(CAMPO CRIADO) REFERENCIA TABELA(CH.PRIMÁRIA)
CONSTRAINT FK_AERONAVE FOREIGN KEY (VOO_AERONAVE)
REFERENCES AERONAVE(AERON_ID)
);

ALTER TABLE VOOS ADD COLUMN TESTE TEXT;
ALTER TABLE VOOS DROP COLUMN TESTE;

#CRIANDO A TABELA RESERVA
CREATE TABLE IF NOT EXISTS RESERVA(
RESERVA_ID INT PRIMARY KEY,
PASS_CPF VARCHAR(45) NOT NULL,
VOO_ID INT NOT NULL,
CONSTRAINT FK_PASSAGEIROS FOREIGN KEY (PASS_CPF) REFERENCES PASSAGEIROS(PASS_CPF),
CONSTRAINT FK_VOOS FOREIGN KEY (VOO_ID) REFERENCES VOOS(VOO_ID)
);

ALTER TABLE RESERVA ADD COLUMN TESTE TEXT;
ALTER TABLE RESERVA DROP COLUMN TESTE;

#FASE 5: CRIANDO AS TABELAS ASSOCIATIVAS (ENTIDADES ASSOCIATIVAS)
#CRIANDO A TABELA VOO_FUNCIONARIO
CREATE TABLE IF NOT EXISTS VOO_FUNCIONARIO(
VOO_ID INT,
FUNC_ID INT,
PRIMARY KEY(VOO_ID,FUNC_ID),
CONSTRAINT FK_VOOS FOREIGN KEY (VOO_ID) REFERENCES VOOS(VOO_ID),
CONSTRAINT FK_FUNCIONARIO FOREIGN KEY (FUNC_ID) REFERENCES FUNCIONARIO(FUNC_ID)
);

ALTER TABLE VOO_FUNCIONARIO ADD COLUMN TESTE TEXT;
ALTER TABLE VOO_FUNCIONARIO DROP COLUMN TESTE;

-- TESTE --

CREATE TABLE pessoas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    cidade VARCHAR(100)
);
DROP TABLE pessoas;

