CREATE TABLE departamento (
    sigla_depto VARCHAR(15),
    nome_depto VARCHAR(50),
    qtdfuncionariosdepto INT NOT NULL,
    PRIMARY KEY (sigla_depto, nome_depto)
);

CREATE TABLE funcionario (
    codfuncionario INT,
    nome_funcionario VARCHAR(50) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    sigla_depto VARCHAR(15) UNIQUE NOT NULL,
    PRIMARY KEY (codfuncionario, nome_funcionario),
    FOREIGN KEY (sigla_depto) REFERENCES departamento(sigla_depto)
);

CREATE TABLE projeto (
    sigla_projeto VARCHAR(15),
    nome_projeto VARCHAR(50),
    codfuncionario INT NOT NULL,
    sigla_depto VARCHAR(15) NOT NULL,
    PRIMARY KEY (sigla_projeto, nome_projeto),
    FOREIGN KEY (sigla_depto) REFERENCES departamento(sigla_depto),
    FOREIGN KEY (codfuncionario) REFERENCES funcionario(codfuncionario)
);
