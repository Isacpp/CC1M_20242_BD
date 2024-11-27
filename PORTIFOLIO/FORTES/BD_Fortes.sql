-- Criação do banco de dados
CREATE DATABASE AppColaborativo;
USE AppColaborativo;

-- Tabela para armazenar informações de empresas
CREATE TABLE Empresas (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cnpj VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabela para armazenar informações de funcionários
CREATE TABLE Funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    empresa_id INT,
    FOREIGN KEY (empresa_id) REFERENCES Empresas(id_empresa),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabela para armazenar informações de colaboradores
CREATE TABLE Colaboradores (
    id_colaborador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabela para registrar doações realizadas pelas empresas
CREATE TABLE Doacoes (
    id_doacao INT AUTO_INCREMENT PRIMARY KEY,
    empresa_id INT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_doacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (empresa_id) REFERENCES Empresas(id_empresa)
);

-- Tabela para registrar feedbacks de projetos
CREATE TABLE Feedbacks (
    id_feedback INT AUTO_INCREMENT PRIMARY KEY,
    empresa_id INT,
    colaborador_id INT,
    comentario TEXT NOT NULL,
    nota INT CHECK (nota BETWEEN 1 AND 5),
    data_feedback DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (empresa_id) REFERENCES Empresas(id_empresa),
    FOREIGN KEY (colaborador_id) REFERENCES Colaboradores(id_colaborador)
);

-- Exemplo de tabela para projetos
CREATE TABLE Projetos (
    id_projeto INT AUTO_INCREMENT PRIMARY KEY,
    nome_projeto VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE
);

-- Tabela de associação entre empresas e projetos
CREATE TABLE Empresas_Projetos (
    empresa_id INT NOT NULL,
    projeto_id INT NOT NULL,
    PRIMARY KEY (empresa_id, projeto_id),
    FOREIGN KEY (empresa_id) REFERENCES Empresas(id_empresa),
    FOREIGN KEY (projeto_id) REFERENCES Projetos(id_projeto)
);

-- Exemplo de inserção de dados
INSERT INTO Empresas (nome, cnpj, email, senha) 
VALUES ('Empresa X', '12345678000199', 'contato@empresax.com', 'senha123');

INSERT INTO Funcionarios (nome, email, senha, empresa_id)
VALUES ('João Silva', 'joao@empresax.com', 'senha123', 1);

INSERT INTO Colaboradores (nome, email, senha)
VALUES ('Maria Santos', 'maria@colaborador.com', 'senha123');

INSERT INTO Doacoes (empresa_id, valor)
VALUES (1, 5000.00);

INSERT INTO Feedbacks (empresa_id, colaborador_id, comentario, nota)
VALUES (1, 1, 'Excelente iniciativa!', 5);
