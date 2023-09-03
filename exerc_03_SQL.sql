-- Tabela Disciplina
CREATE TABLE disciplina (
    codigo_disciplina VARCHAR(15) PRIMARY KEY,
    nome_disciplina VARCHAR(50),
    carga_horaria INT,
    descricao VARCHAR(100)
);

-- Tabela Curso
CREATE TABLE curso (
    sigla_curso VARCHAR(10) PRIMARY KEY,
    codigo_disciplina VARCHAR(15),
    nome VARCHAR(50),
    carga_horaria INT,
    descricao VARCHAR(100),
    FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo_disciplina)
);

-- Tabela Professor
CREATE TABLE professor (
    nro_registro_professor VARCHAR(15) PRIMARY KEY,
    nome VARCHAR(50),
    codigo_turma VARCHAR(15),
    codigo_disciplina VARCHAR(15),
    FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo_disciplina)
);

-- Tabela Turma
CREATE TABLE turma (
    codigo_turma VARCHAR(15) PRIMARY KEY,
    nro_alunos INT,
    sigla_curso VARCHAR(10),
    nro_registro_Professor VARCHAR(15),
    periodo VARCHAR(20),
    FOREIGN KEY (sigla_curso) REFERENCES curso(sigla_curso),
    FOREIGN KEY (nro_registro_Professor) REFERENCES professor(nro_registro_professor)
);

-- Tabela Aluno
CREATE TABLE aluno (
    nro_matricula INT PRIMARY KEY,
    nome_aluno VARCHAR(50),
    codigo_turma VARCHAR(15),
    FOREIGN KEY (codigo_turma) REFERENCES turma(codigo_turma)
);

-- Tabela Matricula
CREATE TABLE matricula (
    nro_matricula INT PRIMARY KEY,
    nome_aluno VARCHAR(50),
    sigla_curso VARCHAR(10),
    data_matricula DATE NOT NULL,
    semestre INT,
    FOREIGN KEY (sigla_curso) REFERENCES curso(sigla_curso),
	FOREIGN KEY (nro_matricula) REFERENCES aluno(nro_matricula)
);
