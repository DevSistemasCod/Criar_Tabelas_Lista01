-- Tabela Cliente
CREATE TABLE cliente (
    cpf_cliente VARCHAR(11) PRIMARY KEY,
    nome_cliente VARCHAR(50) NOT NULL
);

-- Tabela TelefoneDoCliente
CREATE TABLE telefone_cliente (
    cpf_cliente VARCHAR(11),
    telefone_celular VARCHAR(15) NOT NULL,
    telefone_residencial VARCHAR(15),
    telefone_comercial VARCHAR(15),
    PRIMARY KEY (cpf_cliente),
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf_cliente)
);

-- Tabela EnderecoDoCliente
CREATE TABLE endereco_cliente (
    cpf_cliente VARCHAR(11),
    estado VARCHAR(20) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    PRIMARY KEY (cpf_cliente),
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf_cliente)
);

-- Tabela Fabricante
CREATE TABLE fabricante (
    cnpj VARCHAR(15) PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    nome_fantasia VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

-- Tabela Medicamento
CREATE tABLE medicamento (
    codigo_medicamento VARCHAR(15) PRIMARY KEY,
    nome_medicamento VARCHAR(100) NOT NULL,
    codigo_fabricante VARCHAR(15) NOT NULL,
    data_validade DATE NOT NULL,
    FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(cnpj)
);

-- Tabela Venda
CREATE TABLE venda (
    codigo_venda VARCHAR(15) PRIMARY KEY,
    data_venda DATE NOT NULL,
    cpf_cliente VARCHAR(11) NOT NULL,
    codigo_medicamento VARCHAR(15) NOT NULL,
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf_cliente),
    FOREIGN KEY (codigo_medicamento) REFERENCES medicamento(codigo_medicamento)
);

-- Tabela ItensVenda
CREATE TABLE ItensVenda (
    codigo_venda VARCHAR(15) NOT NULL,
    codigo_medicamento VARCHAR(15) NOT NULL,
    quantidade INT NOT NULL,
    data_venda DATE NOT NULL,
    PRIMARY KEY (codigo_venda, codigo_medicamento),
    FOREIGN KEY (codigo_venda) REFERENCES venda(codigo_venda),
    FOREIGN KEY (codigo_medicamento) REFERENCES Medicamento(codigo_medicamento)
);
