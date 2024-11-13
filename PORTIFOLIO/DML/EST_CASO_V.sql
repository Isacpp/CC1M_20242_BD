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

-- Inserções
INSERT INTO Clientes (nome, cpf, data_nascimento, endereco, telefone, fidelidade) 
VALUES 
('Carlos Silva', '12345678901', '1990-01-01', 'Rua das Flores, 123', '(11) 98765-4321', 'Sim'),
('Maria Oliveira', '23456789012', '1992-02-15', 'Av. Paulista, 456', '(21) 91234-5678', 'Não'),
('João Souza', '34567890123', '1985-07-22', 'Rua Sol, 789', '(31) 93456-7890', 'Sim'),
('Ana Pereira', '45678901234', '1995-05-10', 'Rua da Paz, 101', '(41) 94567-8901', 'Não'),
('Lucas Santos', '56789012345', '1988-12-30', 'Rua das Acácias, 202', '(51) 95678-9012', 'Sim');

-- Atualizações
UPDATE Clientes 
SET endereco = 'Rua Nova, 456' 
WHERE cliente_id = 1;

UPDATE Clientes 
SET fidelidade = 'Sim' 
WHERE cliente_id = 2;

-- Exclusão
DELETE FROM Clientes WHERE cliente_id = 4;


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

-- Inserções
INSERT INTO Produtos (nome, categoria, preco, quantidade_estoque) 
VALUES 
('Produto A', 'Categoria 1', 50.00, 100),
('Produto B', 'Categoria 2', 120.00, 50),
('Produto C', 'Categoria 1', 30.00, 200),
('Produto D', 'Categoria 3', 80.00, 150),
('Produto E', 'Categoria 2', 200.00, 30);

-- Atualizações
UPDATE Produtos 
SET preco = 55.00 
WHERE produto_id = 1;

UPDATE Produtos 
SET quantidade_estoque = 180 
WHERE produto_id = 3;

-- Exclusão
DELETE FROM Produtos WHERE produto_id = 5;


-- Fornecedores
CREATE TABLE Fornecedores (
    fornecedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(100),
    telefone VARCHAR(15)
);

ALTER TABLE Fornecedores ADD TESTE TEXT;
ALTER TABLE Fornecedores DROP TESTE;

-- Inserções
INSERT INTO Fornecedores (nome, contato, telefone) 
VALUES 
('Fornecedor A', 'Contato A', '(11) 4002-8922'),
('Fornecedor B', 'Contato B', '(21) 5002-9922'),
('Fornecedor C', 'Contato C', '(31) 6002-9922'),
('Fornecedor D', 'Contato D', '(41) 7002-9922'),
('Fornecedor E', 'Contato E', '(51) 8002-9922');

-- Atualizações
UPDATE Fornecedores 
SET telefone = '(11) 9999-9999' 
WHERE fornecedor_id = 1;

UPDATE Fornecedores 
SET nome = 'Fornecedor B - Novo' 
WHERE fornecedor_id = 2;

-- Exclusão
DELETE FROM Fornecedores WHERE fornecedor_id = 5;


-- Pagamentos
CREATE TABLE Pagamentos (
    pagamento_id INT PRIMARY KEY AUTO_INCREMENT,
    valor DECIMAL(10, 2) NOT NULL,
    data_pagamento DATE NOT NULL,
    status ENUM('Pago', 'Pendente') NOT NULL
);

ALTER TABLE Pagamentos ADD TESTE TEXT;
ALTER TABLE Pagamentos DROP TESTE;

-- Inserções
INSERT INTO Pagamentos (valor, data_pagamento, status, venda_id) 
VALUES 
(500.00, '2024-01-01', 'Pago', 1),
(120.00, '2024-02-15', 'Pendente', 2),
(300.00, '2024-03-20', 'Pago', 3),
(200.00, '2024-04-10', 'Pendente', 4),
(450.00, '2024-05-05', 'Pago', 5);

-- Atualizações
UPDATE Pagamentos 
SET status = 'Pago' 
WHERE pagamento_id = 2;

UPDATE Pagamentos 
SET valor = 250.00 
WHERE pagamento_id = 4;

-- Exclusão
DELETE FROM Pagamentos WHERE pagamento_id = 5;


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

-- Inserções
INSERT INTO Vendas (cliente_id, data_venda, forma_pagamento) 
VALUES 
(1, '2024-01-01', 'Dinheiro'),
(2, '2024-02-15', 'Cartão'),
(3, '2024-03-20', 'Pix'),
(4, '2024-04-10', 'Boleto'),
(5, '2024-05-05', 'Dinheiro');

-- Atualizações
UPDATE Vendas 
SET forma_pagamento = 'Pix' 
WHERE venda_id = 1;

UPDATE Vendas 
SET cliente_id = 5 
WHERE venda_id = 3;

-- Exclusão
DELETE FROM Vendas WHERE venda_id = 4;


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

-- Inserções
INSERT INTO ProdutosFornecidos (produto_id, fornecedor_id) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(1, 5);

-- Atualizações
UPDATE ProdutosFornecidos 
SET fornecedor_id = 2 
WHERE produto_id = 1;

UPDATE ProdutosFornecidos 
SET produto_id = 3 
WHERE fornecedor_id = 5;

-- Exclusão
DELETE FROM ProdutosFornecidos WHERE produto_id = 4 AND fornecedor_id = 4;


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

-- Inserções
INSERT INTO ProdutosVendidos (venda_id, produto_id, quantidade) 
VALUES 
(1, 1, 2),
(2, 2, 1),
(3, 3, 5),
(4, 4, 3),
(5, 1, 4);

-- Atualizações
UPDATE ProdutosVendidos 
SET quantidade = 3 
WHERE venda_id = 1 AND produto_id = 1;

UPDATE ProdutosVendidos 
SET produto_id = 3 
WHERE venda_id = 2 AND produto_id = 2;

-- Exclusão
DELETE FROM ProdutosVendidos WHERE venda_id = 5 AND produto_id = 1;


-- Relacionamento entre Pagamentos e Vendas
ALTER TABLE Pagamentos
ADD venda_id INT NOT NULL,
ADD CONSTRAINT fk_pagamento_venda FOREIGN KEY (venda_id) REFERENCES Vendas(venda_id);

ALTER TABLE Pagamentos ADD TESTE TEXT;
ALTER TABLE Pagamentos DROP TESTE;

-- Inserções
-- (já feitos anteriormente nas tabelas `Pagamentos` e `Vendas` com o campo `venda_id`).

-- Atualizações
UPDATE Pagamentos 
SET venda_id = 3 
WHERE pagamento_id = 2;

UPDATE Pagamentos 
SET venda_id = 5 
WHERE pagamento_id = 4;

-- Exclusão
DELETE FROM Pagamentos WHERE pagamento_id = 2;


DROP SCHEMA EC5_CC1M;
