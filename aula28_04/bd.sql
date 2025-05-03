CREATE DATABASE etecmcm;

USE etecmcm;

CREATE TABLE Produtos (
    id_produto INTEGER PRIMARY KEY,
    nome VARCHAR(255),
    qtde INTEGER,
    preco DECIMAL(10,2),
    marca VARCHAR(255)
);

CREATE TABLE Categorias (
    id_categoria INTEGER PRIMARY KEY,
    nome_cat VARCHAR(255)
);

ALTER TABLE produtos ADD FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria);