SET SERVEROUTPUT ON
SET VERIFY OFF
SET LINE 3500
SET  ECHO ON
Prompt ******  fichas  ....
CREATE TABLE fichas(
 id number(10) NOT NULL,
 nombre varchar2(50) NULL,
 color varchar2(50) NULL,
 alias varchar2(50) NULL,
 peso number(10) NULL,
 CONSTRAINT PK_fichas PRIMARY KEY(id)
);
Prompt ******  jugadas  ....
CREATE TABLE jugadas(
 id number(10) NOT NULL,
 id_partida number(10) NULL,
 id_usuario number(10) NULL,
 id_ficha number(10) NULL,
 posicion_inicial varchar2(50) NULL,
 posicion_final varchar2(50) NULL,
 fecha_hora TIMESTAMP NULL,
 CONSTRAINT PK_jugadas PRIMARY KEY(id)
);
Prompt ******  partidas  ....
CREATE TABLE partidas(
 id number(10) NOT NULL,
 id_usuario number(10) NULL,
 id_usuario_rival number(10) NULL,
 nombre varchar2(50) NULL,
 color_ficha_juega varchar2(50) NULL,
 puntos_a_favor number(10) NULL,
 puntos_en_contra number(10) NULL,
 estatus varchar2(50) NULL,
 CONSTRAINT PK_partida PRIMARY KEY(id)
);
Prompt ******  posiciones  ....
CREATE TABLE posiciones(
 id number(10) NOT NULL,
 fila varchar2(50) NULL,
 columna varchar2(50) NULL,
 id_ficha number(10) NULL,
 id_partida number(10) NULL,
 CONSTRAINT PK_posiciones PRIMARY KEY(id)
);
Prompt ******  usuarios  ....
CREATE TABLE usuarios(
 id number(10) NOT NULL,
 nombre varchar2(50) NULL,
 contrasenna varchar2(50) NULL,
 ensesion  varchar2(50) NULL,
 CONSTRAINT PK_users PRIMARY KEY (id)
);

Prompt ******  FK_jugadas_partida  ....
ALTER TABLE jugadas ADD CONSTRAINT FK_jugadas_partida FOREIGN KEY(id_partida)REFERENCES partidas(id);
Prompt ******  FK_jugadas_usuario  ....
ALTER TABLE jugadas ADD CONSTRAINT FK_jugadas_usuario FOREIGN KEY(id_usuario)REFERENCES usuarios(id);
Prompt ******  FK_jugadas_fichas  ....
ALTER TABLE jugadas ADD CONSTRAINT FK_jugadas_fichas FOREIGN KEY(id_ficha)REFERENCES fichas(id);
Prompt ******  FK_partida_users  ....
ALTER TABLE partidas ADD CONSTRAINT FK_partida_users FOREIGN KEY(id_usuario)REFERENCES usuarios(id);
Prompt ******  FK_posiciones_ficha  ....
ALTER TABLE posiciones ADD CONSTRAINT FK_posiciones_ficha FOREIGN KEY(id_ficha)REFERENCES fichas(id);
Prompt ******  FK_posiciones_partida  ....
ALTER TABLE posiciones ADD CONSTRAINT FK_posiciones_partida FOREIGN KEY(id_partida)REFERENCES partidas(id);
Prompt ******  SEQUENCEincrementidficha  ....

CREATE SEQUENCE incrementidficha
START WITH 1
INCREMENT BY 1
CACHE 100;
Prompt ******  SEQUENCEincrementidjugada  ....
CREATE SEQUENCE incrementidjugada
START WITH 1
INCREMENT BY 1
CACHE 100;
Prompt ******  SEQUENCEincrementidpartida  ....
CREATE SEQUENCE incrementidpartida
START WITH 1
INCREMENT BY 1
CACHE 100;
Prompt ******  SEQUENCEincrementidposicion  ....
CREATE SEQUENCE incrementidposicion
START WITH 1
INCREMENT BY 1
CACHE 100;
Prompt ******  SEQUENCEincrementidusuario  ....
CREATE SEQUENCE incrementidusuario
START WITH 1
INCREMENT BY 1
CACHE 100;

SELECT * FROM CAT;