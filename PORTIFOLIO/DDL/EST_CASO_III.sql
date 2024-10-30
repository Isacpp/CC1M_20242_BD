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
    RamoDeAtividade VARCHAR(50),
    DataDeCadastramento DATE,
    PessoaDeContato VARCHAR(100)
);

-- EMPREGADOS
CREATE TABLE IF NOT EXISTS EMPREGADOS (
    Matricula INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50),
    Salario DECIMAL(10, 2),
    DataDeAdmissao DATE,
    Endereco VARCHAR(150),
    Qualificacoes TEXT
);

-- EMPRESAS
CREATE TABLE IF NOT EXISTS EMPRESAS (
    CNPJ VARCHAR(20) PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    Endereco VARCHAR(150),
    PessoaDeContato VARCHAR(100)
);

-- FORNECEDORES
CREATE TABLE IF NOT EXISTS FORNECEDORES (
    CNPJ VARCHAR(20) PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    Endereco VARCHAR(150),
    PessoaDeContato VARCHAR(100)
);

-- TIPO DE ENDEREÇO
CREATE TABLE IF NOT EXISTS TIPO_DE_ENDERECO (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

-- PRODUTOS
CREATE TABLE IF NOT EXISTS PRODUTOS (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Cor VARCHAR(30),
    Dimensoes VARCHAR(50),
    Peso DECIMAL(10, 2),
    Preco DECIMAL(10, 2),
    TempoDeFabricacao DECIMAL(10, 2),
    DesenhoProduto TEXT,
    HorasDeMaoDeObra DECIMAL(10, 2)
);

-- TIPOS DE COMPONENTE
CREATE TABLE IF NOT EXISTS TIPOS_DE_COMPONENTE (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

-- MAQUINAS
CREATE TABLE IF NOT EXISTS MAQUINAS (
    Codigo INT PRIMARY KEY,
    TempoDeVida INT,
    DataDeCompra DATE,
    DataFimGarantia DATE
);
ALTER TABLE MAQUINAS ADD TESTE TEXT;
ALTER TABLE MAQUINAS DROP TESTE TEXT;

-- Tabelas com chave estrangeira
-- ENDEREÇOS
CREATE TABLE IF NOT EXISTS ENDERECOS (
    Codigo INT PRIMARY KEY,
    Numero VARCHAR(10),
    Logradouro VARCHAR(100),
    Complemento VARCHAR(50),
    CEP VARCHAR(20),
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    Estado VARCHAR(2),
    TipoDeEnderecoID INT,
    CONSTRAINT fk_tipo_endereco FOREIGN KEY (TipoDeEnderecoID) REFERENCES TIPO_DE_ENDERECO(Codigo)
);

-- ENCOMENDAS
CREATE TABLE IF NOT EXISTS ENCOMENDAS (
    Numero INT PRIMARY KEY,
    CodigoCliente INT,
    DataInclusao DATE,
    ValorTotal DECIMAL(10, 2),
    ValorDesconto DECIMAL(10, 2),
    ValorLiquido DECIMAL(10, 2),
    FormaPagamentoID INT,
    QuantidadeParcelas INT,
    CONSTRAINT fk_cliente_encomenda FOREIGN KEY (CodigoCliente) REFERENCES CLIENTES(Codigo)
);

-- COMPONENTES
CREATE TABLE IF NOT EXISTS COMPONENTES (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    QuantidadeEmEstoque INT,
    PrecoUnitario DECIMAL(10, 2),
    Unidade VARCHAR(20),
    TipoDeComponenteID INT,
    CONSTRAINT fk_tipo_componente FOREIGN KEY (TipoDeComponenteID) REFERENCES TIPOS_DE_COMPONENTE(Codigo)
);

-- RE (Recursos Específicos)
CREATE TABLE IF NOT EXISTS RECURSOS_ESPECIFICOS (
    Codigo INT PRIMARY KEY,
    QuantidadeNecessaria DECIMAL(10, 2),
    Unidade VARCHAR(20),
    TempoDeUso DECIMAL(10, 2),
    HorasDeMaoDeObra DECIMAL(10, 2),
    ProdutoID INT,
    CONSTRAINT fk_produto_recurso FOREIGN KEY (ProdutoID) REFERENCES PRODUTOS(Codigo)
);

-- RM (Registro de Manutenção)
CREATE TABLE IF NOT EXISTS REGISTRO_MANUTENCAO (
    Codigo INT PRIMARY KEY,
    Data DATE,
    Descricao TEXT,
    MaquinaID INT,
    CONSTRAINT fk_maquina_registro FOREIGN KEY (MaquinaID) REFERENCES MAQUINAS(Codigo)
);

-- RS (Registro de Suprimentos)
CREATE TABLE IF NOT EXISTS REGISTRO_SUPRIMENTOS (
    Codigo INT PRIMARY KEY,
    Quantidade INT,
    DataDeNecessidade DATE,
    ProdutoID INT,
    CONSTRAINT fk_produto_suprimento FOREIGN KEY (ProdutoID) REFERENCES PRODUTOS(Codigo)
);

-- Entidades associativas (para gerenciar atributos multivalorados e relacionamentos N:N)

-- TELEFONES_CLIENTES (telefones multivalorados para CLIENTES)
CREATE TABLE IF NOT EXISTS TELEFONES_CLIENTES (
    CodigoCliente INT,
    Telefone VARCHAR(20),
    CONSTRAINT fk_cliente_telefone FOREIGN KEY (CodigoCliente) REFERENCES CLIENTES(Codigo)
);

-- TELEFONES_EMPREGADOS (telefones multivalorados para EMPREGADOS)
CREATE TABLE IF NOT EXISTS TELEFONES_EMPREGADOS (
    Matricula INT,
    Telefone VARCHAR(20),
    CONSTRAINT fk_empregado_telefone FOREIGN KEY (Matricula) REFERENCES EMPREGADOS(Matricula)
);

-- TELEFONES_EMPRESAS (telefones multivalorados para EMPRESAS)
CREATE TABLE IF NOT EXISTS TELEFONES_EMPRESAS (
    CNPJ VARCHAR(20),
    Telefone VARCHAR(20),
    CONSTRAINT fk_empresa_telefone FOREIGN KEY (CNPJ) REFERENCES EMPRESAS(CNPJ)
);

-- TELEFONES_FORNECEDORES (telefones multivalorados para FORNECEDORES)
CREATE TABLE IF NOT EXISTS TELEFONES_FORNECEDORES (
    CNPJ VARCHAR(20),
    Telefone VARCHAR(20),
    CONSTRAINT fk_fornecedor_telefone FOREIGN KEY (CNPJ) REFERENCES FORNECEDORES(CNPJ)
);

-- FORNECEDORES_COMPONENTES (relacionamento N:N entre FORNECEDORES e COMPONENTES)
CREATE TABLE IF NOT EXISTS FORNECEDORES_COMPONENTES (
    CodigoFornecedor VARCHAR(20),
    CodigoComponente INT,
    CONSTRAINT fk_fornecedor_componente FOREIGN KEY (CodigoFornecedor) REFERENCES FORNECEDORES(CNPJ),
    CONSTRAINT fk_componente_fornecedor FOREIGN KEY (CodigoComponente) REFERENCES COMPONENTES(Codigo)
);

