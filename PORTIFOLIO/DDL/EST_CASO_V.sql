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

