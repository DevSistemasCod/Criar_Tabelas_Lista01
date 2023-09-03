CREATE TABLE departamento (
    sigla_depto VARCHAR(15),
    nome_depto VARCHAR(50),
    qtd_funcionarios_depto INT NOT NULL,
    PRIMARY KEY (sigla_depto, nome_depto)
);

CREATE TABLE funcionario (
    codigo_funcionario INT,
    nome_funcionario VARCHAR(50) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    sigla_depto VARCHAR(15) UNIQUE NOT NULL,
    PRIMARY KEY (codigo_funcionario, nome_funcionario),
    FOREIGN KEY (sigla_depto) REFERENCES departamento(sigla_depto)
);

CREATE TABLE projeto (
    sigla_projeto VARCHAR(15),
    nome_projeto VARCHAR(50),
    codigo_funcionario INT NOT NULL,
    sigla_depto VARCHAR(15) NOT NULL,
    PRIMARY KEY (sigla_projeto, nome_projeto),
    FOREIGN KEY (sigla_depto) REFERENCES departamento(sigla_depto),
    FOREIGN KEY (codigo_funcionario) REFERENCES funcionario(codigo_funcionario)
);
