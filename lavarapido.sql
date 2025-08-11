
-- Banco de Dados: Lava Rápido

-- Tabela: Marca
CREATE TABLE marca (
    cod_marca INT AUTO_INCREMENT PRIMARY KEY,
    nome_marca VARCHAR(255) NOT NULL
);

-- Tabela: Modelo
CREATE TABLE modelo (
    cod_modelo INT AUTO_INCREMENT PRIMARY KEY,
    nome_modelo VARCHAR(255) NOT NULL,
    cod_marca INT NOT NULL,
    CONSTRAINT fk_modelo_marca FOREIGN KEY (cod_marca) REFERENCES marca (cod_marca)
);

-- Tabela: Servico
CREATE TABLE servico (
    cod_servico INT AUTO_INCREMENT PRIMARY KEY,
    descricao_servico VARCHAR(255) NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

-- Tabela: Atendimento
CREATE TABLE atendimento (
    cod_atendimento INT AUTO_INCREMENT PRIMARY KEY,
    total_geral DECIMAL(10,2) NOT NULL,
    data_atendimento DATE NOT NULL
);

-- Tabela: Atendimento_Servico
CREATE TABLE atendimento_servico (
    quantidade INT NOT NULL,
    total_servico DECIMAL(10,2),
    cod_atendimento INT NOT NULL,
    cod_servico INT NOT NULL,
    CONSTRAINT fk_atend_serv_atend FOREIGN KEY (cod_atendimento) REFERENCES atendimento (cod_atendimento),
    CONSTRAINT fk_atend_serv_serv FOREIGN KEY (cod_servico) REFERENCES servico (cod_servico)
);

-- Tabela: Endereco
CREATE TABLE endereco (
    cod_endereco INT AUTO_INCREMENT PRIMARY KEY,
    rua VARCHAR(255) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(10) NOT NULL
);

-- Tabela: Cliente
CREATE TABLE cliente (
    cod_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    cod_endereco INT NOT NULL,
    CONSTRAINT fk_cliente_endereco FOREIGN KEY (cod_endereco) REFERENCES endereco (cod_endereco)
);

-- Tabela: Carro
CREATE TABLE carro (
    cod_carro INT AUTO_INCREMENT PRIMARY KEY,
    ano INT NOT NULL,
    cod_cliente INT NOT NULL,
    cod_modelo INT NOT NULL,
    CONSTRAINT fk_carro_cliente FOREIGN KEY (cod_cliente) REFERENCES cliente (cod_cliente),
    CONSTRAINT fk_carro_modelo FOREIGN KEY (cod_modelo) REFERENCES modelo (cod_modelo)
);
