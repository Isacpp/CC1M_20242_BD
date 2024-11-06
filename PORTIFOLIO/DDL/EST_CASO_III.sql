CREATE SCHEMA EC3_CC1M;

USE EC3_CC1M;


-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS TechSolutionDB;
USE TechSolutionDB;
-- Tabelas sem chave estrangeira
-- CLIENTES
CREATE TABLE IF NOT EXISTS CLIENTES (
    Codigo INT PRIMARY KEY,
    CNPJ VARCHAR(20) UNIQUE NOT NULL,
    RazaoSocial VARCHAR(100) NOT NULL,
    RamoDeAtividade VARCHAR(50) NOT NULL,
    DataDeCadastramento DATE NOT NULL,
    PessoaDeContato VARCHAR(100)
);

ALTER TABLE CLIENTES ADD COLUMN TESTE TEXT;
ALTER TABLE CLIENTES DROP COLUMN TESTE;

INSERT INTO CLIENTES (Codigo, CNPJ, RazaoSocial, RamoDeAtividade, DataDeCadastramento, PessoaDeContato)
VALUES 
(1, '12.345.678/0001-99', 'Tech Solutions LTDA', 'Tecnologia da Informação', '2024-01-15', 'João Silva'),
(2, '23.456.789/0001-88', 'Innovate Tech', 'Desenvolvimento de Software', '2023-12-10', 'Maria Oliveira'),
(3, '34.567.890/0001-77', 'NextGen Solutions', 'Consultoria Empresarial', '2024-02-20', 'Carlos Souza');

-- EMPREGADOS
CREATE TABLE IF NOT EXISTS EMPREGADOS (
    Matricula INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50) NOT NULL,
    Salario DECIMAL(10, 2) NOT NULL,
    DataDeAdmissao DATE NOT NULL,
    Endereco VARCHAR(150) NOT NULL,
    Qualificacoes TEXT NOT NULL
);

ALTER TABLE EMPREGADOS ADD COLUMN TESTE TEXT;
ALTER TABLE EMPREGADOS DROP COLUMN TESTE;

INSERT INTO EMPREGADOS (Matricula, Nome, Cargo, Salario, DataDeAdmissao, Endereco, Qualificacoes)
VALUES 
(1, 'Ana Costa', 'Desenvolvedora', 4500.00, '2023-06-01', 'Rua A, 123, São Paulo', 'Bacharel em Ciência da Computação'),
(2, 'Lucas Almeida', 'Analista de Sistemas', 4000.00, '2023-08-15', 'Avenida B, 456, Rio de Janeiro', 'Mestrado em Engenharia de Software'),
(3, 'Juliana Lima', 'Gerente de Projetos', 8000.00, '2022-09-10', 'Rua C, 789, Belo Horizonte', 'MBA em Gestão de TI');

-- EMPRESAS
CREATE TABLE IF NOT EXISTS EMPRESAS (
    CNPJ VARCHAR(20) PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    Endereco VARCHAR(150) NOT NULL,
    PessoaDeContato VARCHAR(100)
);

ALTER TABLE EMPRESAS ADD COLUMN TESTE TEXT;
ALTER TABLE EMPRESAS DROP COLUMN TESTE;

INSERT INTO EMPRESAS (CNPJ, RazaoSocial, Endereco, PessoaDeContato)
VALUES 
('12.345.678/0001-99', 'Tech Solutions LTDA', 'Rua das Empresas, 101, São Paulo', 'João Silva'),
('23.456.789/0001-88', 'Innovate Tech', 'Avenida Paulista, 456, São Paulo', 'Maria Oliveira'),
('34.567.890/0001-77', 'NextGen Solutions', 'Rua B, 123, Rio de Janeiro', 'Carlos Souza');

-- FORNECEDORES
CREATE TABLE IF NOT EXISTS FORNECEDORES (
    CNPJ VARCHAR(20) PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    Endereco VARCHAR(150),
    PessoaDeContato VARCHAR(100)
);

ALTER TABLE FORNECEDORES ADD COLUMN TESTE TEXT;
ALTER TABLE FORNECEDORES DROP COLUMN TESTE;

INSERT INTO FORNECEDORES (CNPJ, RazaoSocial, Endereco, PessoaDeContato)
VALUES 
('12.345.678/0001-99', 'Fornecedor A', 'Rua dos Fornecedores, 101, São Paulo', 'Ricardo Lima'),
('23.456.789/0001-88', 'Fornecedor B', 'Avenida Central, 202, Rio de Janeiro', 'Fernanda Costa'),
('34.567.890/0001-77', 'Fornecedor C', 'Rua Principal, 303, Belo Horizonte', 'Juliano Pereira');

-- TIPO DE ENDEREÇO
CREATE TABLE IF NOT EXISTS TIPO_DE_ENDERECO (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

ALTER TABLE TIPO_DE_ENDERECO ADD COLUMN TESTE TEXT;
ALTER TABLE TIPO_DE_ENDERECO DROP COLUMN TESTE;

INSERT INTO TIPO_DE_ENDERECO (Codigo, Nome)
VALUES 
(1, 'Residencial'),
(2, 'Comercial'),
(3, 'Industrial');

-- PRODUTOS
CREATE TABLE IF NOT EXISTS PRODUTOS (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Cor VARCHAR(30) NOT NULL,
    Dimensoes VARCHAR(50) NOT NULL,
    Peso DECIMAL(10, 2) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    TempoDeFabricacao DECIMAL(10, 2) NOT NULL,
    DesenhoProduto TEXT NOT NULL,
    HorasDeMaoDeObra DECIMAL(10, 2) NOT NULL
);

ALTER TABLE PRODUTOS ADD COLUMN TESTE TEXT;
ALTER TABLE PRODUTOS DROP COLUMN TESTE;

INSERT INTO PRODUTOS (Codigo, Nome, Cor, Dimensoes, Peso, Preco, TempoDeFabricacao, DesenhoProduto, HorasDeMaoDeObra)
VALUES 
(1, 'Produto A', 'Azul', '30x20x10', 1.5, 100.00, 5.00, 'Desenho A', 2.5),
(2, 'Produto B', 'Vermelho', '40x30x15', 2.0, 150.00, 8.00, 'Desenho B', 3.0),
(3, 'Produto C', 'Verde', '50x40x20', 2.5, 200.00, 10.00, 'Desenho C', 4.0);

-- TIPOS DE COMPONENTE
CREATE TABLE IF NOT EXISTS TIPOS_DE_COMPONENTE (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

ALTER TABLE TIPOS_DE_COMPONENTE ADD COLUMN TESTE TEXT;
ALTER TABLE TIPOS_DE_COMPONENTE DROP COLUMN TESTE;

INSERT INTO TIPOS_DE_COMPONENTE (Codigo, Nome)
VALUES 
(1, 'Chip'),
(2, 'Resistor'),
(3, 'Placa de Circuito');

-- MAQUINAS
CREATE TABLE IF NOT EXISTS MAQUINAS (
    Codigo INT PRIMARY KEY,
    TempoDeVida INT NOT NULL,
    DataDeCompra DATE NOT NULL,
    DataFimGarantia DATE NOT NULL
);
ALTER TABLE MAQUINAS ADD COLUMN TESTE TEXT;
ALTER TABLE MAQUINAS DROP COLUMN TESTE;

INSERT INTO MAQUINAS (Codigo, TempoDeVida, DataDeCompra, DataFimGarantia)
VALUES 
(1, 10, '2022-05-10', '2025-05-10'),
(2, 8, '2021-08-15', '2024-08-15'),
(3, 12, '2020-01-20', '2023-01-20');

-- Tabelas com chave estrangeira
-- ENDEREÇOS
CREATE TABLE IF NOT EXISTS ENDERECOS (
    Codigo INT PRIMARY KEY,
    Numero VARCHAR(10),
    Logradouro VARCHAR(100) NOT NULL,
    Complemento VARCHAR(50),
    CEP VARCHAR(20) NOT NULL,
    Bairro VARCHAR(50) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    Estado VARCHAR(2) NOT NULL,
    TipoDeEnderecoID INT NOT NULL,
    CONSTRAINT fk_tipo_endereco FOREIGN KEY (TipoDeEnderecoID) REFERENCES TIPO_DE_ENDERECO(Codigo)
);

ALTER TABLE ENDERECOS ADD COLUMN TESTE TEXT;
ALTER TABLE ENDERECOS DROP COLUMN TESTE;

INSERT INTO ENDERECOS (Codigo, Numero, Logradouro, Complemento, CEP, Bairro, Cidade, Estado, TipoDeEnderecoID)
VALUES 
(1, '123', 'Rua das Flores', 'Apto 101', '01010101', 'Centro', 'São Paulo', 'SP', 2),
(2, '456', 'Avenida Paulista', 'Sala 502', '02020202', 'Bela Vista', 'São Paulo', 'SP', 2),
(3, '789', 'Rua do Sol', 'Casa 10', '03030303', 'Jardim das Flores', 'Rio de Janeiro', 'RJ', 1);

-- ENCOMENDAS
CREATE TABLE IF NOT EXISTS ENCOMENDAS (
    Numero INT PRIMARY KEY,
    CodigoCliente INT NOT NULL,
    DataInclusao DATE NOT NULL,
    ValorTotal DECIMAL(10, 2) NOT NULL,
    ValorDesconto DECIMAL(10, 2) NOT NULL,
    ValorLiquido DECIMAL(10, 2) NOT NULL,
    FormaPagamentoID INT NOT NULL,
    QuantidadeParcelas INT,
    CONSTRAINT fk_cliente_encomenda FOREIGN KEY (CodigoCliente) REFERENCES CLIENTES(Codigo)
);

ALTER TABLE ENCOMENDAS ADD COLUMN TESTE TEXT;
ALTER TABLE ENCOMENDAS DROP COLUMN TESTE;

INSERT INTO ENCOMENDAS (Numero, CodigoCliente, DataInclusao, ValorTotal, ValorDesconto, ValorLiquido, FormaPagamentoID, QuantidadeParcelas)
VALUES 
(1, 1, '2024-04-10', 1500.00, 100.00, 1400.00, 1, 3),
(2, 2, '2024-04-12', 3000.00, 200.00, 2800.00, 2, 6),
(3, 3, '2024-04-15', 4500.00, 300.00, 4200.00, 1, 4);

-- COMPONENTES
CREATE TABLE IF NOT EXISTS COMPONENTES (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    QuantidadeEmEstoque INT,
    PrecoUnitario DECIMAL(10, 2) NOT NULL,
    Unidade VARCHAR(20) NOT NULL,
    TipoDeComponenteID INT NOT NULL,
    CONSTRAINT fk_tipo_componente FOREIGN KEY (TipoDeComponenteID) REFERENCES TIPOS_DE_COMPONENTE(Codigo)
);

ALTER TABLE COMPONENTES ADD COLUMN TESTE TEXT;
ALTER TABLE COMPONENTES DROP COLUMN TESTE;

INSERT INTO COMPONENTES (Codigo, Nome, QuantidadeEmEstoque, PrecoUnitario, Unidade, TipoDeComponenteID)
VALUES 
(1, 'Componente A', 100, 50.00, 'Unidade', 1),
(2, 'Componente B', 200, 25.00, 'Unidade', 2),
(3, 'Componente C', 150, 75.00, 'Unidade', 3);

-- RE (Recursos Específicos)
CREATE TABLE IF NOT EXISTS RECURSOS_ESPECIFICOS (
    Codigo INT PRIMARY KEY,
    QuantidadeNecessaria DECIMAL(10, 2) NOT NULL,
    Unidade VARCHAR(20) NOT NULL,
    TempoDeUso DECIMAL(10, 2) NOT NULL,
    HorasDeMaoDeObra DECIMAL(10, 2) NOT NULL,
    ProdutoID INT NOT NULL,
    CONSTRAINT fk_produto_recurso FOREIGN KEY (ProdutoID) REFERENCES PRODUTOS(Codigo)
);

ALTER TABLE RECURSOS_ESPECIFICOS ADD COLUMN TESTE TEXT;
ALTER TABLE RECURSOS_ESPECIFICOS DROP COLUMN TESTE;

INSERT INTO RECURSOS_ESPECIFICOS (Codigo, QuantidadeNecessaria, Unidade, TempoDeUso, HorasDeMaoDeObra, ProdutoID)
VALUES 
(1, 10.00, 'Unidade', 5.00, 2.5, 1),
(2, 15.00, 'Unidade', 8.00, 3.0, 2),
(3, 20.00, 'Unidade', 10.00, 4.0, 3);

-- RM (Registro de Manutenção)
CREATE TABLE IF NOT EXISTS REGISTRO_MANUTENCAO (
    Codigo INT PRIMARY KEY,
    Data DATE NOT NULL,
    Descricao TEXT NOT NULL,
    MaquinaID INT NOT NULL,
    CONSTRAINT fk_maquina_registro FOREIGN KEY (MaquinaID) REFERENCES MAQUINAS(Codigo)
);

ALTER TABLE REGISTRO_MANUTENCAO ADD COLUMN TESTE TEXT;
ALTER TABLE REGISTRO_MANUTENCAO DROP COLUMN TESTE;

INSERT INTO REGISTRO_MANUTENCAO (Codigo, Data, Descricao, MaquinaID)
VALUES 
(1, '2024-03-01', 'Troca de peças', 1),
(2, '2024-04-05', 'Manutenção preventiva', 2),
(3, '2024-05-10', 'Calibração', 3);

-- RS (Registro de Suprimentos)
CREATE TABLE IF NOT EXISTS REGISTRO_SUPRIMENTOS (
    Codigo INT PRIMARY KEY,
    Quantidade INT NOT NULL,
    DataDeNecessidade DATE NOT NULL,
    ProdutoID INT NOT NULL,
    CONSTRAINT fk_produto_suprimento FOREIGN KEY (ProdutoID) REFERENCES PRODUTOS(Codigo)
);

ALTER TABLE REGISTRO_SUPRIMENTOS ADD COLUMN TESTE TEXT;
ALTER TABLE REGISTRO_SUPRIMENTOS DROP COLUMN TESTE;

INSERT INTO REGISTRO_SUPRIMENTOS (Codigo, Quantidade, DataDeNecessidade, ProdutoID)
VALUES 
(1, 50, '2024-05-01', 1),
(2, 100, '2024-05-15', 2),
(3, 75, '2024-06-01', 3);

-- Entidades associativas (para gerenciar atributos multivalorados e relacionamentos N:N)

-- TELEFONES_CLIENTES (telefones multivalorados para CLIENTES)
CREATE TABLE IF NOT EXISTS TELEFONES_CLIENTES (
    CodigoCliente INT,
    Telefone VARCHAR(20),
    CONSTRAINT fk_cliente_telefone FOREIGN KEY (CodigoCliente) REFERENCES CLIENTES(Codigo)
);

ALTER TABLE TELEFONES_CLIENTES ADD COLUMN TESTE TEXT;
ALTER TABLE TELEFONES_CLIENTES DROP COLUMN TESTE;

INSERT INTO TELEFONES_CLIENTES (CodigoCliente, Telefone)
VALUES 
(1, '(11) 1234-5678'),
(2, '(21) 2345-6789'),
(3, '(31) 3456-7890');

-- TELEFONES_EMPREGADOS (telefones multivalorados para EMPREGADOS)
CREATE TABLE IF NOT EXISTS TELEFONES_EMPREGADOS (
    Matricula INT,
    Telefone VARCHAR(20),
    CONSTRAINT fk_empregado_telefone FOREIGN KEY (Matricula) REFERENCES EMPREGADOS(Matricula)
);

ALTER TABLE TELEFONES_EMPREGADOS ADD COLUMN TESTE TEXT;
ALTER TABLE TELEFONES_EMPREGADOS DROP COLUMN TESTE;

-- TELEFONES_EMPRESAS (telefones multivalorados para EMPRESAS)
CREATE TABLE IF NOT EXISTS TELEFONES_EMPRESAS (
    CNPJ VARCHAR(20),
    Telefone VARCHAR(20),
    CONSTRAINT fk_empresa_telefone FOREIGN KEY (CNPJ) REFERENCES EMPRESAS(CNPJ)
);

ALTER TABLE TELEFONES_EMPRESAS ADD COLUMN TESTE TEXT;
ALTER TABLE TELEFONES_EMPRESAS DROP COLUMN TESTE;

INSERT INTO TELEFONES_EMPRESAS (CNPJ, Telefone)
VALUES 
('12.345.678/0001-99', '(11) 4002-8922'),
('23.456.789/0001-88', '(21) 5002-9922'),
('34.567.890/0001-77', '(31) 6002-9922');

-- TELEFONES_FORNECEDORES (telefones multivalorados para FORNECEDORES)
CREATE TABLE IF NOT EXISTS TELEFONES_FORNECEDORES (
    CNPJ VARCHAR(20),
    Telefone VARCHAR(20),
    CONSTRAINT fk_fornecedor_telefone FOREIGN KEY (CNPJ) REFERENCES FORNECEDORES(CNPJ)
);

ALTER TABLE TELEFONES_FORNECEDORES ADD COLUMN TESTE TEXT;
ALTER TABLE TELEFONES_FORNECEDORES DROP COLUMN TESTE;

INSERT INTO TELEFONES_FORNECEDORES (CNPJ, Telefone)
VALUES 
('12.345.678/0001-99', '(11) 8888-8888'),
('23.456.789/0001-88', '(21) 9999-9999'),
('34.567.890/0001-77', '(31) 7777-7777');

-- FORNECEDORES_COMPONENTES (relacionamento N:N entre FORNECEDORES e COMPONENTES)
CREATE TABLE IF NOT EXISTS FORNECEDORES_COMPONENTES (
    CodigoFornecedor VARCHAR(20),
    CodigoComponente INT,
    CONSTRAINT fk_fornecedor_componente FOREIGN KEY (CodigoFornecedor) REFERENCES FORNECEDORES(CNPJ),
    CONSTRAINT fk_componente_fornecedor FOREIGN KEY (CodigoComponente) REFERENCES COMPONENTES(Codigo)
);

ALTER TABLE FORNECEDORES_COMPONENTES ADD COLUMN TESTE TEXT;
ALTER TABLE FORNECEDORES_COMPONENTES DROP COLUMN TESTE;

INSERT INTO FORNECEDORES_COMPONENTES (CodigoFornecedor, CodigoComponente)
VALUES 
('12.345.678/0001-99', 1),
('23.456.789/0001-88', 2),
('34.567.890/0001-77', 3);

DROP SCHEMA EC3_CC1M;
