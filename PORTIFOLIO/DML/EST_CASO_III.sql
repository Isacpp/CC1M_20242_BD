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

-- Inserindo 5 novos registros na tabela CLIENTES
INSERT INTO CLIENTES (Codigo, CNPJ, RazaoSocial, RamoDeAtividade, DataDeCadastramento, PessoaDeContato)
VALUES 
(4, '45.678.901/0001-55', 'Global Tech', 'Consultoria em TI', '2024-03-01', 'Ricardo Torres'),
(5, '56.789.012/0001-66', 'Future Enterprises', 'Engenharia de Software', '2024-04-01', 'Ana Pereira'),
(6, '67.890.123/0001-77', 'Tech Innovators', 'Desenvolvimento de Apps', '2024-05-10', 'Luiz Barbosa'),
(7, '78.901.234/0001-88', 'Innovative Systems', 'Inteligência Artificial', '2024-06-12', 'Pedro Santos'),
(8, '89.012.345/0001-99', 'Creative Solutions', 'Design de Software', '2024-07-15', 'Camila Costa');


UPDATE CLIENTES
SET RazaoSocial = 'Tech Solutions Internacional', RamoDeAtividade = 'Consultoria Global'
WHERE Codigo = 1;

UPDATE CLIENTES
SET PessoaDeContato = 'Mário Oliveira'
WHERE CNPJ = '23.456.789/0001-88';

DELETE FROM CLIENTES WHERE Codigo = 4;

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
(4, 'Carlos Pereira', 'Desenvolvedor Front-end', 3800.00, '2024-02-05', 'Rua D, 101, São Paulo', 'Técnico em Desenvolvimento de Sistemas'),
(5, 'Juliana Oliveira', 'Analista de Suporte', 3500.00, '2024-03-15', 'Avenida X, 200, Rio de Janeiro', 'Técnico em Redes de Computadores'),
(6, 'Renato Silva', 'Administrador de Banco de Dados', 6000.00, '2024-04-01', 'Rua Y, 150, Belo Horizonte', 'Bacharel em Sistemas de Informação'),
(7, 'Patricia Costa', 'Gerente de TI', 10000.00, '2024-05-10', 'Rua Z, 50, Porto Alegre', 'MBA em Gestão de TI'),
(8, 'Fábio Souza', 'Especialista em Segurança de TI', 7000.00, '2024-06-12', 'Rua W, 35, Recife', 'Certificação em Segurança da Informação');

UPDATE EMPREGADOS
SET Cargo = 'DBA Senior', Salario = 7500.00
WHERE Matricula = 6;

UPDATE EMPREGADOS
SET Salario = 8000.00
WHERE Matricula = 8;

DELETE FROM EMPREGADOS WHERE Matricula = 4;

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
('45.678.901/0001-11', 'Global Systems', 'Rua E, 101, São Paulo', 'Marcelo Andrade'),
('56.789.012/0001-22', 'Tech Innovations', 'Avenida F, 200, Rio de Janeiro', 'Roberta Martins'),
('67.890.123/0001-33', 'Creative Enterprises', 'Rua G, 150, Belo Horizonte', 'Juliano Costa'),
('78.901.234/0001-44', 'Innovative Works', 'Rua H, 200, Porto Alegre', 'Carla Almeida'),
('89.012.345/0001-55', 'Future Technologies', 'Avenida I, 50, Curitiba', 'Robson Souza');

UPDATE EMPRESAS
SET Endereco = 'Avenida B, 250, São Paulo', PessoaDeContato = 'Lucas Silva'
WHERE CNPJ = '23.456.789/0001-88';

UPDATE EMPRESAS
SET RazaoSocial = 'Tech Solutions Global', Endereco = 'Rua das Tecnologias, 300, São Paulo'
WHERE CNPJ = '12.345.678/0001-99';

DELETE FROM EMPRESAS WHERE CNPJ = '34.567.890/0001-77';

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
('12.345.678/0001-33', 'Supplier A', 'Rua I, 101, São Paulo', 'Ricardo Oliveira'),
('23.456.789/0001-44', 'Supplier B', 'Avenida J, 200, Rio de Janeiro', 'Fernanda Lima'),
('34.567.890/0001-55', 'Supplier C', 'Rua K, 150, Belo Horizonte', 'Gustavo Souza'),
('45.678.901/0001-66', 'Supplier D', 'Rua L, 250, Porto Alegre', 'Mônica Silva'),
('56.789.012/0001-77', 'Supplier E', 'Rua M, 300, Curitiba', 'Rafael Almeida');


UPDATE FORNECEDORES
SET PessoaDeContato = 'Ricardo Lima', Endereco = 'Rua das Indústrias, 400, São Paulo'
WHERE CNPJ = '12.345.678/0001-99';

UPDATE FORNECEDORES
SET Endereco = 'Avenida Nova, 300, Rio de Janeiro'
WHERE CNPJ = '23.456.789/0001-88';

DELETE FROM FORNECEDORES WHERE CNPJ = '34.567.890/0001-77';

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
(4, 'Produto D', 'Preto', '60x50x30', 3.0, 250.00, 12.00, 'Desenho D', 5.0),
(5, 'Produto E', 'Branco', '70x60x40', 3.5, 300.00, 15.00, 'Desenho E', 6.0),
(6, 'Produto F', 'Cinza', '80x70x50', 4.0, 350.00, 18.00, 'Desenho F', 7.0),
(7, 'Produto G', 'Azul Claro', '90x80x60', 4.5, 400.00, 20.00, 'Desenho G', 8.0),
(8, 'Produto H', 'Vermelho Claro', '100x90x70', 5.0, 450.00, 25.00, 'Desenho H', 9.0);

UPDATE PRODUTOS
SET Preco = 110.00, Dimensoes = '35x25x15'
WHERE Codigo = 1;

UPDATE PRODUTOS
SET Cor = 'Rosa', Preco = 180.00
WHERE Codigo = 2;

DELETE FROM PRODUTOS WHERE Codigo = 4;

-- TIPOS DE COMPONENTE
CREATE TABLE IF NOT EXISTS TIPOS_DE_COMPONENTE (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

ALTER TABLE TIPOS_DE_COMPONENTE ADD COLUMN TESTE TEXT;
ALTER TABLE TIPOS_DE_COMPONENTE DROP COLUMN TESTE;

INSERT INTO TIPOS_DE_COMPONENTE (Codigo, Nome) 
VALUES 
(4, 'Transistor'),
(5, 'Capacitor'),
(6, 'Indutor'),
(7, 'Diodo'),
(8, 'Fio');

UPDATE TIPOS_DE_COMPONENTE 
SET Nome = 'Resistor de Alta Potência' 
WHERE Codigo = 2;

UPDATE TIPOS_DE_COMPONENTE 
SET Nome = 'Chip de Alta Performance' 
WHERE Codigo = 1;

DELETE FROM TIPOS_DE_COMPONENTE WHERE Codigo = 8;


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
(4, 15, '2023-02-01', '2028-02-01'),
(5, 10, '2020-09-15', '2025-09-15'),
(6, 7, '2024-03-10', '2031-03-10'),
(7, 9, '2022-11-22', '2027-11-22'),
(8, 14, '2021-06-05', '2026-06-05');


UPDATE MAQUINAS 
SET TempoDeVida = 11, DataFimGarantia = '2026-12-12' 
WHERE Codigo = 5;

UPDATE MAQUINAS 
SET DataDeCompra = '2024-01-01' 
WHERE Codigo = 6;


DELETE FROM MAQUINAS WHERE Codigo = 8;


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
(4, '101', 'Rua do Lazer', 'Bloco B', '04040404', 'Jardim das Flores', 'Rio de Janeiro', 'RJ', 1),
(5, '202', 'Avenida Atlântica', 'Loja 305', '05050505', 'Centro', 'São Paulo', 'SP', 2),
(6, '303', 'Rua da Paz', 'Casa 3', '06060606', 'Vila Nova', 'Curitiba', 'PR', 1),
(7, '404', 'Rua das Águas', 'Sala 204', '07070707', 'Vila Mariana', 'São Paulo', 'SP', 2),
(8, '505', 'Avenida do Sol', 'Apto 701', '08080808', 'Centro', 'Rio de Janeiro', 'RJ', 2);


UPDATE ENDERECOS 
SET Bairro = 'Bela Vista' 
WHERE Codigo = 5;

UPDATE ENDERECOS 
SET Cidade = 'Porto Alegre' 
WHERE Codigo = 6;


DELETE FROM ENDERECOS WHERE Codigo = 8;


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
(4, 4, '2024-04-20', 1800.00, 150.00, 1650.00, 2, 4),
(5, 5, '2024-04-22', 2200.00, 200.00, 2000.00, 1, 3),
(6, 6, '2024-04-25', 3500.00, 300.00, 3200.00, 3, 6),
(7, 7, '2024-04-28', 5000.00, 400.00, 4600.00, 1, 5),
(8, 8, '2024-04-30', 4500.00, 350.00, 4150.00, 2, 2);


UPDATE ENCOMENDAS 
SET ValorLiquido = 1600.00 
WHERE Numero = 4;

UPDATE ENCOMENDAS 
SET FormaPagamentoID = 2 
WHERE Numero = 6;


DELETE FROM ENCOMENDAS WHERE Numero = 8;


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
(4, 'Componente D', 120, 45.00, 'Unidade', 1),
(5, 'Componente E', 80, 30.00, 'Unidade', 2),
(6, 'Componente F', 200, 60.00, 'Unidade', 3),
(7, 'Componente G', 50, 40.00, 'Unidade', 1),
(8, 'Componente H', 100, 70.00, 'Unidade', 2);


UPDATE COMPONENTES 
SET PrecoUnitario = 55.00 
WHERE Codigo = 5;

UPDATE COMPONENTES 
SET QuantidadeEmEstoque = 180 
WHERE Codigo = 6;


DELETE FROM COMPONENTES WHERE Codigo = 8;

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
(4, 25.00, 'Unidade', 12.00, 5.0, 1),
(5, 10.00, 'Unidade', 5.00, 2.0, 2),
(6, 30.00, 'Unidade', 15.00, 6.0, 3),
(7, 12.00, 'Unidade', 6.00, 2.5, 1),
(8, 20.00, 'Unidade', 10.00, 4.0, 2);


UPDATE RECURSOS_ESPECIFICOS 
SET QuantidadeNecessaria = 15.00 
WHERE Codigo = 5;

UPDATE RECURSOS_ESPECIFICOS 
SET TempoDeUso = 14.00 
WHERE Codigo = 6;


DELETE FROM RECURSOS_ESPECIFICOS WHERE Codigo = 8;


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
(4, '2024-06-01', 'Troca de motor', 1),
(5, '2024-06-05', 'Verificação de óleo', 2),
(6, '2024-06-10', 'Limpeza dos filtros', 3),
(7, '2024-06-15', 'Troca de correias', 1),
(8, '2024-06-20', 'Ajuste de calibragem', 2);


UPDATE REGISTRO_MANUTENCAO 
SET Descricao = 'Troca de peças e limpeza' 
WHERE Codigo = 5;

UPDATE REGISTRO_MANUTENCAO 
SET Data = '2024-06-12' 
WHERE Codigo = 6;


DELETE FROM REGISTRO_MANUTENCAO WHERE Codigo = 8;


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
(4, 30, '2024-07-01', 1),
(5, 25, '2024-07-05', 2),
(6, 40, '2024-07-10', 3),
(7, 60, '2024-07-15', 1),
(8, 50, '2024-07-20', 2);


UPDATE REGISTRO_SUPRIMENTOS 
SET Quantidade = 35 
WHERE Codigo = 5;

UPDATE REGISTRO_SUPRIMENTOS 
SET DataDeNecessidade = '2024-07-18' 
WHERE Codigo = 7;


DELETE FROM REGISTRO_SUPRIMENTOS WHERE Codigo = 8;


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
(4, '(11) 4567-1234'),
(5, '(21) 5678-2345'),
(6, '(31) 6789-3456'),
(7, '(41) 7890-4567'),
(8, '(51) 8901-5678');


UPDATE TELEFONES_CLIENTES 
SET Telefone = '(11) 9999-9999' 
WHERE CodigoCliente = 5;

UPDATE TELEFONES_CLIENTES 
SET Telefone = '(31) 2345-6789' 
WHERE CodigoCliente = 6;


DELETE FROM TELEFONES_CLIENTES WHERE CodigoCliente = 8;


-- TELEFONES_EMPREGADOS (telefones multivalorados para EMPREGADOS)
CREATE TABLE IF NOT EXISTS TELEFONES_EMPREGADOS (
    Matricula INT,
    Telefone VARCHAR(20),
    CONSTRAINT fk_empregado_telefone FOREIGN KEY (Matricula) REFERENCES EMPREGADOS(Matricula)
);

ALTER TABLE TELEFONES_EMPREGADOS ADD COLUMN TESTE TEXT;
ALTER TABLE TELEFONES_EMPREGADOS DROP COLUMN TESTE;


INSERT INTO TELEFONES_EMPREGADOS (Matricula, Telefone) 
VALUES 
(1, '(11) 1234-5678'),
(2, '(21) 2345-6789'),
(3, '(31) 3456-7890'),
(4, '(41) 4567-8901'),
(5, '(51) 5678-9012');


UPDATE TELEFONES_EMPREGADOS 
SET Telefone = '(11) 5555-5555' 
WHERE Matricula = 1;

UPDATE TELEFONES_EMPREGADOS 
SET Telefone = '(21) 6666-6666' 
WHERE Matricula = 2;


DELETE FROM TELEFONES_EMPREGADOS WHERE Matricula = 3;



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
('34.567.890/0001-77', '(31) 6002-9922'),
('45.678.901/0001-66', '(41) 7002-1122'),
('56.789.012/0001-55', '(51) 8002-2233');


UPDATE TELEFONES_EMPRESAS 
SET Telefone = '(11) 7777-7777' 
WHERE CNPJ = '12.345.678/0001-99';

UPDATE TELEFONES_EMPRESAS 
SET Telefone = '(31) 8888-8888' 
WHERE CNPJ = '34.567.890/0001-77';


DELETE FROM TELEFONES_EMPRESAS WHERE CNPJ = '56.789.012/0001-55';


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
('34.567.890/0001-77', '(31) 7777-7777'),
('45.678.901/0001-66', '(41) 6666-6666'),
('56.789.012/0001-55', '(51) 5555-5555');


UPDATE TELEFONES_FORNECEDORES 
SET Telefone = '(11) 9999-9999' 
WHERE CNPJ = '12.345.678/0001-99';

UPDATE TELEFONES_FORNECEDORES 
SET Telefone = '(21) 4444-4444' 
WHERE CNPJ = '23.456.789/0001-88';


DELETE FROM TELEFONES_FORNECEDORES WHERE CNPJ = '56.789.012/0001-55';


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
('34.567.890/0001-77', 3),
('45.678.901/0001-66', 4),
('56.789.012/0001-55', 5);


UPDATE FORNECEDORES_COMPONENTES 
SET CodigoComponente = 6 
WHERE CodigoFornecedor = '12.345.678/0001-99' AND CodigoComponente = 1;

UPDATE FORNECEDORES_COMPONENTES 
SET CodigoComponente = 7 
WHERE CodigoFornecedor = '23.456.789/0001-88' AND CodigoComponente = 2;


DELETE FROM FORNECEDORES_COMPONENTES WHERE CodigoFornecedor = '56.789.012/0001-55' AND CodigoComponente = 5;


DROP SCHEMA EC3_CC1M;
