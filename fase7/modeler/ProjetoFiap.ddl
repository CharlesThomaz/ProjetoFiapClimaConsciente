-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2024-06-18 11:46:08 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE alerta (
    alerta_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    data_alerta DATETIME NOT NULL
);

CREATE TABLE usuario (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    papel ENUM('admin', 'user') NOT NULL
);

CREATE TABLE projeto (
    projeto_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    data_criacao DATETIME NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES usuario(user_id)
);

CREATE TABLE curso (
    curso_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    conteudo TEXT,
    data_criacao DATETIME NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES usuario(user_id)
);

CREATE TABLE dadosambientais (
    data_id INT PRIMARY KEY AUTO_INCREMENT,
    temperatura FLOAT NOT NULL,
    qualidade_ar FLOAT NOT NULL,
    nivel_co2 FLOAT NOT NULL,
    taxa_desmatamento FLOAT NOT NULL,
    timestamp DATETIME NOT NULL
);

CREATE TABLE questionario (
    quiz_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    perguntas TEXT NOT NULL,
    curso_id INT NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES curso(curso_id)
);

CREATE TABLE discussao (
    discussao_id INT PRIMARY KEY AUTO_INCREMENT,
    comentario TEXT NOT NULL,
    data_comentario DATETIME NOT NULL,
    projeto_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (projeto_id) REFERENCES projeto(projeto_id),
    FOREIGN KEY (user_id) REFERENCES usuario(user_id)
);

CREATE TABLE usuario_curso (
    user_id INT NOT NULL,
    curso_id INT NOT NULL,
    PRIMARY KEY (user_id, curso_id),
    FOREIGN KEY (user_id) REFERENCES usuario(user_id),
    FOREIGN KEY (curso_id) REFERENCES curso(curso_id)
);

CREATE TABLE usuario_questionario (
    user_id INT NOT NULL,
    quiz_id INT NOT NULL,
    PRIMARY KEY (user_id, quiz_id),
    FOREIGN KEY (user_id) REFERENCES usuario(user_id),
    FOREIGN KEY (quiz_id) REFERENCES questionario(quiz_id)
);




-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                  34
-- WARNINGS                                 0
