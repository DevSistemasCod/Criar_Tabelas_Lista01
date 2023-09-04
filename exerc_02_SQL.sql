-- Tabela Cliente
CREATE TABLE cliente (
    cpf_cliente VARCHAR(11) PRIMARY KEY,
    nome_cliente VARCHAR(50) NOT NULL
);

-- Tabela TelefoneDoCliente
CREATE TABLE tel_cliente (
    cpf_cliente VARCHAR(11),
    tel_celular VARCHAR(15) NOT NULL,
    tel_residencial VARCHAR(15),
    tel_comercial VARCHAR(15),
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
    razaosocial VARCHAR(100) NOT NULL,
    nomefantasia VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

-- Tabela Medicamento
CREATE tABLE medicamento (
    codmedicamento VARCHAR(15) PRIMARY KEY,
    nome_medicamento VARCHAR(100) NOT NULL,
    codfabricante VARCHAR(15) NOT NULL,
    data_val DATE NOT NULL,
    FOREIGN KEY (codfabricante) REFERENCES fabricante(cnpj)
);

-- Tabela Venda
CREATE TABLE venda (
    codvenda VARCHAR(15) PRIMARY KEY,
    data_venda DATE NOT NULL,
    cpf_cliente VARCHAR(11) NOT NULL,
    codmedicamento VARCHAR(15) NOT NULL,
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf_cliente),
    FOREIGN KEY (codmedicamento) REFERENCES medicamento(codmedicamento)
);

-- Tabela ItensVenda
CREATE TABLE itens_venda (
    codvenda VARCHAR(15) NOT NULL,
    codmedicamento VARCHAR(15) NOT NULL,
    quantidade INT NOT NULL,
    data_venda DATE NOT NULL,
    PRIMARY KEY (codvenda, codmedicamento),
    FOREIGN KEY (codvenda) REFERENCES venda(codvenda),
    FOREIGN KEY (codmedicamento) REFERENCES medicamento(codmedicamento)
);
