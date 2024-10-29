-- Alunos
CREATE TABLE IF NOT EXISTS Alunos (
    aluno_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(15)
);

ALTER TABLE Alunos ADD TESTE TEXTE;
ALTER TABLE Alunos DROP TESTE TEXT;

-- Instrutores
CREATE TABLE IF NOT EXISTS Instrutores (
    instrutor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    data_contratacao DATE NOT NULL,
    especialidade VARCHAR(100)
);

-- Modalidades
CREATE TABLE IF NOT EXISTS Modalidades (
    modalidade_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);

-- Aulas
CREATE TABLE IF NOT EXISTS Aulas (
    aula_id INT PRIMARY KEY AUTO_INCREMENT,
    horario TIME NOT NULL,
    capacidade INT NOT NULL
);

-- Pagamentos
CREATE TABLE IF NOT EXISTS Pagamentos (
    pagamento_id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    data_pagamento DATE,
    valor DECIMAL(10, 2),
    status ENUM('Pago', 'Pendente') NOT NULL
);
-- Planos de Treinamento
CREATE TABLE IF NOT EXISTS PlanosTreinamento (
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT NOT NULL,
    instrutor_id INT NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE,
    CONSTRAINT fk_planotreinamento_aluno FOREIGN KEY (aluno_id) REFERENCES Alunos(aluno_id),
    CONSTRAINT fk_planotreinamento_instrutor FOREIGN KEY (instrutor_id) REFERENCES Instrutores(instrutor_id)
);
-- Relacionamento entre Aluno e Modalidade (Matriculas)
CREATE TABLE IF NOT EXISTS Matriculas (
    matricula_id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT NOT NULL,
    modalidade_id INT NOT NULL,
    data_matricula DATE,
    CONSTRAINT fk_matricula_aluno FOREIGN KEY (aluno_id) REFERENCES Alunos(aluno_id),
    CONSTRAINT fk_matricula_modalidade FOREIGN KEY (modalidade_id) REFERENCES Modalidades(modalidade_id)
);

-- Relacionamento entre Instrutor e Modalidade
CREATE TABLE IF NOT EXISTS InstrutorModalidade (
    instrutor_id INT NOT NULL,
    modalidade_id INT NOT NULL,
    PRIMARY KEY (instrutor_id, modalidade_id),
    CONSTRAINT fk_instrutormodalidade_instrutor FOREIGN KEY (instrutor_id) REFERENCES Instrutores(instrutor_id),
    CONSTRAINT fk_instrutormodalidade_modalidade FOREIGN KEY (modalidade_id) REFERENCES Modalidades(modalidade_id)
);

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

-- Relacionamento entre Pagamentos e Alunos
ALTER TABLE Pagamentos
ADD CONSTRAINT fk_pagamento_aluno FOREIGN KEY (aluno_id) REFERENCES Alunos(aluno_id);

