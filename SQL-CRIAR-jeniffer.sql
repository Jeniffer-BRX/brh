CREATE SCHEMA brh;

USE brh;

CREATE TABLE COLABORADOR (
MATRICULA INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
CPF VARCHAR(14) NOT NULL,
EMAIL_CORPORATIVO VARCHAR(100) NOT NULL,
SALARIO DECIMAL(5,2) NOT NULL,
DEPARTAMENTO VARCHAR(10) NOT NULL
);

CREATE TABLE PESSOA (
CPF VARCHAR(15) PRIMARY KEY NOT NULL,
NOME VARCHAR(100) NOT NULL,
EMAIL_PESSOAL VARCHAR(100) NOT NULL,
LOGRADOURO VARCHAR(150),
COMPLEMENTO VARCHAR(150),
CEP VARCHAR(50) NOT NULL
);

CREATE TABLE DEPARTAMENTO (
SIGLA VARCHAR(10) PRIMARY KEY NOT NULL,
NOME VARCHAR(100) NOT NULL,
CHEFE INT NOT NULL,
DEPARTAMENTO_SUPERIOR INT NOT NULL,

CONSTRAINT FK_MATRICULA_CHEFE FOREIGN KEY (CHEFE) REFERENCES COLABORADOR (MATRICULA),
CONSTRAINT FK_MATRICULA_SUPERIOR FOREIGN KEY (DEPARTAMENTO_SUPERIOR) REFERENCES COLABORADOR (MATRICULA)
);

CREATE TABLE TELEFONE (
TELEFONE VARCHAR(20) PRIMARY KEY NOT NULL,
ID_COLABORADOR INT NOT NULL,

CONSTRAINT FK_COLABORADOR FOREIGN KEY (ID_COLABORADOR) REFERENCES COLABORADOR (MATRICULA)
);

CREATE TABLE CEP (
CEP VARCHAR(50) PRIMARY KEY NOT NULL,
ID_COLABORADOR INT NOT NULL,
ESTADO VARCHAR(5) NOT NULL,
CIDADE VARCHAR(50) NOT NULL,
BAIRRO VARCHAR(50) NOT NULL,

CONSTRAINT FK_ID_COLABORADOR FOREIGN KEY (ID_COLABORADOR) REFERENCES COLABORADOR (MATRICULA)
);

ALTER TABLE COLABORADOR
ADD CONSTRAINT FK_DEPTO_COLAB FOREIGN KEY (DEPARTAMENTO) REFERENCES DEPARTAMENTO (SIGLA);

ALTER TABLE COLABORADOR
ADD CONSTRAINT FK_CPF_PESSOA FOREIGN KEY (CPF) REFERENCES PESSOA (CPF);

ALTER TABLE PESSOA
ADD CONSTRAINT FK_CEP_PESSOA FOREIGN KEY (CEP) REFERENCES CEP (CEP);

CREATE TABLE DEPENDENTE (
CPF VARCHAR(15) PRIMARY KEY NOT NULL,
ID_COLABORADOR INT NOT NULL,
NOME VARCHAR(100) NOT NULL,
DATA_NASCIMENTO DATE NOT NULL,
PARENTESCO VARCHAR(100) NOT NULL,

CONSTRAINT FK_MATRICULA FOREIGN KEY (ID_COLABORADOR) REFERENCES COLABORADOR (MATRICULA)
);

CREATE TABLE PROJETO (
ID_PROJETO INT PRIMARY KEY NOT NULL,
NOME VARCHAR(100) NOT NULL,
INICIO DATE NOT NULL,
FIM DATE NOT NULL,
RESPONSAVEL INT NOT NULL,

CONSTRAINT FK_COLAB FOREIGN KEY (RESPONSAVEL) REFERENCES COLABORADOR (MATRICULA)
);

CREATE TABLE PAPEL (
ID_PAPEL INT PRIMARY KEY NOT NULL,
NOME VARCHAR(50) NOT NULL
);

CREATE TABLE ATRIBUICAO (
ID_COLABORADOR INT NOT NULL,
ID_PROJETO INT NOT NULL,
ID_PAPEL INT NOT NULL,

CONSTRAINT FK_ID_COLAB FOREIGN KEY (ID_COLABORADOR) REFERENCES COLABORADOR (MATRICULA),
CONSTRAINT FK_PROJETO FOREIGN KEY (ID_PROJETO) REFERENCES PROJETO (ID_PROJETO),
CONSTRAINT FK_PAPEL FOREIGN KEY (ID_PAPEL) REFERENCES PAPEL (ID_PAPEL)
);

