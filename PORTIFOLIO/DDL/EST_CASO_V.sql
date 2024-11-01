CREATE SCHEMA EC5_CC1M;

USE EC5_CC1M;

CREATE DATABASE IF NOT EXISTS EC5_CC1M;
USE EC5_CC1M;

-- Clientes
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR(200),
    telefone VARCHAR(15),
    fidelidade ENUM('Sim', 'Não') DEFAULT 'Não'
);

ALTER TABLE Clientes ADD TESTE TEXT;
ALTER TABLE Clientes DROP TESTE;

-- Produtos
CREATE TABLE Produtos (
    produto_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL
);

ALTER TABLE Produtos ADD TESTE TEXT;
ALTER TABLE Produtos DROP TESTE;

-- Fornecedores
CREATE TABLE Fornecedores (
    fornecedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(100),
    telefone VARCHAR(15)
);

ALTER TABLE Fornecedores ADD TESTE TEXT;
ALTER TABLE Fornecedores DROP TESTE;

-- Pagamentos
CREATE TABLE Pagamentos (
    pagamento_id INT PRIMARY KEY AUTO_INCREMENT,
    valor DECIMAL(10, 2) NOT NULL,
    data_pagamento DATE NOT NULL,
    status ENUM('Pago', 'Pendente') NOT NULL
);

ALTER TABLE Pagamentos ADD TESTE TEXT;
ALTER TABLE Pagamentos DROP TESTE;

-- Vendas
CREATE TABLE Vendas (
    venda_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    data_venda DATE NOT NULL,
    forma_pagamento ENUM('Dinheiro', 'Cartão', 'Pix', 'Boleto'),
    CONSTRAINT fk_venda_cliente FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

ALTER TABLE Vendas ADD TESTE TEXT;
ALTER TABLE Vendas DROP TESTE;

-- Relacionamento entre Produtos e Fornecedores (Produtos Fornecidos)
CREATE TABLE ProdutosFornecidos (
    produto_id INT NOT NULL,
    fornecedor_id INT NOT NULL,
    PRIMARY KEY (produto_id, fornecedor_id),
    CONSTRAINT fk_produtofornecido_produto FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id),
    CONSTRAINT fk_produtofornecido_fornecedor FOREIGN KEY (fornecedor_id) REFERENCES Fornecedores(fornecedor_id)
);

ALTER TABLE ProdutosFornecidos ADD TESTE TEXT;
ALTER TABLE ProdutosFornecidos DROP TESTE;

-- Relacionamento entre Vendas e Produtos (Produtos Vendidos)
CREATE TABLE ProdutosVendidos (
    venda_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (venda_id, produto_id),
    CONSTRAINT fk_produtovendido_venda FOREIGN KEY (venda_id) REFERENCES Vendas(venda_id),
    CONSTRAINT fk_produtovendido_produto FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);

ALTER TABLE ProdutosVendidos ADD TESTE TEXT;
ALTER TABLE ProdutosVendidos DROP TESTE;

-- Relacionamento entre Pagamentos e Vendas
ALTER TABLE Pagamentos
ADD venda_id INT NOT NULL,
ADD CONSTRAINT fk_pagamento_venda FOREIGN KEY (venda_id) REFERENCES Vendas(venda_id);

ALTER TABLE Pagamentos ADD TESTE TEXT;
ALTER TABLE Pagamentos DROP TESTE;

DROP SCHEMA EC5_CC1M;
