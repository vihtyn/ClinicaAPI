CREATE DATABASE IF NOT EXISTS clinica;
USE clinica;

CREATE TABLE Dono(
	CPF varchar(11) PRIMARY KEY UNIQUE NOT NULL,
    Nome varchar(30),
    Endereco varchar(255),
    email varchar(100),
    data_nasc date,
    Telefone varchar(20) DEFAULT NULL
);

CREATE TABLE Animal(
    RFID VARCHAR(10) PRIMARY KEY NOT NULL, 
    Especie varchar(20) not null,
    CPF_dono varchar(11) not null,
    Nome varchar(100) not null,
    Idade int not null,
    Porte varchar(40) not null, 
    CONSTRAINT FK_Dono_CPF_Animal
    FOREIGN KEY (CPF_dono) REFERENCES Dono (CPF)
);

CREATE TABLE veterinario(
	CRMV varchar(13) primary key not null,
    nome varchar(100) not null,
    idade int not null,
    data_graduacao date not null
);

CREATE TABLE consulta(
	id VARCHAR(36) PRIMARY KEY NOT NULL,
    diagnostico VARCHAR(255) NOT NULL,
    id_animal VARCHAR(10) NOT NULL,
    CRMV_veterinario VARCHAR(13) NOT NULL,
    CONSTRAINT fk_CRMV_VET
    
    FOREIGN KEY (CRMV_veterinario) REFERENCES veterinario(CRMV),
    CONSTRAINT FK_Animal_Consulta
    FOREIGN KEY (id_animal) REFERENCES Animal(RFID)
);

CREATE TABLE Especialidade(
	IDespecialidade int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome varchar(100)
);

CREATE TABLE Certificacao(
	NumeroRegistro varchar(30) PRIMARY KEY NOT NULL,
    DataObtencao date,
    InstituicaoCertificadora varchar (50),
    CRMV_certif varchar(13),
    ID_especialidade int,
    FOREIGN KEY (CRMV_certif) REFERENCES veterinario (CRMV),
    FOREIGN KEY (ID_especialidade) REFERENCES Especialidade (IDespecialidade)
);

CREATE TABLE tratamento(
	id varchar(36) PRIMARY KEY NOT NULL,
    antibiotico boolean NOT NULL,
    id_consulta varchar(36) NOT NULL,
    descricao_tratamento varchar(255) not null,
    CONSTRAINT FK_id_consulta
    FOREIGN KEY (id_consulta) REFERENCES consulta(id)
);

CREATE TABLE log_auditoria (
	id_log INT PRIMARY KEY AUTO_INCREMENT,
    acao_realizada varchar(255) NOT NULL,
    tabela_afetada varchar(100),
    id_registro_afetado varchar(100),
    data_hora DATETIME NOT NULL
);

CREATE TABLE grupos_usuarios (
	idgrupo INT PRIMARY KEY AUTO_INCREMENT,
	nome_grupo VARCHAR(50) NOT NULL UNIQUE,
	descricao TEXT
);

CREATE TABLE usuarios (
	id_usuario VARCHAR(36) PRIMARY KEY NOT NULL,
    login VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    nome_completo VARCHAR(100),
    id_grupo int,
    ativo BOOLEAN DEFAULT 1,
    FOREIGN KEY (id_grupo) REFERENCES grupos_usuarios(idgrupo)
);

