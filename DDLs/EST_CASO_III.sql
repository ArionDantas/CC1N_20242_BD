CREATE SCHEMA SISTEMA_GESTAO_EMPRESARIAL;

USE SISTEMA_GESTAO_EMPRESARIAL;

CREATE TABLE IF NOT EXISTS TIPO_ENDERECO (
	TIPO_END_COD INT PRIMARY KEY,
    TIPO_END_CATEGORIA VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS ENDERECOS (
	END_COD INT PRIMARY KEY,
    END_LOGRADOURO VARCHAR(100) NOT NULL,
    END_NUM VARCHAR(45),
    END_BAIRRO VARCHAR(45) NOT NULL,
    END_CIDADE VARCHAR(45) NOT NULL,
    END_UF CHAR(2) NOT NULL,
    END_CEP VARCHAR(20) NOT NULL,
    -- Chave estrangeira da tabela TIPO_ENDERECO
    TIPO_END_COD INT NOT NULL,
    CONSTRAINT FK_TIPO_ENDERECOS FOREIGN KEY(TIPO_END_COD) REFERENCES TIPO_ENDERECO(TIPO_END_COD)
);

CREATE TABLE IF NOT EXISTS EMPRESAS (
	EMPRE_COD INT PRIMARY KEY,
    EMPRE_CNPJ VARCHAR(45) NOT NULL,
    EMPRE_RAZAOSOCIAL VARCHAR(100) NOT NULL,
    EMPRE_PCONTATO VARCHAR(45) NOT NULL,
    -- Chave estrangeira da tabela ENDERECOS
    EMPRE_END_COD INT NOT NULL UNIQUE,
    CONSTRAINT FK_ENDERECOS FOREIGN KEY(EMPRE_END_COD) REFERENCES ENDERECOS(END_COD)
);


CREATE TABLE IF NOT EXISTS EMPRE_TEL (
	EMPRE_COD INT PRIMARY KEY,
    EMPRE_TEL_TELEFONE VARCHAR(45) NOT NULL,
    -- Chave estrangeira que também é PK da tabela EMPRESAS
    CONSTRAINT FK_EMPRESAS FOREIGN KEY(EMPRE_COD) REFERENCES EMPRESAS(EMPRE_COD) 
);


CREATE TABLE IF NOT EXISTS CLIENTES (
	CLI_COD INT PRIMARY KEY,
    CLI_CNPJ VARCHAR(45) NOT NULL,
    CLI_RAZAOSOCIAL VARCHAR(45) NOT NULL,
    CLI_RAMOATIV VARCHAR(45) NOT NULL,
    CLI_PCONTATO VARCHAR(45) NOT NULL,
    CLI_DATACADAS VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS CLI_TEL (
	CLI_COD INT PRIMARY KEY,
    CLI_TEL_TELEFONE VARCHAR(45) NOT NULL,
    -- Chave estrangeira que também é PK da tabela CLIENTES
    CONSTRAINT FK_CLIENTES FOREIGN KEY(CLI_COD) REFERENCES CLIENTES(CLI_COD) 
);

-- ENTIDADE ASSOCIATIVA ENTRE CLIENTES <-> ENDERECOS
CREATE TABLE IF NOT EXISTS CLIENTES_ENDERECOS (
	CLI_COD INT NOT NULL,
    CLI_END_COD INT NOT NULL,
	PRIMARY KEY(CLI_COD, CLI_END_COD),
    CONSTRAINT CLEN_FK_CLIENTES FOREIGN KEY(CLI_COD) REFERENCES CLIENTES(CLI_COD),
    CONSTRAINT CLEN_FK_ENDERECOS FOREIGN KEY(CLI_END_COD) REFERENCES ENDERECOS(END_COD)
);

CREATE TABLE IF NOT EXISTS CARGOS (
	CARGOS_COD INT PRIMARY KEY,
    CARGO_NOME VARCHAR(50) NOT NULL,
    CARGO_SALARIO DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS FUNCIONARIOS (
	FUNC_MATRICULA INT PRIMARY KEY,
    FUNC_NOME VARCHAR(50) NOT NULL,
    FUNC_DATAADMISSAO DATE NOT NULL,
    -- Chave estrangeira da tabela CARGO
    FUNC_CARGO_COD INT NOT NULL,
    -- Chave estangeira da tabela ENDERECOS
    FUNC_END_COD INT NOT NULL,
    CONSTRAINT FUNC_FK_CARGO FOREIGN KEY(FUNC_CARGO_COD) REFERENCES CARGOS(CARGOS_COD),
    CONSTRAINT FUNC_FK_ENDERECOS FOREIGN KEY(FUNC_END_COD) REFERENCES ENDERECOS(END_COD)
);

CREATE TABLE IF NOT EXISTS QUALIFICACOES (
	FUNC_MATRICULA INT PRIMARY KEY,
    QUALIFICACAO_FUNC TEXT,
    CONSTRAINT QUALIFICACOES_FK_FUNC FOREIGN KEY(FUNC_MATRICULA) REFERENCES FUNCIONARIOS(FUNC_MATRICULA)
);

CREATE TABLE IF NOT EXISTS FUNC_TEL (
	FUNC_MATRICULA INT PRIMARY KEY,
    FUNC_TEL VARCHAR(15) NOT NULL,
    CONSTRAINT FUNC_TEL_FK_FUNCIONARIOS FOREIGN KEY(FUNC_MATRICULA) REFERENCES FUNCIONARIOS(FUNC_MATRICULA)
);

CREATE TABLE IF NOT EXISTS ENCOMENDAS (
	ENCOM_COD INT PRIMARY KEY,
    ENCOM_DATAINCLU DATE NOT NULL,
    CLI_COD INT NOT NULL,
    CONSTRAINT ENCOM_FK_CLIENTES FOREIGN KEY(CLI_COD) REFERENCES CLIENTES(CLI_COD)
);

CREATE TABLE IF NOT EXISTS PRODUTOS (
    PROD_COD INT PRIMARY KEY,
    PROD_NOME VARCHAR(100) NOT NULL,
    PROD_COR VARCHAR(45)  NOT NULL,
    PROD_PESO DECIMAL(10, 2) NOT NULL,
    PROD_PRECOUND DECIMAL(10, 2) NOT NULL,
    PROD_TEMPOFABRI TIME NOT NULL,
    PROD_DESENHOPROD VARCHAR(255) NOT NULL,
    PROD_HRMAOOBRA DECIMAL(10, 2) NOT NULL,
    PROD_ALTURA DECIMAL(3,10) NOT NULL,
    PROD_LARGURA DECIMAL(3,10) NOT NULL,
    PROD_COMPRIMENTO DECIMAL(3,10) NOT NULL
);
