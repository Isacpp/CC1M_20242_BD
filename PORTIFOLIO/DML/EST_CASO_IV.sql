CREATE SCHEMA EC4_CC1M;

USE EC4_CC1M;

CREATE DATABASE IF NOT EXISTS EC4_CC1M;
USE EC4_CC1M;

-- Alunos
CREATE TABLE IF NOT EXISTS Alunos (
    aluno_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(15)
);

ALTER TABLE Alunos ADD TESTE TEXT;
ALTER TABLE Alunos DROP TESTE;

-- Inserções
INSERT INTO Alunos (aluno_id, nome, cpf, data_nascimento, endereco, telefone) 
VALUES 
(1, 'Carlos Silva', '12345678901', '1995-03-15', 'Rua das Flores, 123', '(11) 98765-4321'),
(2, 'Maria Oliveira', '23456789012', '1998-06-22', 'Av. Paulista, 456', '(21) 91234-5678'),
(3, 'João Souza', '34567890123', '2000-09-10', 'Rua Sol, 789', '(31) 93456-7890'),
(4, 'Ana Pereira', '45678901234', '1997-12-30', 'Rua da Paz, 101', '(41) 94567-8901'),
(5, 'Lucas Santos', '56789012345', '1996-05-20', 'Rua das Acácias, 202', '(51) 95678-9012');

-- Atualizações
UPDATE Alunos 
SET endereco = 'Rua das Palmeiras, 100' 
WHERE aluno_id = 1;

UPDATE Alunos 
SET telefone = '(21) 92222-2222' 
WHERE aluno_id = 2;

-- Exclusão
DELETE FROM Alunos WHERE aluno_id = 3;

-- Instrutores
CREATE TABLE IF NOT EXISTS Instrutores (
    instrutor_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    data_contratacao DATE NOT NULL,
    especialidade VARCHAR(100)
);

ALTER TABLE Instrutores ADD TESTE TEXT;
ALTER TABLE Instrutores DROP TESTE;

-- Inserções
INSERT INTO Instrutores (instrutor_id, nome, cpf, data_contratacao, especialidade) 
VALUES 
(1, 'Roberto Lima', '78901234567', '2015-02-25', 'Musculação'),
(2, 'Patrícia Costa', '89012345678', '2017-07-13', 'Yoga'),
(3, 'Fernanda Alves', '90123456789', '2016-05-19', 'Pilates'),
(4, 'Carlos Martins', '01234567890', '2019-03-10', 'Boxe'),
(5, 'Juliana Silva', '12345678901', '2020-08-21', 'Dança');

-- Atualizações
UPDATE Instrutores 
SET especialidade = 'CrossFit' 
WHERE instrutor_id = 4;

UPDATE Instrutores 
SET nome = 'Patrícia Oliveira' 
WHERE instrutor_id = 2;

-- Exclusão
DELETE FROM Instrutores WHERE instrutor_id = 5;


-- Modalidades
CREATE TABLE IF NOT EXISTS Modalidades (
    modalidade_id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);

ALTER TABLE Modalidades ADD TESTE TEXT;
ALTER TABLE Modalidades DROP TESTE;

-- Inserções
INSERT INTO Modalidades (modalidade_id, nome, descricao) 
VALUES 
(1, 'Musculação', 'Treinamento de força e resistência muscular.'),
(2, 'Yoga', 'Práticas físicas e mentais para flexibilidade e equilíbrio.'),
(3, 'Pilates', 'Exercícios para fortalecimento do core e flexibilidade.'),
(4, 'Boxe', 'Treinamento de boxe para condicionamento físico e defesa pessoal.'),
(5, 'Dança', 'Aulas de dança para expressão corporal e ritmo.');

-- Atualizações
UPDATE Modalidades 
SET descricao = 'Treinamento de força muscular e resistência.' 
WHERE modalidade_id = 1;

UPDATE Modalidades 
SET nome = 'Zumba' 
WHERE modalidade_id = 5;

-- Exclusão
DELETE FROM Modalidades WHERE modalidade_id = 3;

-- Aulas
CREATE TABLE IF NOT EXISTS Aulas (
    aula_id INT PRIMARY KEY,
    horario TIME NOT NULL,
    capacidade INT NOT NULL
);

ALTER TABLE Aulas ADD TESTE TEXT;
ALTER TABLE Aulas DROP TESTE;

-- Inserções
INSERT INTO Aulas (aula_id, horario, capacidade) 
VALUES 
(1, '08:00:00', 20),
(2, '10:00:00', 15),
(3, '14:00:00', 25),
(4, '16:00:00', 10),
(5, '18:00:00', 30);

-- Atualizações
UPDATE Aulas 
SET capacidade = 18 
WHERE aula_id = 1;

UPDATE Aulas 
SET horario = '15:00:00' 
WHERE aula_id = 2;

-- Exclusão
DELETE FROM Aulas WHERE aula_id = 4;

-- Pagamentos
CREATE TABLE IF NOT EXISTS Pagamentos (
    pagamento_id INT PRIMARY KEY,
    aluno_id INT,
    data_pagamento DATE,
    valor DECIMAL(10, 2),
    status ENUM('Pago', 'Pendente') NOT NULL
);

ALTER TABLE Pagamentos ADD TESTE TEXT;
ALTER TABLE Pagamentos DROP TESTE;

-- Inserções
INSERT INTO Pagamentos (pagamento_id, aluno_id, data_pagamento, valor, status) 
VALUES 
(1, 1, '2024-01-15', 150.00, 'Pago'),
(2, 2, '2024-02-20', 200.00, 'Pendente'),
(3, 3, '2024-03-25', 180.00, 'Pago'),
(4, 4, '2024-04-10', 220.00, 'Pendente'),
(5, 5, '2024-05-05', 160.00, 'Pago');

-- Atualizações
UPDATE Pagamentos 
SET status = 'Pago' 
WHERE pagamento_id = 2;

UPDATE Pagamentos 
SET valor = 210.00 
WHERE pagamento_id = 4;

-- Exclusão
DELETE FROM Pagamentos WHERE pagamento_id = 5;


-- Planos de Treinamento
CREATE TABLE IF NOT EXISTS PlanosTreinamento (
    plano_id INT PRIMARY KEY,
    aluno_id INT NOT NULL,
    instrutor_id INT NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE,
    CONSTRAINT fk_planotreinamento_aluno FOREIGN KEY (aluno_id) REFERENCES Alunos(aluno_id),
    CONSTRAINT fk_planotreinamento_instrutor FOREIGN KEY (instrutor_id) REFERENCES Instrutores(instrutor_id)
);

ALTER TABLE PlanosTreinamento ADD TESTE TEXT;
ALTER TABLE PlanosTreinamento DROP TESTE;

-- Inserções
INSERT INTO PlanosTreinamento (plano_id, aluno_id, instrutor_id, descricao, data_inicio, data_fim) 
VALUES 
(1, 1, 1, 'Plano de musculação para ganho de massa muscular.', '2024-01-15', '2024-12-15'),
(2, 2, 2, 'Plano de Yoga para aumento de flexibilidade.', '2024-02-20', '2024-08-20'),
(3, 3, 3, 'Plano de Pilates para fortalecimento do core.', '2024-03-10', '2024-09-10'),
(4, 4, 4, 'Plano de Boxe para defesa pessoal e condicionamento físico.', '2024-04-01', '2024-10-01'),
(5, 5, 5, 'Plano de Dança para expressão corporal e ritmo.', '2024-05-01', '2024-11-01');

-- Atualizações
UPDATE PlanosTreinamento 
SET descricao = 'Plano de musculação para emagrecimento e definição.' 
WHERE plano_id = 1;

UPDATE PlanosTreinamento 
SET data_fim = '2024-09-30' 
WHERE plano_id = 3;

-- Exclusão
DELETE FROM PlanosTreinamento WHERE plano_id = 4;


-- Relacionamento entre Aluno e Modalidade (Matriculas)
CREATE TABLE IF NOT EXISTS Matriculas (
    matricula_id INT PRIMARY KEY,
    aluno_id INT NOT NULL,
    modalidade_id INT NOT NULL,
    data_matricula DATE,
    CONSTRAINT fk_matricula_aluno FOREIGN KEY (aluno_id) REFERENCES Alunos(aluno_id),
    CONSTRAINT fk_matricula_modalidade FOREIGN KEY (modalidade_id) REFERENCES Modalidades(modalidade_id)
);

ALTER TABLE Matriculas ADD TESTE TEXT;
ALTER TABLE Matriculas DROP TESTE;

-- Inserções
INSERT INTO Matriculas (matricula_id, aluno_id, modalidade_id, data_matricula) 
VALUES 
(1, 1, 1, '2024-01-15'),
(2, 2, 2, '2024-02-20'),
(3, 3, 3, '2024-03-10'),
(4, 4, 4, '2024-04-01'),
(5, 5, 5, '2024-05-01');

-- Atualizações
UPDATE Matriculas 
SET data_matricula = '2024-02-15' 
WHERE matricula_id = 2;

UPDATE Matriculas 
SET aluno_id = 5 
WHERE matricula_id = 3;

-- Exclusão
DELETE FROM Matriculas WHERE matricula_id = 4;


-- Relacionamento entre Instrutor e Modalidade
CREATE TABLE IF NOT EXISTS InstrutorModalidade (
    instrutor_id INT NOT NULL,
    modalidade_id INT NOT NULL,
    PRIMARY KEY (instrutor_id, modalidade_id),
    CONSTRAINT fk_instrutormodalidade_instrutor FOREIGN KEY (instrutor_id) REFERENCES Instrutores(instrutor_id),
    CONSTRAINT fk_instrutormodalidade_modalidade FOREIGN KEY (modalidade_id) REFERENCES Modalidades(modalidade_id)
);

ALTER TABLE InstrutorModalidade ADD TESTE TEXT;
ALTER TABLE InstrutorModalidade DROP TESTE;

-- Inserções
INSERT INTO InstrutorModalidade (instrutor_id, modalidade_id) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Atualizações
UPDATE InstrutorModalidade 
SET modalidade_id = 2 
WHERE instrutor_id = 1;

UPDATE InstrutorModalidade 
SET instrutor_id = 4 
WHERE modalidade_id = 5;

-- Exclusão
DELETE FROM InstrutorModalidade WHERE instrutor_id = 5 AND modalidade_id = 5;


-- Relacionamento entre Aulas e Modalidades
CREATE TABLE IF NOT EXISTS AulaModalidade (
    aula_id INT NOT NULL,
    modalidade_id INT NOT NULL,
    instrutor_id INT NOT NULL,
    PRIMARY KEY (aula_id, modalidade_id),
    CONSTRAINT fk_aulamodalidade_aula FOREIGN KEY (aula_id) REFERENCES Aulas(aula_id),
    CONSTRAINT fk_aulamodalidade_modalidade FOREIGN KEY (modalidade_id) REFERENCES Modalidades(modalidade_id),
    CONSTRAINT fk_aulamodalidade_instrutor FOREIGN KEY (instrutor_id) REFERENCES Instrutores(instrutor_id)
);

ALTER TABLE AulaModalidade ADD TESTE TEXT;
ALTER TABLE AulaModalidade DROP TESTE;

-- Inserções
INSERT INTO AulaModalidade (aula_id, modalidade_id, instrutor_id) 
VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- Atualizações
UPDATE AulaModalidade 
SET instrutor_id = 2 
WHERE aula_id = 1;

UPDATE AulaModalidade 
SET modalidade_id = 3 
WHERE aula_id = 4;

-- Exclusão
DELETE FROM AulaModalidade WHERE aula_id = 5;


-- Relacionamento entre Pagamentos e Alunos
ALTER TABLE Pagamentos ADD CONSTRAINT fk_pagamento_aluno FOREIGN KEY (aluno_id) REFERENCES Alunos(aluno_id);

DROP SCHEMA EC4_CC1M;
