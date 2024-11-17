CREATE SCHEMA EST_CASO_V;
USE EST_CASO_V;

-------------------------------------------
-- ABAIXO FICARÁ OS INSERTS DAS TABELAS ---
-------------------------------------------

-- TABELA CLIENTES
CREATE TABLE IF NOT EXISTS CLIENTES (
	CLI_CPF VARCHAR(14) PRIMARY KEY,
    CLI_NOME VARCHAR(100) NOT NULL,
    CLI_RUA VARCHAR(50),
    CLI_NUMRUA VARCHAR(25) NOT NULL,
    CLI_BAIRRO VARCHAR(50) NOT NULL,
    CLI_CIDADE VARCHAR(50) NOT NULL,
    CLI_UF CHAR(2) NOT NULL,
    CLI_PAIS VARCHAR(100) NOT NULL,
    CLI_CEP VARCHAR(15) NOT NULL,
    CLI_STATUS_PROMO ENUM("APROVADO", "REPROVADO") NOT NULL
);

-- INSERT CLIENTES
INSERT INTO CLIENTES (CLI_CPF, CLI_NOME, CLI_RUA, CLI_NUMRUA, CLI_BAIRRO, CLI_CIDADE, CLI_UF, CLI_PAIS, CLI_CEP, CLI_STATUS_PROMO)
VALUES
('12345678900', 'Ana Silva', 'Rua das Flores', '100', 'Centro', 'São Paulo', 'SP', 'Brasil', '01010-000', 'APROVADO'),
('23456789011', 'João Souza', 'Avenida Paulista', '200', 'Bela Vista', 'São Paulo', 'SP', 'Brasil', '01310-000', 'REPROVADO'),
('34567890122', 'Maria Oliveira', 'Rua Vergueiro', '300', 'Liberdade', 'São Paulo', 'SP', 'Brasil', '01504-000', 'APROVADO'),
('45678901233', 'Carlos Lima', 'Rua Augusta', '400', 'Consolação', 'São Paulo', 'SP', 'Brasil', '01305-000', 'APROVADO'),
('56789012344', 'Fernanda Gomes', 'Rua Haddock Lobo', '500', 'Cerqueira César', 'São Paulo', 'SP', 'Brasil', '01414-000', 'REPROVADO');

-- TABELA FORNECEDORES
CREATE TABLE IF NOT EXISTS FORNECEDORES (
	FORN_CNPJ VARCHAR(50) PRIMARY KEY,
    FORN_NOME VARCHAR(100) NOT NULL,
    FORN_TELEFONE VARCHAR(16) NOT NULL,
    FORN_EMAIL VARCHAR(50) NOT NULL
);


-- INSERT FORNECEDORES
INSERT INTO FORNECEDORES (FORN_CNPJ, FORN_NOME, FORN_TELEFONE, FORN_EMAIL)
VALUES
('12345678000100', 'Fornecedor A', '(11) 98765-4321', 'contato@fornecedora.com'),
('23456789000111', 'Fornecedor B', '(21) 99876-5432', 'suporte@fornecedorb.com'),
('34567890000122', 'Fornecedor C', '(31) 99987-6543', 'vendas@fornecedorc.com'),
('45678901000133', 'Fornecedor D', '(41) 91234-5678', 'info@fornecedord.com'),
('56789012000144', 'Fornecedor E', '(51) 93456-7890', 'help@fornecedore.com');

-- TABELA PRODUTOS
CREATE TABLE IF NOT EXISTS PRODUTOS (
	PROD_ID INT PRIMARY KEY,
    PROD_CATEGORIA VARCHAR(50) NOT NULL,
    PROD_QTDDISPONIVEL INT NOT NULL,
	PROD_PRECO DECIMAL(10, 3) NOT NULL
);

-- INSERT PRODUTOS
INSERT INTO PRODUTOS (PROD_ID, PROD_CATEGORIA, PROD_QTDDISPONIVEL, PROD_PRECO)
VALUES
(1, 'Computadores', 10, 3000.000),
(2, 'Celulares', 15, 1500.000),
(3, 'Acessórios', 50, 50.000),
(4, 'Software', 100, 200.000),
(5, 'Monitores', 20, 800.000);

-- TABELA PRODUTOS_FORNECEDORES
CREATE TABLE IF NOT EXISTS PRODUTOS_FORNECEDORES (
	PROD_ID INT,
    FORN_CNPJ VARCHAR(50),
    PRIMARY KEY(PROD_ID, FORN_CNPJ),
    -- FK vinda da tabela PRODUTOS
    CONSTRAINT PRFO_FK_PRODUTOS FOREIGN KEY(PROD_ID) REFERENCES PRODUTOS(PROD_ID),
        -- FK vinda da tabela FORNECEDORES
    CONSTRAINT PRFO_FK_FORNECEDORES FOREIGN KEY(FORN_CNPJ) REFERENCES FORNECEDORES(FORN_CNPJ)
);
 
-- INSERT PRODUTOS_FORNECEDORES
INSERT INTO PRODUTOS_FORNECEDORES (PROD_ID, FORN_CNPJ)
VALUES
(1, '12345678000100'),
(2, '23456789000111'),
(3, '34567890000122'),
(4, '45678901000133'),
(1, '34567890000122');


-- TABELA PAGAMENTOS
CREATE TABLE IF NOT EXISTS PAGAMENTOS (
	PAG_ID INT PRIMARY KEY,
    PAG_DATA DATE NOT NULL,
    PAG_HORA TIME NOT NULL,
    PAG_VALOR DECIMAL (10,3) NOT NULL,
    PAG_STATUS ENUM("PENDENTE", "PAGO", "CANCELADO")
);

-- INSERT PAGAMENTOS
INSERT INTO PAGAMENTOS (PAG_ID, PAG_DATA, PAG_HORA, PAG_VALOR, PAG_STATUS)
VALUES
(1, '2024-01-01', '10:00:00', 3000.000, 'PAGO'),
(2, '2024-01-02', '11:00:00', 1500.000, 'PENDENTE'),
(3, '2024-01-03', '12:00:00', 50.000, 'PAGO'),
(4, '2024-01-04', '13:00:00', 200.000, 'CANCELADO'),
(5, '2024-01-05', '14:00:00', 800.000, 'PENDENTE');

-- TABELA VENDAS
CREATE TABLE IF NOT EXISTS VENDAS (
	VENDA_ID INT PRIMARY KEY,
    CLI_CPF VARCHAR(14) NOT NULL,
    PAG_ID INT NOT NULL,
    -- FK vinda da tabela CLIENTES
    CONSTRAINT VENDA_FK_CLIENTES FOREIGN KEY(CLI_CPF) REFERENCES CLIENTES(CLI_CPF),
    -- FK vinda da tabela PAGAMENTOS
    CONSTRAINT VENDA_FK_PAGAMENTOS FOREIGN KEY(PAG_ID) REFERENCES PAGAMENTOS(PAG_ID)
);

-- INSERT VENDAS
INSERT INTO VENDAS (VENDA_ID, CLI_CPF, PAG_ID)
VALUES
(1, '12345678900', 1),
(2, '23456789011', 2),
(3, '34567890122', 3),
(4, '45678901233', 4),
(5, '56789012344', 5);

-- TABELA VENDAS_PRODUTOS
CREATE TABLE IF NOT EXISTS VENDAS_PRODUTOS (
	VENDA_ID INT,
    PROD_ID INT,
    PRIMARY KEY(VENDA_ID, PROD_ID),
    VEPRO_QTD_VENDIDA INT NOT NULL,
    VEPRO_VALORTOTAL DECIMAL(10,3) NOT NULL,
    -- FK vinda da tabela PRODUTOS
    CONSTRAINT VEPRO_FK_PRODUTOS FOREIGN KEY(PROD_ID) REFERENCES PRODUTOS(PROD_ID),
    -- FK vinda da tabela VENDAS
    CONSTRAINT VEPRO_FK_VENDAS FOREIGN KEY(VENDA_ID) REFERENCES VENDAS(VENDA_ID)
);

-- INSERT VENDAS_PRODUTOS
INSERT INTO VENDAS_PRODUTOS (VENDA_ID, PROD_ID, VEPRO_QTD_VENDIDA, VEPRO_VALORTOTAL)
VALUES
(1, 1, 1, 3000.000),
(2, 2, 2, 3000.000),
(3, 3, 10, 500.000),
(4, 4, 1, 200.000),
(1, 2, 1, 1500.000);

-------------------------------------------
-- ABAIXO FICARÁ OS DELETES DAS TABELAS ---
-------------------------------------------

-- TABELA CLIENTES
DELETE FROM CLIENTES WHERE CLI_CPF = '56789012344';

-- TABELA FORNECEDORES
DELETE FROM FORNECEDORES WHERE FORN_CNPJ = '56789012000144';

-- TABELA PRODUTOS
DELETE FROM PRODUTOS WHERE PROD_ID = 5;

-- TABELA PRODUTOS_FORNECEDORES
DELETE FROM PRODUTOS_FORNECEDORES WHERE PROD_ID = 1 AND FORN_CNPJ = '34567890000122';

-- TABELA PAGAMENTOS
DELETE FROM PAGAMENTOS WHERE PAG_ID = 5;

-- TABELA VENDAS
DELETE FROM VENDAS WHERE VENDA_ID = 5;

-- TABELA VENDAS_PRODUTOS
DELETE FROM VENDAS_PRODUTOS WHERE VENDA_ID = 1 AND PROD_ID = 2;

-------------------------------------------
-- ABAIXO FICARÁ OS UPDATES DAS TABELAS ---
-------------------------------------------

-- TABELA CLIENTES
UPDATE CLIENTES SET CLI_STATUS_PROMO = 'APROVADO' WHERE CLI_CPF = '23456789011';
UPDATE CLIENTES SET CLI_CIDADE = 'Campinas' WHERE CLI_CPF = '45678901233';

-- TABELA FORNECEDORES
UPDATE FORNECEDORES SET FORN_TELEFONE = '(11) 99999-0000' WHERE FORN_CNPJ = '12345678000100';
UPDATE FORNECEDORES SET FORN_EMAIL = 'novocontato@fornecedorc.com' WHERE FORN_CNPJ = '34567890000122';

-- TABELA PRODUTOS
UPDATE PRODUTOS SET PROD_QTDDISPONIVEL = 12 WHERE PROD_ID = 1;
UPDATE PRODUTOS SET PROD_PRECO = 1600.000 WHERE PROD_ID = 2;

-- TABELA PRODUTOS_FORNECEDORES
UPDATE PRODUTOS_FORNECEDORES SET FORN_CNPJ = '45678901000133' WHERE PROD_ID = 3;
UPDATE PRODUTOS_FORNECEDORES SET PROD_ID = 4 WHERE FORN_CNPJ = '23456789000111';

-- TABELA PAGAMENTOS
UPDATE PAGAMENTOS SET PAG_STATUS = 'PAGO' WHERE PAG_ID = 2;
UPDATE PAGAMENTOS SET PAG_VALOR = 250.000 WHERE PAG_ID = 4;

-- TABELA VENDAS
UPDATE VENDAS SET PAG_ID = 3 WHERE VENDA_ID = 2;
UPDATE VENDAS SET CLI_CPF = '123.456.789-00' WHERE VENDA_ID = 4;

-- TABELA VENDAS_PRODUTOS
UPDATE VENDAS_PRODUTOS SET VEPRO_QTD_VENDIDA = 5 WHERE VENDA_ID = 3 AND PROD_ID = 3;
UPDATE VENDAS_PRODUTOS SET VEPRO_VALORTOTAL = 3500.000 WHERE VENDA_ID = 1 AND PROD_ID = 1;

