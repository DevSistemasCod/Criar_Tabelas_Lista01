-- Tabela Autor
CREATE TABLE autor (
    codigo_autor VARCHAR(15) PRIMARY KEY,
    nome_autor VARCHAR(100) NOT NULL,
    escola_literaria VARCHAR(100)
);

-- Tabela Editora
CREATE TABLE editora (
    codigo_editora VARCHAR(15) PRIMARY KEY,
    nome_editora VARCHAR(100) NOT NULL
);

-- Tabela Livro
CREATE TABLE livro (
    isbn VARCHAR(15) PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    codigo_autor VARCHAR(15) NOT NULL,
    tema VARCHAR(50) NOT NULL,
    codigo_editora VARCHAR(15) NOT NULL,
    data_publicacao DATE NOT NULL,
    FOREIGN KEY (codigo_autor) REFERENCES autor(codigo_autor),
    FOREIGN KEY (codigo_editora) REFERENCES editora(codigo_editora)
);

-- Tabela Cliente
CREATE TABLE cliente (
    codigo_cliente VARCHAR(15) PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL
);

-- Tabela EnderecoDoCliente
CREATE TABLE endereco_do_cliente (
    codigo_cliente VARCHAR(15) PRIMARY KEY,
    estado VARCHAR(20) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente)
);

-- Tabela Emprestimo
CREATE TABLE emprestimo (
    codigo_emprestimo VARCHAR(15) PRIMARY KEY,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE NOT NULL,
    codigo_cliente VARCHAR(15),
    isbn VARCHAR(15),
    FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente),
    FOREIGN KEY (isbn) REFERENCES livro(isbn)
);

-- Tabela ItensEmprestimo
CREATE TABLE itens_emprestimo (
    codigo_emprestimo VARCHAR(15),
    isbn VARCHAR(15),
    quantidade INT,
    PRIMARY KEY (codigo_emprestimo, isbn),
    FOREIGN KEY (codigo_emprestimo) REFERENCES emprestimo(codigo_emprestimo),
    FOREIGN KEY (isbn) REFERENCES Livro(isbn)
);


