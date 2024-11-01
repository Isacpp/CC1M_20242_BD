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
ALTER TABLE CLIENTES DROP COLUMN TESTE TEXT;

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
ALTER TABLE EMPREGADOS DROP COLUMN TESTE TEXT;

-- EMPRESAS
CREATE TABLE IF NOT EXISTS EMPRESAS (
    CNPJ VARCHAR(20) PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    Endereco VARCHAR(150) NOT NULL,
    PessoaDeContato VARCHAR(100)
);

ALTER TABLE EMPRESAS ADD COLUMN TESTE TEXT;
ALTER TABLE EMPRESAS DROP COLUMN TESTE TEXT;

-- FORNECEDORES
CREATE TABLE IF NOT EXISTS FORNECEDORES (
    CNPJ VARCHAR(20) PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    Endereco VARCHAR(150),
    PessoaDeContato VARCHAR(100)
);

ALTER TABLE FORNECEDORES ADD COLUMN TESTE TEXT;
ALTER TABLE FORNECEDORES DROP COLUMN TESTE TEXT;

-- TIPO DE ENDEREÇO
CREATE TABLE IF NOT EXISTS TIPO_DE_ENDERECO (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

ALTER TABLE TIPO_DE_ENDERECO ADD COLUMN TESTE TEXT;
ALTER TABLE TIPO_DE_ENDERECO DROP COLUMN TESTE TEXT;

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
ALTER TABLE PRODUTOS DROP COLUMN TESTE TEXT;

-- TIPOS DE COMPONENTE
CREATE TABLE IF NOT EXISTS TIPOS_DE_COMPONENTE (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

ALTER TABLE TIPOS_DE_COMPONENTE ADD COLUMN TESTE TEXT;
ALTER TABLE TIPOS_DE_COMPONENTE DROP COLUMN TESTE TEXT;

-- MAQUINAS
CREATE TABLE IF NOT EXISTS MAQUINAS (
    Codigo INT PRIMARY KEY,
    TempoDeVida INT NOT NULL,
    DataDeCompra DATE NOT NULL,
    DataFimGarantia DATE NOT NULL
);
ALTER TABLE MAQUINAS ADD COLUMN TESTE TEXT;
ALTER TABLE MAQUINAS DROP COLUMN TESTE TEXT;

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
ALTER TABLE ENDERECOS DROP COLUMN TESTE TEXT;

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
ALTER TABLE ENCOMENDAS DROP COLUMN TESTE TEXT;

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
ALTER TABLE COMPONENTES DROP COLUMN TESTE TEXT;

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
ALTER TABLE RECURSOS_ESPECIFICOS DROP COLUMN TESTE TEXT;

-- RM (Registro de Manutenção)
CREATE TABLE IF NOT EXISTS REGISTRO_MANUTENCAO (
    Codigo INT PRIMARY KEY,
    Data DATE NOT NULL,
    Descricao TEXT NOT NULL,
    MaquinaID INT NOT NULL,
    CONSTRAINT fk_maquina_registro FOREIGN KEY (MaquinaID) REFERENCES MAQUINAS(Codigo)
);

ALTER TABLE REGISTRO_MANUTENCAO ADD COLUMN TESTE TEXT;
ALTER TABLE REGISTRO_MANUTENCAO DROP COLUMN TESTE TEXT;

-- RS (Registro de Suprimentos)
CREATE TABLE IF NOT EXISTS REGISTRO_SUPRIMENTOS (
    Codigo INT PRIMARY KEY,
    Quantidade INT NOT NULL,
    DataDeNecessidade DATE NOT NULL,
    ProdutoID INT NOT NULL,
    CONSTRAINT fk_produto_suprimento FOREIGN KEY (ProdutoID) REFERENCES PRODUTOS(Codigo)
);

ALTER TABLE REGISTRO_SUPRIMENTOS ADD COLUMN TESTE TEXT;
ALTER TABLE REGISTRO_SUPRIMENTOS DROP COLUMN TESTE TEXT;

-- Entidades associativas (para gerenciar atributos multivalorados e relacionamentos N:N)

-- TELEFONES_CLIENTES (telefones multivalorados para CLIENTES)
CREATE TABLE IF NOT EXISTS TELEFONES_CLIENTES (
    CodigoCliente INT,
    Telefone VARCHAR(20),
    CONSTRAINT fk_cliente_telefone FOREIGN KEY (CodigoCliente) REFERENCES CLIENTES(Codigo)
);

ALTER TABLE TELEFONES_CLIENTES ADD COLUMN TESTE TEXT;
ALTER TABLE TELEFONES_CLIENTES DROP COLUMN TESTE TEXT;

-- TELEFONES_EMPREGADOS (telefones multivalorados para EMPREGADOS)
CREATE TABLE IF NOT EXISTS TELEFONES_EMPREGADOS (
    Matricula INT,
    Telefone VARCHAR(20),
    CONSTRAINT fk_empregado_telefone FOREIGN KEY (Matricula) REFERENCES EMPREGADOS(Matricula)
);

ALTER TABLE TELEFONES_EMPREGADOS ADD COLUMN TESTE TEXT;
ALTER TABLE TELEFONES_EMPREGADOS DROP COLUMN TESTE TEXT;

-- TELEFONES_EMPRESAS (telefones multivalorados para EMPRESAS)
CREATE TABLE IF NOT EXISTS TELEFONES_EMPRESAS (
    CNPJ VARCHAR(20),
    Telefone VARCHAR(20),
    CONSTRAINT fk_empresa_telefone FOREIGN KEY (CNPJ) REFERENCES EMPRESAS(CNPJ)
);

ALTER TABLE TELEFONES_EMPRESAS ADD COLUMN TESTE TEXT;
ALTER TABLE TELEFONES_EMPRESAS DROP COLUMN TESTE TEXT;

-- TELEFONES_FORNECEDORES (telefones multivalorados para FORNECEDORES)
CREATE TABLE IF NOT EXISTS TELEFONES_FORNECEDORES (
    CNPJ VARCHAR(20),
    Telefone VARCHAR(20),
    CONSTRAINT fk_fornecedor_telefone FOREIGN KEY (CNPJ) REFERENCES FORNECEDORES(CNPJ)
);

ALTER TABLE TELEFONES_FORNECEDORES ADD COLUMN TESTE TEXT;
ALTER TABLE TELEFONES_FORNECEDORES DROP COLUMN TESTE TEXT;

-- FORNECEDORES_COMPONENTES (relacionamento N:N entre FORNECEDORES e COMPONENTES)
CREATE TABLE IF NOT EXISTS FORNECEDORES_COMPONENTES (
    CodigoFornecedor VARCHAR(20),
    CodigoComponente INT,
    CONSTRAINT fk_fornecedor_componente FOREIGN KEY (CodigoFornecedor) REFERENCES FORNECEDORES(CNPJ),
    CONSTRAINT fk_componente_fornecedor FOREIGN KEY (CodigoComponente) REFERENCES COMPONENTES(Codigo)
);

ALTER TABLE FORNECEDORES_COMPONENTES ADD COLUMN TESTE TEXT;
ALTER TABLE FORNECEDORES_COMPONENTES DROP COLUMN TESTE TEXT;

