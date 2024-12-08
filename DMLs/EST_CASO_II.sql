CREATE SCHEMA EST_CASO_II;
USE EST_CASO_II;

-------------------------------------------
-- ABAIXO FICARÁ OS INSERTS DAS TABELAS ---
-------------------------------------------

-- TABELA PASSAGEIROS

CREATE TABLE IF NOT EXISTS PASSAGEIROS (
	PASS_CPF VARCHAR(14) PRIMARY KEY,
    PASS_NOME VARCHAR(50) NOT NULL,
    PASS_TELEFONE VARCHAR(15) NOT NULL,
    PASS_RUA VARCHAR(100) NOT NULL,
	PASS_NUMRUA INT,
	PASS_BAIRRO VARCHAR(50) NOT NULL,
	PASS_CIDADE VARCHAR(50) NOT NULL,
	PASS_ESTADO VARCHAR(50) NOT NULL,
	PASS_PAIS VARCHAR(50) NOT NULL,
	PASS_CODPOSTAL VARCHAR(10) NOT NULL,
    PASS_EMAIL VARCHAR(50) NOT NULL
);

-- INSERT PASSAGEIROS

INSERT INTO PASSAGEIROS (PASS_CPF, PASS_NOME, PASS_TELEFONE, PASS_RUA, PASS_NUMRUA, PASS_BAIRRO, PASS_CIDADE, PASS_ESTADO, PASS_PAIS, PASS_CODPOSTAL, PASS_EMAIL)
VALUES
('12345678900', 'João Silva', '(11) 91234-5678', 'Rua das Acácias', 101, 'Centro', 'São Paulo', 'SP', 'Brasil', '01000-001', 'joao.silva@gmail.com'),
('23456789001', 'Maria Oliveira', '(21) 99876-5432', 'Avenida Brasil', 202, 'Zona Sul', 'Rio de Janeiro', 'RJ', 'Brasil', '20000-002', 'maria.oliveira@hotmail.com'),
('34567890123', 'Carlos Mendes', '(31) 98765-4321', 'Rua das Orquídeas', 303, 'Bairro Novo', 'Belo Horizonte', 'MG', 'Brasil', '31000-003', 'carlos.mendes@outlook.com'),
('45678901234', 'Ana Clara', '(41) 97654-3210', 'Praça das Flores', 404, 'Centro', 'Curitiba', 'PR', 'Brasil', '80000-004', 'ana.clara@yahoo.com'),
('56789012345', 'Lucas Pereira', '(51) 96543-2109', 'Rua das Palmeiras', 505, 'Zona Norte', 'Porto Alegre', 'RS', 'Brasil', '90000-005', 'lucas.pereira@gmail.com');

-- Tabela FUNCIONARIOS

CREATE TABLE IF NOT EXISTS FUNCIONARIOS (
	FUNC_ID INT PRIMARY KEY,
    FUNC_CPF VARCHAR(14) NOT NULL,
    FUNC_NOME VARCHAR(50) NOT NULL,
    FUNC_DATANASC DATE NOT NULL,
    FUNC_RUA VARCHAR(100) NOT NULL,
    FUNC_NUMRUA INT,
    FUNC_BAIRRO VARCHAR(50) NOT NULL,
    FUNC_CIDADE VARCHAR(50) NOT NULL,
    FUNC_ESTADO VARCHAR(50) NOT NULL,
    FUNC_PAIS VARCHAR(50) NOT NULL,
    FUNC_CODPOSTAL VARCHAR(10) NOT NULL
);

-- INSERT FUNCIONARIOS

INSERT INTO FUNCIONARIOS (FUNC_ID, FUNC_CPF, FUNC_NOME, FUNC_DATANASC, FUNC_RUA, FUNC_NUMRUA, FUNC_BAIRRO, FUNC_CIDADE, FUNC_ESTADO, FUNC_PAIS, FUNC_CODPOSTAL)
VALUES
(101, '11111111111', 'João Silva', '1990-01-01', 'Rua do Trabalho', 10, 'Centro', 'São Paulo', 'SP', 'Brasil', '01010-100'),
(102, '22222222222', 'Maria Santos', '1985-02-15', 'Avenida dos Trabalhadores', 20, 'Bairro Novo', 'Rio de Janeiro', 'RJ', 'Brasil', '20020-200'),
(103, '33333333333', 'Pedro Almeida', '1978-03-20', 'Rua Industrial', 30, 'Zona Oeste', 'Belo Horizonte', 'MG', 'Brasil', '31030-300'),
(104, '44444444444', 'Ana Clara', '1995-04-25', 'Praça Central', 40, 'Centro', 'Curitiba', 'PR', 'Brasil', '80040-400'),
(105, '55555555555', 'Lucas Lima', '1988-05-10', 'Rua das Palmeiras', 50, 'Zona Norte', 'Porto Alegre', 'RS', 'Brasil', '90050-500');

-- Tabela AERONAVES

CREATE TABLE IF NOT EXISTS AERONAVES (
	AERON_PREFIXO VARCHAR(10) PRIMARY KEY,
    AERON_MODELO VARCHAR(50) NOT NULL,
    AERON_FABRICANTE VARCHAR(50) NOT NULL,
    AERON_ANOFABR YEAR NOT NULL,
    AERON_CAPACIDADE TEXT NOT NULL,
    AERON_AUTONOMIA VARCHAR(10) NOT NULL
);

-- INSERT AERONAVES

INSERT INTO AERONAVES (AERON_PREFIXO, AERON_MODELO, AERON_FABRICANTE, AERON_ANOFABR, AERON_CAPACIDADE, AERON_AUTONOMIA)
VALUES
('PR-AAA', 'Boeing 737', 'Boeing', 2010, '200 passageiros', '5000 km'),
('PR-BBB', 'Airbus A320', 'Airbus', 2015, '180 passageiros', '4800 km'),
('PR-CCC', 'Embraer E190', 'Embraer', 2012, '100 passageiros', '4000 km'),
('PR-DDD', 'ATR 72', 'ATR', 2018, '70 passageiros', '1500 km'),
('PR-EEE', 'Cessna 208', 'Cessna', 2020, '12 passageiros', '1200 km');

-- Tabela AEROPORTOS

CREATE TABLE IF NOT EXISTS AEROPORTOS (
	AEROP_CODIGO INT PRIMARY KEY,
    AEROP_NOME VARCHAR(50) NOT NULL,
    AEROP_CIDADE VARCHAR(50) NOT NULL,
    AEROP_PAIS VARCHAR(50) NOT NULL,
    AEROP_LATITUDE TEXT NOT NULL,
    AEROP_LONGITUDE TEXT NOT NULL
);

-- INSERT AEROPORTOS

INSERT INTO AEROPORTOS (AEROP_CODIGO, AEROP_NOME, AEROP_CIDADE, AEROP_PAIS, AEROP_LATITUDE, AEROP_LONGITUDE)
VALUES
(101, 'Aeroporto de Congonhas', 'São Paulo', 'Brasil', '-23.626', '-46.655'),
(102, 'Aeroporto Santos Dumont', 'Rio de Janeiro', 'Brasil', '-22.911', '-43.163'),
(103, 'Aeroporto de Confins', 'Belo Horizonte', 'Brasil', '-19.634', '-43.971'),
(104, 'Aeroporto Afonso Pena', 'Curitiba', 'Brasil', '-25.530', '-49.173'),
(105, 'Aeroporto Salgado Filho', 'Porto Alegre', 'Brasil', '-29.993', '-51.171');


-- Tabela VOOS

CREATE TABLE IF NOT EXISTS VOOS (
	VOO_ID INT PRIMARY KEY,
    VOO_DATA DATE NOT NULL,
    VOO_HORA TIME NOT NULL,
    VOO_AEROP_ORIGEM INT NOT NULL,
    VOO_AEROP_DESTINO INT NOT NULL,
    VOO_AERONAVE VARCHAR(10) NOT NULL,
    CONSTRAINT FK_AEROP_ORIGEM FOREIGN KEY(VOO_AEROP_ORIGEM) REFERENCES AEROPORTOS(AEROP_CODIGO),
    CONSTRAINT FK_AEROP_DESTINO FOREIGN KEY(VOO_AEROP_DESTINO) REFERENCES AEROPORTOS(AEROP_CODIGO),
    CONSTRAINT FK_AERONAVE FOREIGN KEY(VOO_AERONAVE) REFERENCES AERONAVES(AERON_PREFIXO)
);

-- INSERT VOO

INSERT INTO VOOS (VOO_ID, VOO_DATA, VOO_HORA, VOO_AEROP_ORIGEM, VOO_AEROP_DESTINO, VOO_AERONAVE)
VALUES
(1, '2023-12-01', '08:00:00', 101, 102, 'PR-AAA'),
(2, '2023-12-02', '09:30:00', 103, 104, 'PR-BBB'),
(3, '2023-12-03', '11:00:00', 104, 105, 'PR-CCC'),
(4, '2023-12-04', '13:30:00', 105, 101, 'PR-DDD'),
(5, '2023-12-05', '15:00:00', 102, 103, 'PR-EEE');

-- TABELA EQUIPES

CREATE TABLE IF NOT EXISTS EQUIPES (
	VOO_ID INT NOT NULL,
    FUNC_ID INT NOT NULL,
    PRIMARY KEY(VOO_ID, FUNC_ID),
    CONSTRAINT VOFU_FK_VOO FOREIGN KEY(VOO_ID) REFERENCES VOOS(VOO_ID),
    CONSTRAINT VOFU_FK_FUNCIONARIO FOREIGN KEY(FUNC_ID) REFERENCES FUNCIONARIOS(FUNC_ID)
);

-- INSERT EQUIPES

INSERT INTO EQUIPES (VOO_ID, FUNC_ID)
VALUES
(1, 101),
(1, 102),
(2, 103),
(2, 104),
(3, 105);

-- TABELA RESERVAS

CREATE TABLE IF NOT EXISTS RESERVAS (
	RESERVA_COD INT PRIMARY KEY,
    VOO_ID INT NOT NULL,
    PASS_CPF VARCHAR(14) NOT NULL,
    CONSTRAINT FK_PASSAGEIROS FOREIGN KEY(PASS_CPF) REFERENCES PASSAGEIROS(PASS_CPF),
    CONSTRAINT FK_VOOS FOREIGN KEY(VOO_ID) REFERENCES VOOS(VOO_ID)
);

-- INSERT RESERVAS

INSERT INTO RESERVAS (RESERVA_COD, VOO_ID, PASS_CPF)
VALUES
(2001, 1, '12345678900'),
(2002, 1, '23456789001'),
(2003, 2, '34567890123'),
(2004, 3, '45678901234'),
(2005, 4, '56789012345');


-------------------------------------------
-- ABAIXO FICARÁ OS DELETES DAS TABELAS ---
-------------------------------------------

-- TABELA EQUIPES

DELETE FROM EQUIPES WHERE VOO_ID = 1;

-- TABELA RESERVAS

DELETE FROM RESERVAS WHERE VOO_ID = 1;

-- TABELA VOOS

DELETE FROM VOOS WHERE VOO_ID = 1;

-- TABELA PASSAGEIROS

DELETE FROM PASSAGEIROS WHERE PASS_CPF = '12345678901';

-- TABELA FUNCIONARIOS

DELETE FROM FUNCIONARIOS WHERE FUNC_CPF = '98765432100';

-- TABELA AERONAVES

DELETE FROM AERONAVES WHERE AERON_PREFIXO = 'PR-AAA';


-- TABELA AEROPORTOS

DELETE FROM AEROPORTOS WHERE AEROP_CODIGO = 101;

-------------------------------------------
-- ABAIXO FICARÁ OS UPDATES DAS TABELAS ---
-------------------------------------------

-- TABELA PASSAGEIROS

UPDATE PASSAGEIROS SET PASS_TELEFONE = '(11) 91234-5678' WHERE PASS_CPF = '23456789012';
UPDATE PASSAGEIROS SET PASS_RUA = 'Rua das Acácias' WHERE PASS_CPF = '34567890123';

-- TABELA FUNCIONARIOS

UPDATE FUNCIONARIOS SET FUNC_DATANASC = '2000-01-12' WHERE FUNC_CPF = '87654321009';
UPDATE FUNCIONARIOS SET FUNC_DATANASC = '1978-05-26' WHERE FUNC_CPF = '76543210987';

-- TABELA AERONAVES 

UPDATE AERONAVES SET AERON_MODELO = 'Boeing 747' WHERE AERON_PREFIXO = 'PT-DDD';
UPDATE AERONAVES SET AERON_MODELO = 'Boeing 747' WHERE AERON_PREFIXO = 'PT-CCC';

-- TABELA AEROPORTOS

UPDATE AEROPORTOS SET AEROP_CIDADE = 'Campinas' WHERE AEROP_CODIGO = 102;
UPDATE AEROPORTOS SET AEROP_NOME = 'Aeroporto Internacional de Brasília' WHERE AEROP_CODIGO = 103;

-- TABELA VOOS

UPDATE VOOS SET VOO_DATA = '2024-11-20' WHERE VOO_ID = 2;
UPDATE VOOS SET VOO_AEROP_DESTINO = 105 WHERE VOO_ID = 3;

-- TABELA EQUIPES

UPDATE EQUIPES SET FUNC_ID = 103 WHERE FUNC_ID = 102;
UPDATE EQUIPES SET FUNC_ID = 105 WHERE FUNC_ID = 103;

-- TABELA RESERVAS

UPDATE RESERVAS SET PASS_CPF = '34567890123' WHERE RESERVA_COD = 2002;
UPDATE RESERVAS SET PASS_CPF = '23456789001' WHERE RESERVA_COD = 2003;






