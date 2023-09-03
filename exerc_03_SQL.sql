-- Tabela Disciplina
CREATE TABLE disciplina (
    codigo_disciplina INT PRIMARY KEY,
    nome_disciplina VARCHAR(50),
    carga_horaria INT,
    descricao VARCHAR(100)
);

-- Tabela Curso
CREATE TABLE curso (
    sigla_curso VARCHAR(10) PRIMARY KEY,
    codigo_disciplina INT,
    nome VARCHAR(50),
    carga_horaria INT,
    descricao VARCHAR(100),
    FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo_disciplina)
);

-- Tabela Professor
CREATE TABLE professor (
    nro_registro_professor INT PRIMARY KEY,
    nome VARCHAR(50),
    codigo_turma INT,
    codigo_disciplina INT,
    FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo_disciplina)
);

-- Tabela Turma
CREATE TABLE turma (
    codigo_turma INT PRIMARY KEY,
    nro_alunos INT,
    sigla_curso VARCHAR(10),
    nro_registro_Professor INT,
    periodo VARCHAR(20),
    FOREIGN KEY (sigla_curso) REFERENCES curso(sigla_curso),
    FOREIGN KEY (nro_registro_Professor) REFERENCES professor(nro_registro_professor)
);

-- Tabela Aluno
CREATE TABLE aluno (
    nro_matricula INT PRIMARY KEY,
    nome_aluno VARCHAR(50),
    codigo_turma INT,
    FOREIGN KEY (codigo_turma) REFERENCES turma(codigo_turma)
);

-- Tabela Matricula
CREATE TABLE matricula (
    nro_matricula INT PRIMARY KEY,
    nome_aluno VARCHAR(50),
    sigla_curso VARCHAR(10),
    ano INT,
    semestre INT,
    FOREIGN KEY (sigla_curso) REFERENCES curso(sigla_curso),
	FOREIGN KEY (nro_matricula) REFERENCES aluno(nro_matricula)
);
