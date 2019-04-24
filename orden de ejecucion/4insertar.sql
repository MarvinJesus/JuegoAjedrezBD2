 ---------------------------------------
 Prompt ******  Insertar usuarios  ....
 insert into usuarios (id,nombre,contrasenna,ensesion) 
 values(incrementidusuario.nextval,'luis',123,'true');
 
 insert into usuarios (id,nombre,contrasenna,ensesion) 
 values(incrementidusuario.nextval,'monge',123,'true');
 
 insert into usuarios (id,nombre,contrasenna,ensesion) 
 values(incrementidusuario.nextval,'marvin',123,'true');
 
 insert into usuarios (id,nombre,contrasenna,ensesion) 
 values(incrementidusuario.nextval,'calvo',123,'true');
  ---------------------------------------
 Prompt ******  Insertar fichas blancas....
 insert into fichas (id,nombre,color,alias,peso) 
 values(0,'NULL','NULL',' ',0);
 
 insert into fichas (id,nombre,color,alias,peso) 
 values(INCREMENTIDFICHA.nextval,'TORRE','BLANCAS','T',4);
 
 insert into fichas (id,nombre,color,alias,peso) 
 values(INCREMENTIDFICHA.nextval,'CABALLO','BLANCAS','C',4);
 
 insert into fichas (id,nombre,color,alias,peso) 
 values(INCREMENTIDFICHA.nextval,'ALFIL','BLANCAS','A',4);
 
 insert into fichas (id,nombre,color,alias,peso) 
 values(INCREMENTIDFICHA.nextval,'REINA','BLANCAS','D',8);

 insert into fichas (id,nombre,color,alias,peso) 
 values(INCREMENTIDFICHA.nextval,'REY','BLANCAS','R',60);
 
 insert into fichas (id,nombre,color,alias,peso) 
 values(INCREMENTIDFICHA.nextval,'PEON','BLANCAS','P',1);
 -------------------------------------------------
 Prompt ******  Insertar fichas negras....
 insert into fichas (id,nombre,color,alias,peso) 
 values(INCREMENTIDFICHA.nextval,'TORRE','NEGRAS','T',4);
 
 insert into fichas (id,nombre,color,alias,peso) 
 values(INCREMENTIDFICHA.nextval,'CABALLO','NEGRAS','C',4);
 
 insert into fichas (id,nombre,color,alias,peso) 
 values(INCREMENTIDFICHA.nextval,'ALFIL','NEGRAS','A',4);
 
 insert into fichas (id,nombre,color,alias,peso) 
 values(INCREMENTIDFICHA.nextval,'REINA','NEGRAS','D',8);
 
 insert into fichas (id,nombre,color,alias,peso) 
 values(INCREMENTIDFICHA.nextval,'REY','NEGRAS','R',60);
 
 insert into fichas (id,nombre,color,alias,peso) 
 values(INCREMENTIDFICHA.nextval,'PEON','NEGRAS','P',1);
 -------------------------------------------------
  Prompt ******  Crear partidas....
 exec crearpartida('El Gran Juego','luis','marvin');
 exec crearpartida('Mi Revancha','luis','monge');
 exec crearpartida('Bajo El Cosmos','calvo','marvin');
 exec crearpartida('Al Borde','calvo','monge');
 Prompt ******  Hacer jugadas partida1 ....
 exec moverficha(1,'A2','A3');
 exec moverficha(1,'A7','A6');
 exec moverficha(1,'B2','B3');
 exec moverficha(1,'B7','B6');
 exec moverficha(1,'B3','B4');
 exec moverficha(1,'B6','B5');
 exec moverficha(1,'B4','B5');
 Prompt ******  Hacer jugadas partida2 ....
 exec moverficha(2,'A2','A3');
 exec moverficha(2,'A7','A6');
 exec moverficha(2,'B2','B3');
 exec moverficha(2,'B7','B6');
 exec moverficha(2,'B3','B4');
 exec moverficha(2,'B6','B5');
 exec moverficha(2,'C2','C3');
 exec moverficha(2,'B5','B4');
  Prompt ******  Hacer jugadas partida3 ....
 exec moverficha(3,'A2','A3');
 exec moverficha(3,'A7','A6');
 exec moverficha(3,'B2','B3');
 exec moverficha(3,'B7','B6');
 exec moverficha(3,'B3','B4');
 exec moverficha(3,'B6','B5');
 exec moverficha(3,'C2','C3');
 exec moverficha(3,'B5','B4');
  ---------------------------------------