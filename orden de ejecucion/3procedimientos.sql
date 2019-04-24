SET SERVEROUTPUT ON
SET VERIFY OFF
SET LINE 3500
SET  ECHO ON
--------------------------------------------------------------------------------
Prompt ******  PROCEDUREMOSTRARFIGURA ....
  CREATE OR REPLACE PROCEDURE MOSTRARFIGURA( 
  PNOMBRE VARCHAR2 
 )
 IS
 VALOR VARCHAR2(255) DEFAULT  UPPER(PNOMBRE);
 BEGIN
   CASE VALOR 
	WHEN 'TITULO' THEN
  DBMS_OUTPUT.PUT_LINE('
                       __                               _               _          _              
                       \ \ _   _  ___  __ _  ___     __| | ___    __ _ (_) ___  __| |_ __ ___ ____
                        \ \ | | |/ _ \/ _  |/ _ \   / _  |/ _ \  / _  || |/ _ \/ _  |  __/ _ \_  /
                     /\_/ / |_| |  __/ (_| | (_) | | (_| |  __/ | (_| || |  __/ (_| | | |  __// / 
                     \___/ \__,_|\___|\__, |\___/   \__,_|\___|  \__,_|/ |\___|\__,_|_|  \___/___|
                                      |___/                          |__/                         
                                                                                         _:_
                                                                                         -.- 
                                                                               ()      __.|.__
                                                                            .-:--:-.  |_______|
                                                                     ()      \____/    \=====/
                                                                     /\      {====}     )___(
                                                          (\=-      //\\      )__(     /_____\
                                          __    ||-|-||  //  .\    (    )    /____\     |   |
                                         /  \   |_____| (( \_  \    )__(      |  |      |   |
                                         \__/    |===|   ))  `\_)  /____\     |  |      |   |
                                        /____\   |   |  (/     \    |  |      |  |      |   |
                                         |  |    |   |   | _.- |    |  |      |  |      |   |
                                         |__|    )___(    )___(    /____\    /____\    /_____\
                                        (====)  (=====)  (=====)  (======)  (======)  (=======)
                                        }===={  }====={  }====={  }======{  }======{  }======={
                                       (______)(_______)(_______)(________)(________)(_________)
   ');
    
	WHEN 'PEON' THEN
     DBMS_OUTPUT.PUT_LINE('
                                __    
                               /  \
                               \__/
                              /____\
                               |  |
                               |__|
                              (====)
                              }===={
                             (______)
                         El peon se movio
	'); 
	WHEN 'TORRE' THEN
     DBMS_OUTPUT.PUT_LINE('
                             ||-|-|| 
                             |_____| 
                              |===|  
                              |   | 
                              |   |  
                              )___(   
                             (=====)  
                             }====={ 
                            (_______)
                       La torre se movio
     ');
	 
	WHEN 'CABALLO' THEN
     DBMS_OUTPUT.PUT_LINE('
                              (\=- 
                             //  .\ 
                            (( \_  \
                             ))  `\_)
                            (/     \
                             | _.- |
                              )___( 
                             (=====)
                             }====={
                            (_______)
                      El caballo se movio
    ');
	WHEN 'ALFIL' THEN
     DBMS_OUTPUT.PUT_LINE('
                              ()
                             //\\
                            (    )
                             )__( 
                            /____\  
                             |  | 
                             |  |
                            /____\   
                           (======)
                           }======{
                          (________)
                       El alfil se movio
     ');
    WHEN 'RINA' THEN
     DBMS_OUTPUT.PUT_LINE('
                             ()
                          .-:--:-.
                           \____/
                           {====}
                            )__( 
                           /____\
                            |  |
                            |  |
                            |  |
                            |  |
                           /____\
                          (======)
                          }======{
                         (________)
                      La reina se movio
   ');
   WHEN 'REY' THEN
     DBMS_OUTPUT.PUT_LINE('
                           _:_
                           -.- 
                         __.|.__
                        |_______|
                         \=====/
                          )___(
                         /_____\
                          |   |
                          |   |
                          |   |
                          |   |
                          |   |
                         /_____\
                        (=======)
                       (_________)
                      El rey se movio
         ');
    WHEN 'ESTADISTICA' THEN
     DBMS_OUTPUT.PUT_LINE('
                              _            _ _     _   _               
                     ___  ___| |_ __ _  __| (_)___| |_(_) ___ __ _ ___ 
                    / _ \/ __| __/ _  |/ _  | / __| __| |/ __/ _  / __|
                   |  __/\__ \ || (_| | (_| | \__ \ |_| | (_| (_| \__ \
                    \___||___/\__\__,_|\__,_|_|___/\__|_|\___\__,_|___/
                                                  
         ');
    WHEN 'PARTIDAS' THEN
     DBMS_OUTPUT.PUT_LINE('
                                                             _   _     _           
                                            _ __   __ _ _ __| |_(_) __| | __ _ ___ 
                                           |  _ \ / _  |  __| __| |/ _  |/ _  / __|
                                           | |_) | (_| | |  | |_| | (_| | (_| \__ \
                                           |  __/ \__,_|_|   \__|_|\__,_|\__,_|___/
                                           |_| 
                                                  
         ');
   ELSE
    DBMS_OUTPUT.PUT_LINE(':|');
   END CASE;
 END;
 /   
 --------------------------------------------------------------------------------
Prompt ******  PROCEDURECREARUSUARIO  ....
CREATE OR REPLACE PROCEDURE CREARUSUARIO
(
	pnombre usuarios.nombre%type,
	pcontrasenna usuarios.contrasenna%type
)
IS
 ensesion usuarios.ensesion%type default 'false';
 yaexiste_nombre EXCEPTION;
 cursor cusuarios(vnombre varchar2) IS SELECT nombre FROM usuarios WHERE upper(trim(nombre)) = upper(trim(vnombre));
 nombre usuarios.nombre%type;
BEGIN
 open cusuarios(pnombre);
 fetch cusuarios into nombre;
  if cusuarios%found then
   RAISE yaexiste_nombre;
  end if;
 close cusuarios;
 insert into usuarios (id,nombre,contrasenna,ensesion) values(incrementidusuario.nextval,pnombre,pcontrasenna,ensesion);
 commit;
  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
  DBMS_OUTPUT.PUT_LINE('|                                            El usuario '||pnombre||' se creo con exito. ');
  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
EXCEPTION
	when yaexiste_nombre then
	    DBMS_OUTPUT.PUT_LINE('|           **************************************************************************************************');
        DBMS_OUTPUT.PUT_LINE('|           ************  Ya existe ese nombre de usuario en el sistema.Intente con otro nombre.  ************');
        DBMS_OUTPUT.PUT_LINE('|           **************************************************************************************************');
END;
/
--------------------------------------------------------------------------------
Prompt ******  PROCEDURELOGIN  ....
CREATE OR REPLACE PROCEDURE LOGIN
(
	pnombre usuarios.nombre%type,
	pcontrasenna usuarios.contrasenna%type
)
IS
 sesion usuarios.ensesion%type := 'true';
 error_autentificacion EXCEPTION;
 cursor cusuarios(vnombre varchar2,pcontrasenna varchar2) IS SELECT id,nombre FROM usuarios 
 WHERE upper(trim(nombre)) = upper(trim(vnombre)) and contrasenna = pcontrasenna;
 id usuarios.id%type;
 nombre usuarios.nombre%type;
BEGIN
 open cusuarios(pnombre,pcontrasenna);
 fetch cusuarios into id, nombre;
  if cusuarios%found then
	update usuarios set usuarios.ensesion = sesion where usuarios.id = id;
	commit;
	DBMS_OUTPUT.PUT_LINE('|                             ***************************************************************** ');
	DBMS_OUTPUT.PUT_LINE('|                                  El usuario '||pnombre||' a iniciado sesion con exito.');
    DBMS_OUTPUT.PUT_LINE('|                             ***************************************************************** ');
  else
    RAISE error_autentificacion;
  end if;
 close cusuarios;
EXCEPTION
 when error_autentificacion then
  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
  DBMS_OUTPUT.PUT_LINE('|                                  ***************  Las credenciales no son validas  *************** ');
  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');	
END;
/
--------------------------------------------------------------------------------
Prompt ******  PROCEDURELOGOUT  ....
CREATE OR REPLACE PROCEDURE LOGOUT
(
	pnombre usuarios.nombre%type,
	pcontrasenna usuarios.contrasenna%type
)
IS
 sesion usuarios.ensesion%type := 'false';
 error_autentificacion EXCEPTION;
 cursor cusuarios(vnombre varchar2,pcontrasenna varchar2) IS SELECT id,nombre FROM usuarios 
 WHERE upper(trim(nombre)) = upper(trim(vnombre)) and contrasenna = pcontrasenna;
 id usuarios.id%type;
 nombre usuarios.nombre%type;
BEGIN
 open cusuarios(pnombre,pcontrasenna);
 fetch cusuarios into id, nombre;
  if cusuarios%found then
	update usuarios set usuarios.ensesion = sesion where usuarios.id = id;
	commit;
	DBMS_OUTPUT.PUT_LINE('|                             ***************************************************************** ');
	DBMS_OUTPUT.PUT_LINE('|                                  La sesion del usuario '||pnombre||' se cerro con exito.' );
    DBMS_OUTPUT.PUT_LINE('|                             ***************************************************************** ');	
  else
    RAISE error_autentificacion;
  end if;
 close cusuarios;
EXCEPTION
 when error_autentificacion then
  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
  DBMS_OUTPUT.PUT_LINE('|                                  ***************  Las credenciales no son validas  *************** ');
  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
END;
/

 --------------------------------------------------------------------------------
Prompt ******   PROCEDUREMOSTRARTABLERO ....
CREATE OR REPLACE PROCEDURE MOSTRARTABLERO
(
	id_partida partidas.id%type
)
IS
 cursor cposiciones(pid_partida number) is select  DISTINCT fila from posiciones 
 where posiciones.id_partida = pid_partida order by  posiciones.fila desc;

 cursor cfila(pfila varchar2, pid_partida number) is select posiciones.fila, posiciones.id_ficha,fichas.alias, fichas.color
 from posiciones 
 join fichas on fichas.id = posiciones.id_ficha
 where posiciones.fila = pfila and pid_partida = posiciones.id_partida order by  posiciones.columna asc;
 
 cursor partida(pid_partida number ) is select usuarios.nombre, partidas.id_usuario_rival,partidas.NOMBRE as nombrePartida,
 color_ficha_juega,  partidas.PUNTOS_A_FAVOR ,partidas.PUNTOS_EN_CONTRA, partidas.ESTATUS from partidas 
 join usuarios on partidas.id_usuario = usuarios.id 
 where partidas.id = pid_partida;

 txtfilas varchar2(255) default '';
 txtcolumnas varchar2(255) default'|';
 numberascii number(10) default 65;
 nombre_rival varchar2(255) default'';
 
BEGIN

 for usuario in partida(id_partida)
 loop
      MOSTRARFIGURA('TITULO');
	 select nombre into nombre_rival from usuarios where id = usuario.id_usuario_rival;
	 DBMS_OUTPUT.PUT_LINE('|                                                          BLANCAS: '||usuario.nombre||'|PUNTOS: '||usuario.PUNTOS_A_FAVOR||'');
	 DBMS_OUTPUT.PUT_LINE('|                                                          NEGRAS: '||nombre_rival   ||'|PUNTOS: '||usuario.PUNTOS_EN_CONTRA||'');
	 DBMS_OUTPUT.PUT_LINE('|                                                          MUEVE : '||RPAD(usuario.color_ficha_juega,15,' '));
	 DBMS_OUTPUT.PUT_LINE('|                                                          ESTATUS : '||usuario.ESTATUS);
	 DBMS_OUTPUT.PUT_LINE(RPAD('|',45,' '));
	 for posiciones in cposiciones(id_partida) 
	 loop
		txtcolumnas := txtcolumnas||'  '|| CHR( numberascii)||'   ';
		numberascii := numberascii + 1 ;
		DBMS_OUTPUT.PUT_LINE(RPAD('|',45,' ')||'|-'||RPAD('-',45,'-')||'-|');
		DBMS_OUTPUT.PUT_LINE(RPAD('|',45,' ')||RPAD('|',45,'     |')||'   |');
		txtfilas := txtfilas || '|';
		for vposiciones in cfila(posiciones.fila,id_partida)
		loop
			
			if(vposiciones.color = 'NEGRAS') then
				txtfilas := txtfilas || '  ' ||vposiciones.alias||'. |';
			else
				txtfilas := txtfilas || '  ' ||vposiciones.alias||'  |';
			end if;
			
		end loop;
		if txtfilas = '|' then
			DBMS_OUTPUT.PUT_LINE(RPAD('|',45,' ')||RPAD('|',45,'     |')||'   | '||posiciones.fila);
		else
			DBMS_OUTPUT.PUT_LINE(RPAD('|',45,' ')||txtfilas||' '||posiciones.fila);
		end if;

		DBMS_OUTPUT.PUT_LINE(RPAD('|',45,' ')||RPAD('|',45,'     |')||'   |');
		txtfilas := '';
	 end loop;
	 DBMS_OUTPUT.PUT_LINE(RPAD('|',45,' ')||'|-'||RPAD('-',45,'-')||'-|');
	 DBMS_OUTPUT.PUT_LINE(RPAD('|',45,' ')||SUBSTR(txtcolumnas, 1, LENGTH(txtcolumnas)-1) ||'|');
 end loop;
 
 EXCEPTION
 when NO_DATA_FOUND then
  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
  DBMS_OUTPUT.PUT_LINE('|                                  ********** No existe un usuario rival con ese id. *************** ');
  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
END;
/
 
--------------------------------------------------------------------------------
Prompt ******   PROCEDUREMONTARTABLERO ....
SET SERVEROUTPUT ON
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE MONTARTABLERO
(
 pidpartida partidas.id%type
)
IS
 type array_fichas is varray(9) of varchar2(10);
 array_orden_fichas array_fichas;
 
 type array_columnas is varray(8) of varchar2(4);
 array_orden_columnas array_columnas;
 
 type array_filas is varray(8) of varchar2(4);
 array_orden_filas  array_filas;

 colorficha  varchar2(10):='BLANCAS';
 id_ficha fichas.id%type;
BEGIN 
 array_orden_fichas := array_fichas('TORRE', 'CABALLO', 'ALFIL','REINA','REY','ALFIL','CABALLO','TORRE','PEON');
 array_orden_columnas := array_columnas('A', 'B', 'C','D','E','F','G','H');
 array_orden_filas := array_filas('1', '2', '3','4','5','6','7','8');
 for i in 1..array_orden_filas.count loop
   if i <= 2 then
     for j in 1..array_orden_columnas.count loop
		if i = 2 then
		  select id into id_ficha from fichas 
		  where nombre = array_orden_fichas(9) and color = colorficha;
		else
		  select id into id_ficha from fichas 
		  where nombre = array_orden_fichas(j) and color = colorficha;
		end if;
		insert into posiciones(ID,FILA,COLUMNA,ID_FICHA,ID_PARTIDA)
		values(INCREMENTIDPOSICION.nextval,array_orden_filas(i),array_orden_columnas(j),id_ficha,pidpartida);
     end loop;
   end if;
   
   if i >= 7  then
	 colorficha := 'NEGRAS';
     for j in 1..array_orden_columnas.count loop
		if i = 7 then
		  select id into id_ficha from fichas 
		  where nombre = array_orden_fichas(9) and color = colorficha;
		else
		  select id into id_ficha from fichas 
		  where nombre = array_orden_fichas(j) and color = colorficha;
		end if;
		insert into posiciones(ID,FILA,COLUMNA,ID_FICHA,ID_PARTIDA)
		values(INCREMENTIDPOSICION.nextval,array_orden_filas(i),array_orden_columnas(j),id_ficha,pidpartida);
     end loop;
   end if;
   
   if i < 7 and i > 2  then
     for j in 1..array_orden_columnas.count loop
		insert into posiciones(ID,FILA,COLUMNA,ID_PARTIDA,ID_FICHA)
		values(INCREMENTIDPOSICION.nextval,array_orden_filas(i),array_orden_columnas(j),pidpartida,0);
     end loop;
   end if;
 end loop;
 MOSTRARTABLERO(pidpartida);
EXCEPTION 
WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('|           *************************************************** ');
  DBMS_OUTPUT.PUT_LINE('|           ********** El no se encontro valor  *************** ');
  DBMS_OUTPUT.PUT_LINE('|           *************************************************** ');
WHEN OTHERS THEN
  DBMS_OUTPUT.put_line('Errorz:'||TO_CHAR(SQLCODE));
  DBMS_OUTPUT.put_line(SQLERRM);
END;
/ 
--------------------------------------------------------------------------------
Prompt ******  PROCEDURECREARPARTIDA ....
CREATE OR REPLACE PROCEDURE CREARPARTIDA
(
	pnombrepartida partidas.nombre%type,
	pnombre usuarios.nombre%type,
	pnombreRival usuarios.nombre%type
)
IS
 sesion usuarios.ensesion%type := '';
 error_autentificacion EXCEPTION;
 error_sesion EXCEPTION;
 cursor cusuarios(vnombre varchar2) IS SELECT id,nombre,ensesion FROM usuarios WHERE upper(trim(nombre)) = upper(trim(vnombre));
 idusuario usuarios.id%type;
 nombre usuarios.nombre%type;
 idpartida partidas.id%type; 
 nombre_usuario_rival usuarios.nombre%type;
 idrival usuarios.ID%type;
BEGIN
 select usuarios.nombre,id into nombre_usuario_rival,idrival from usuarios where upper(trim(usuarios.nombre)) = upper(trim(pnombreRival));
 open cusuarios(pnombre);
 fetch cusuarios into idusuario, nombre,sesion;
  if cusuarios%found then
	if sesion = 'true'then
	   idpartida := INCREMENTIDPARTIDA.nextval;
	   insert into partidas (ID,ID_USUARIO,id_usuario_rival,NOMBRE,color_ficha_juega,PUNTOS_A_FAVOR,PUNTOS_EN_CONTRA,ESTATUS) 
	   values(idpartida,idusuario,idrival,pnombrepartida,'BLANCAS',100,100,'EMPATE');
	   MONTARTABLERO(idpartida);
	   commit;
	else
	   RAISE error_sesion;
	end if;
  else
    RAISE error_autentificacion;
  end if;
 close cusuarios;
EXCEPTION
 when NO_DATA_FOUND then
  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
  DBMS_OUTPUT.PUT_LINE('|                                  **********  No existe un usuario rival con ese nombre.  ********* ');
  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
 when error_autentificacion then
  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
  DBMS_OUTPUT.PUT_LINE('|                                  **************    Las credenciales no son validas  ************** ');
  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
 when error_sesion then
  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
  DBMS_OUTPUT.PUT_LINE('|                                  *****************    Debe iniciar sesion primero   ************** ');
  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
  WHEN OTHERS THEN
  DBMS_OUTPUT.put_line('Error:'||TO_CHAR(SQLCODE));
  DBMS_OUTPUT.put_line(SQLERRM);
END;
/
--------------------------------------------------------------------------------
Prompt ******  PROCEDURECOMERFICHA ....
CREATE OR REPLACE PROCEDURE COMERFICHA(
	pID_PARTIDA IN PARTIDAS.ID%TYPE,
	pID_POSICION_INICIO IN POSICIONES.ID%TYPE,
	pID_POSICION_FINAL IN POSICIONES.ID%TYPE
)
IS
    cursor getPosicion(pid number,pid_partid NUMBER) is select * from posiciones 
	where ID = pid AND ID_PARTIDA = pid_partid ;
	cursor getFicha(pid number) is select * from fichas where ID = pid;
	cursor getPartida(pid number) is select * from partidas  where ID = pid;
	COLUMNA_INICIO POSICIONES.COLUMNA%TYPE DEFAULT 'NULL';
	COLUMNA_FINAL  POSICIONES.COLUMNA%TYPE DEFAULT 'NULL';
	FILA_INICIO POSICIONES.FILA%TYPE DEFAULT 'NULL';
	FILA_FINAL POSICIONES.FILA%TYPE DEFAULT 'NULL';
	TODO_BIEN BOOLEAN DEFAULT FALSE;
	ID_FICHA_INICIO FICHAS.ID%TYPE DEFAULT NULL;
	ID_FICHA_FINAL FICHAS.ID%TYPE DEFAULT NULL;
	COLOR_FICHA_INICIO FICHAS.COLOR%TYPE DEFAULT 'NULL';
	COLOR_FICHA_FINAL FICHAS.COLOR%TYPE DEFAULT 'NULL';
	NOMBRE_FICHA_INICIO FICHAS.NOMBRE%TYPE DEFAULT 'NULL';
	NOMBRE_FICHA_FINAL FICHAS.NOMBRE%TYPE DEFAULT 'NULL';
	PESO_FICHA_INICIO FICHAS.PESO%TYPE DEFAULT 0;
	PESO_FICHA_FINAL FICHAS.PESO%TYPE DEFAULT 0;
	PUNTOS_AFAVOR PARTIDAS.PUNTOS_A_FAVOR%TYPE;
	PUNTOS_ENCONTRA PARTIDAS.PUNTOS_EN_CONTRA %TYPE;
	BEGIN
	for posicio in getPosicion(pID_POSICION_INICIO,pID_PARTIDA) loop 
        COLUMNA_INICIO  := posicio.COLUMNA;
		FILA_INICIO := posicio.FILA;
		ID_FICHA_INICIO := posicio.ID_FICHA;
	end loop;
	for posicio in getPosicion(pID_POSICION_FINAL,pID_PARTIDA) loop 
        COLUMNA_FINAL  := posicio.COLUMNA;
		FILA_FINAL := posicio.FILA;
		ID_FICHA_FINAL := posicio.ID_FICHA;
	end loop;
	for ficha in getFicha(ID_FICHA_INICIO) loop 
		COLOR_FICHA_INICIO := ficha.color;
		NOMBRE_FICHA_INICIO := ficha.nombre;
		PESO_FICHA_INICIO := ficha.peso;
	end loop;
	for ficha in getFicha(ID_FICHA_FINAL) loop 
		COLOR_FICHA_FINAL := ficha.color;
		NOMBRE_FICHA_FINAL := ficha.nombre;
		PESO_FICHA_FINAL := ficha.peso;
	end loop;
	for partida in getPartida(pid_partida) loop
		PUNTOS_ENCONTRA := partida.PUNTOS_EN_CONTRA;
		PUNTOS_AFAVOR := partida.PUNTOS_A_FAVOR;
	 end loop;
	case COLOR_FICHA_INICIO
	   when 'BLANCAS' then
		   IF COLOR_FICHA_FINAL = 'NEGRAS' THEN 
			 UPDATE POSICIONES SET ID_FICHA = 0 
			 WHERE ID = pID_POSICION_FINAL AND ID_PARTIDA = pID_PARTIDA;
			 IF  (PUNTOS_ENCONTRA - PESO_FICHA_FINAL) = PUNTOS_AFAVOR THEN
				UPDATE PARTIDAS SET PUNTOS_EN_CONTRA   = PUNTOS_EN_CONTRA - PESO_FICHA_FINAL,
				ESTATUS = 'EMPATE'
			    WHERE ID = pID_PARTIDA;
			 ELSIF (PUNTOS_ENCONTRA - PESO_FICHA_FINAL) > PUNTOS_AFAVOR THEN
			    UPDATE PARTIDAS SET PUNTOS_EN_CONTRA = PUNTOS_EN_CONTRA - PESO_FICHA_FINAL,
				ESTATUS = 'PERDIENDO'
			    WHERE ID = pID_PARTIDA;
			 ELSIF (PUNTOS_ENCONTRA - PESO_FICHA_FINAL) < PUNTOS_AFAVOR THEN 
			    UPDATE PARTIDAS SET PUNTOS_EN_CONTRA = PUNTOS_EN_CONTRA - PESO_FICHA_FINAL,
				ESTATUS = 'GANANDO'
			    WHERE ID = pID_PARTIDA;
			ELSIF (PUNTOS_ENCONTRA - PESO_FICHA_FINAL) = 0  THEN 
			    UPDATE PARTIDAS SET PUNTOS_A_FAVOR = PUNTOS_A_FAVOR - PESO_FICHA_INICIO,
				ESTATUS = 'GANO'
			    WHERE ID = pID_PARTIDA; 
			 END IF;
			 COMMIT;
		   END IF;
	   when 'NEGRAS' then
		   IF COLOR_FICHA_FINAL = 'BLANCAS' THEN 
			  UPDATE POSICIONES SET ID_FICHA = 0 
			  WHERE ID = pID_POSICION_FINAL AND ID_PARTIDA = pID_PARTIDA;

			  IF ( PUNTOS_AFAVOR   -  PESO_FICHA_INICIO ) = PUNTOS_ENCONTRA THEN
			    UPDATE PARTIDAS SET PUNTOS_A_FAVOR = PUNTOS_A_FAVOR - PESO_FICHA_INICIO,
				ESTATUS = 'EMPATE'
			    WHERE ID = pID_PARTIDA; 
			 ELSIF ( PUNTOS_AFAVOR - PESO_FICHA_INICIO ) < PUNTOS_ENCONTRA THEN
			    UPDATE PARTIDAS SET PUNTOS_A_FAVOR = PUNTOS_A_FAVOR - PESO_FICHA_INICIO,
				ESTATUS = 'PERDIENDO'
			    WHERE ID = pID_PARTIDA; 
			 ELSIF (PUNTOS_AFAVOR - PESO_FICHA_INICIO) > PUNTOS_ENCONTRA THEN 
			    UPDATE PARTIDAS SET PUNTOS_A_FAVOR = PUNTOS_A_FAVOR - PESO_FICHA_INICIO,
				ESTATUS = 'GANANDO'
			    WHERE ID = pID_PARTIDA; 
			ELSIF (PUNTOS_AFAVOR - PESO_FICHA_INICIO) = 0 THEN 
			    UPDATE PARTIDAS SET PUNTOS_A_FAVOR = PUNTOS_A_FAVOR - PESO_FICHA_INICIO,
				ESTATUS = 'PERDIO'
			    WHERE ID = pID_PARTIDA; 
			 END IF; 
			  COMMIT;
		   END IF;
		ELSE
		  COLOR_FICHA_INICIO := '';
	end case;  
END;
/
--------------------------------------------------------------------------------
Prompt ******  PROCEDUREMOVERFICHA ....
CREATE OR REPLACE PROCEDURE MOVERFICHA
(
 pid_partida  partidas.ID%type,
 ptxtposicion_inicial  jugadas.POSICION_INICIAL%type,
 ptxtposicion_final jugadas.POSICION_FINAL%type
)
IS
 filaInicio VARCHAR2(4) default 'NULL';
 filaFinal  VARCHAR2(4) default 'NULL';
 columnaInicio VARCHAR2(4) default 'NULL';
 columnaFinal VARCHAR2(4) default 'NULL';
 Id_Posicion_Inicio posiciones.ID%type default NULL;
 Id_Posicion_Final posiciones.ID%type default NULL;
 cursor getPosicion(pcolumn varchar2,pfila varchar2,pidpartida number) is select * from posiciones 
 where ((UPPER(columna) = UPPER(pcolumn) and UPPER(fila) = UPPER(pfila)) and id_partida = pidpartida) 
 or ((UPPER(columna) = UPPER(pfila) and UPPER(fila) = UPPER(pcolumn))  and id_partida = pidpartida);
 cursor getFicha(pid number) is select * from fichas where ID = pid;
 cursor getPartida(pid number) is select * from partidas  where ID = pid;
 siesta number(2) default 0;
 todobien boolean DEFAULT false;
 IDFICHA FICHAS.ID%type DEFAULT NULL;
 NOMBREFICHA FICHAS.NOMBRE%type DEFAULT NULL;
 COLORFICHAJUGANDO FICHAS.COLOR%TYPE DEFAULT NULL;
 COLORFICHAJUEGA PARTIDAS.COLOR_FICHA_JUEGA%TYPE DEFAULT NULL;
 IDUSUARIO PARTIDAS.ID_USUARIO%TYPE DEFAULT NULL;
 IDUSUARIORIVAL PARTIDAS.ID_USUARIO_RIVAL%TYPE DEFAULT NULL;
BEGIN 
 if LENGTH(TRIM(ptxtposicion_inicial)) <= 2 and LENGTH(TRIM(ptxtposicion_final)) <= 2 then 
	filaInicio := SUBSTR(ptxtposicion_inicial, 1, 1);
	columnaInicio := SUBSTR(ptxtposicion_inicial, 2,LENGTH(TRIM(ptxtposicion_inicial))-1);
	filaFinal := SUBSTR(ptxtposicion_final, 1, 1);
	columnaFinal := SUBSTR(ptxtposicion_final, 2,LENGTH(TRIM(ptxtposicion_final))-1);
	for posicioInicio in getPosicion(columnaInicio,filaInicio,pid_partida) loop
		Id_Posicion_Inicio := posicioInicio.ID;
		IDFICHA := posicioInicio.ID_FICHA;
    end loop;
	for posicioFinal in getPosicion(columnaFinal,filaFinal,pid_partida) loop
		 siesta := 1;
		Id_Posicion_Final := posicioFinal.ID;	
	end loop;
    if siesta = 0 then
	  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
	  DBMS_OUTPUT.PUT_LINE('|                                  *****   No se encontro una posicion con esas coordenada! ******** ');
	  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
	ELSE
	   for ficha in getFicha(IDFICHA) loop
		NOMBREFICHA := ficha.NOMBRE;
		COLORFICHAJUGANDO := ficha.COLOR;
	   end loop;
	   for partida in getPartida(pid_partida) loop
		COLORFICHAJUEGA := partida.COLOR_FICHA_JUEGA;
		IDUSUARIO := partida.ID_USUARIO;
		IDUSUARIORIVAL := partida.ID_USUARIO_RIVAL;
	   end loop;
	   IF COLORFICHAJUEGA = COLORFICHAJUGANDO THEN
	     todobien := VALIDADOR.VALIDARMOVIMIENTO(pid_partida,Id_Posicion_Inicio,Id_Posicion_Final);
	   END IF;
	  
    end if;
	if todobien then
		COMERFICHA(pid_partida,Id_Posicion_Inicio,Id_Posicion_Final);

		UPDATE POSICIONES SET POSICIONES.ID_FICHA = IDFICHA 
		WHERE ID = Id_Posicion_Final AND POSICIONES.ID_PARTIDA = pid_partida;		
		COMMIT;
		UPDATE POSICIONES SET POSICIONES.ID_FICHA = 0
		WHERE ID = Id_Posicion_Inicio AND POSICIONES.ID_PARTIDA = pID_PARTIDA;
		IF COLORFICHAJUGANDO  = 'BLANCAS' THEN 
		    UPDATE PARTIDAS SET COLOR_FICHA_JUEGA  = 'NEGRAS'
		    WHERE  ID = pid_partida;
		    INSERT INTO JUGADAS(id,ID_PARTIDA,ID_USUARIO,ID_FICHA,POSICION_INICIAL,POSICION_FINAL, FECHA_HORA  ) VALUES(INCREMENTIDJUGADA.nextval,pid_partida,IDUSUARIO,IDFICHA,ptxtposicion_inicial,ptxtposicion_final, TO_CHAR(SYSTIMESTAMP,'DD-MON-YYYY HH:MI:SS'));
		ELSE
		    UPDATE PARTIDAS SET COLOR_FICHA_JUEGA  = 'BLANCAS'
		    WHERE  ID = pid_partida;
			INSERT INTO JUGADAS(id,ID_PARTIDA,ID_USUARIO,ID_FICHA,POSICION_INICIAL,POSICION_FINAL, FECHA_HORA  ) VALUES(INCREMENTIDJUGADA.nextval,pid_partida,IDUSUARIORIVAL,IDFICHA,ptxtposicion_inicial,ptxtposicion_final, TO_CHAR(SYSTIMESTAMP,'DD-MON-YYYY HH:MI:SS'));
		END IF;
		COMMIT;
		MOSTRARTABLERO(pID_PARTIDA);
		DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
		DBMS_OUTPUT.PUT_LINE('|                                  *********************      TODO BIEN        ********************* ');
		DBMS_OUTPUT.PUT_LINE('|                                  *********************    MOVIDA CORRECTA    ********************* ');
		DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
		MOSTRARFIGURA(NOMBREFICHA);
	ELSE 
		MOSTRARTABLERO(pID_PARTIDA);
		DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
		DBMS_OUTPUT.PUT_LINE('|                                  *********************   MOVIDA NO ADECUADA  ********************* ');
		DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
		IF COLORFICHAJUEGA != COLORFICHAJUGANDO THEN
		 DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
		 DBMS_OUTPUT.PUT_LINE('|                                  *****************       NO ES TU TURNO      ********************* ');
		 DBMS_OUTPUT.PUT_LINE('|                                               ES EL TUNO DE LA FICHA COLOR '||SUBSTR(COLORFICHAJUEGA, 1 ,LENGTH(COLORFICHAJUEGA)-1));
		 DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
	    END IF;
    end if;
 else	
		DBMS_OUTPUT.PUT_LINE('|                                  ****************************************************************** ');
		DBMS_OUTPUT.PUT_LINE('|                                  *************** EL FORMATO INGRESADO NO ES CORRECTO  ************* ');
		DBMS_OUTPUT.PUT_LINE('|                                  *************** UN EJEMPLO DE UN FORMATO CORECTO ES: ************* ');	
		DBMS_OUTPUT.PUT_LINE('|                                  ***************        "A1" O "D6" O "2A"            ************* ');
		DBMS_OUTPUT.PUT_LINE('|                                  ****************************************************************** ');
 end if;
 
 EXCEPTION
	 when others then
		DBMS_OUTPUT.put_line('  Algo salio mal :(');
		DBMS_OUTPUT.put_line('  codigo del error :'||TO_CHAR(SQLCODE));
		DBMS_OUTPUT.put_line('  mensage del error :'||SQLERRM);
END;
/
--------------------------------------------------------------------------------
Prompt ******  PROCEDUREESTADISTICA ....
CREATE OR REPLACE PROCEDURE ESTADISTICA
IS 
 CURSOR getUsuarios is SELECT id,nombre FROM usuarios;
 
 CURSOR getTotalGanadas(pID NUMBER) is SELECT COUNT(1) total FROM partidas rival
 JOIN partidas invitado ON rival.id = invitado.id
 WHERE ((rival.ESTATUS  = 'GANANDO' OR rival.ESTATUS  = 'GANO' ) AND rival.ID_USUARIO = pID) OR
 ((invitado.ESTATUS  = 'PERDIENDO' OR  invitado.ESTATUS  = 'GANO') AND invitado.ID_USUARIO_RIVAL = pID);
 
 CURSOR getTotalPerdidas(pID NUMBER) is SELECT COUNT(1) as total FROM partidas rival
 JOIN partidas invitado ON rival.id = invitado.id 
 WHERE ((rival.ESTATUS  = 'PERDIENDO' OR rival.ESTATUS  = 'PERDIO') AND rival.ID_USUARIO = pID)  OR 
 ((invitado.ESTATUS = 'GANANDO' OR invitado.ESTATUS = 'GANO' ) AND invitado.ID_USUARIO_RIVAL = pID);
 
 CURSOR getTotalEmpates(pID NUMBER) is SELECT COUNT(1) as total FROM partidas rival
 JOIN partidas invitado ON rival.id = invitado.id 
 WHERE (rival.ESTATUS  = 'EMPATE' OR invitado.ESTATUS  = 'EMPATE') 
 AND (rival.ID_USUARIO = pID OR invitado.ID_USUARIO_RIVAL = pID);
 
 CURSOR getTotalPartidas(pID NUMBER) is SELECT COUNT(1) as total FROM partidas rival
 JOIN partidas invitado ON rival.id = invitado.id
 WHERE  rival.ID_USUARIO = pID OR invitado.ID_USUARIO_RIVAL = pID;
 
 totalPartidasGanadas number(20) default 0;
 totalPartidasPerdidas number(20) default 0;
 totalPartidasEmpatadas number(20) default 0;
 totalPartidas number(20) default 0;
 txtResult varchar2(255) default '';
BEGIN
 MOSTRARFIGURA('ESTADISTICA');
 DBMS_OUTPUT.PUT_LINE(RPAD('|     JUGADOR',20,' ')||RPAD('|     GANADAS',20,'      ')||RPAD('|     PERDIDAS',20,'      ')||RPAD('|     EMPATES',20,'      ')||RPAD('|     PARTIDAS',20,'      |'));
 DBMS_OUTPUT.PUT_LINE(RPAD('|     ',20,' '));
 for usuario in getUsuarios loop
	txtResult := txtResult||RPAD('|    '||usuario.nombre,20,' ');
  for ganadas in getTotalGanadas(usuario.id) loop
    txtResult := txtResult||RPAD('|        '||ganadas.total,20,' ');	
  end loop;  
  for perdidas in getTotalPerdidas(usuario.id) loop
    txtResult := txtResult||RPAD('|        '||perdidas.total,20,' ');	
  end loop; 
  for empates in getTotalEmpates(usuario.id) loop
    txtResult := txtResult||RPAD('|        '||empates.total,20,' ');	
  end loop; 
  for partidas in getTotalPartidas(usuario.id) loop
    txtResult := txtResult||RPAD('|        '||partidas.total,20,' ');	
  end loop; 
  DBMS_OUTPUT.PUT_LINE(txtResult);
  txtResult := '';
 end loop;
 DBMS_OUTPUT.PUT_LINE(RPAD('|     ',20,' '));
 DBMS_OUTPUT.PUT_LINE(RPAD('|     ',20,' '));
END;
/
--------------------------------------------------------------------------------
Prompt ******  MOSTRARPARTIDAUSUARIO ....
CREATE OR REPLACE PROCEDURE MOSTRARPARTIDAUSUARIO(
   PNOMBRE VARCHAR2
)
IS

 cursor getPartidasUsuarioRival(pid number) is select * from partidas  where ID_USUARIO_RIVAL = pid;
 cursor getPartidasUsuario(pid number) is select * from partidas  where ID_USUARIO = pid;
 cursor getUsuarioPorNombre(vnombre varchar2) IS SELECT id,nombre FROM usuarios WHERE upper(trim(nombre)) = upper(trim(PNOMBRE));
 cursor getUsuarioPorId(pid number) IS SELECT id,nombre FROM usuarios WHERE id = pid;
 IDUSUARIO usuarios.id%type default null;
 NOMBREUSUARIO usuarios.nombre%type default null;
 NOMBREUSUARIORIVAL usuarios.nombre%type default null;
 txtResult varchar2(255) default '';
 error_usuario EXCEPTION;
 BEGIN 
  open getUsuarioPorNombre(PNOMBRE);
  fetch getUsuarioPorNombre into IDUSUARIO, NOMBREUSUARIO;
   if getUsuarioPorNombre%found then
       MOSTRARFIGURA('PARTIDAS');
       DBMS_OUTPUT.PUT_LINE('|                                ***************************************************************** ');
       DBMS_OUTPUT.PUT_LINE('|                                     ***** Partidas del usuario  '||NOMBREUSUARIO||' *****    ');
       DBMS_OUTPUT.PUT_LINE('|                                ***************************************************************** ');
	   DBMS_OUTPUT.PUT_LINE(RPAD('|     ',20,' '));
       DBMS_OUTPUT.PUT_LINE(RPAD('|     TITULO',20,' ')||RPAD('|    JUGADOR',20,'      ')||RPAD('|     RIVAL',20,'      ')||RPAD('| PUNTOS A FAVOR',20,'      ')||RPAD('| PUNTOS EN CONTRA',20,'      |')||RPAD('|     ESTADO',20,'      ')||'|   ID    |');
	   DBMS_OUTPUT.PUT_LINE(RPAD('|     ',20,' '));
	  for partida in getPartidasUsuarioRival(IDUSUARIO) loop
             txtResult	:= '';  
	         txtResult := txtResult||RPAD('|    '||partida.nombre,20,' ');
			 for usuario in getUsuarioPorId(partida.ID_USUARIO_RIVAL) loop 
			   txtResult := txtResult||RPAD('|    '||usuario.nombre,20,' ');
			 end loop;
			 for usuario in getUsuarioPorId(partida.ID_USUARIO) loop 
			   txtResult := txtResult||RPAD('|    '||usuario.nombre,20,' ');
			 end loop;
			 txtResult := txtResult||RPAD('|    '||partida.PUNTOS_EN_CONTRA,20,' ');
			 txtResult := txtResult||RPAD('|    '||partida.PUNTOS_A_FAVOR,20,' ');
			 if partida.ESTATUS = 'PERDIENDO' then 
			    txtResult := txtResult||RPAD('|    '||'GANO',20,' ');
			 end if;
			 if partida.ESTATUS = 'GANANDO' then 
			    txtResult := txtResult||RPAD('|    '||'PERDIO',20,' ');
			 end if;
			 if partida.ESTATUS = 'EMPATE' then 
			    txtResult := txtResult||RPAD('|    '||'EMPATE',20,' ');
			 end if;
			 txtResult := txtResult||RPAD('|    '||partida.ID,10,' ')|| RPAD('|    ',20,' ');
			 DBMS_OUTPUT.PUT_LINE(txtResult);
	  end loop;
	  for partida in getPartidasUsuario(IDUSUARIO) loop
             txtResult	:= '';  
	         txtResult := txtResult||RPAD('|    '||partida.nombre,20,' ');
			 for usuario in getUsuarioPorId(partida.ID_USUARIO) loop 
			   txtResult := txtResult||RPAD('|    '||usuario.nombre,20,' ');
			 end loop;
			 for usuario in getUsuarioPorId(partida.ID_USUARIO_RIVAL) loop 
			   txtResult := txtResult||RPAD('|    '||usuario.nombre,20,' ');
			 end loop;
			 txtResult := txtResult||RPAD('|    '||partida.PUNTOS_A_FAVOR,20,' ');
			 txtResult := txtResult||RPAD('|    '||partida.PUNTOS_EN_CONTRA,20,' ');
			 if partida.ESTATUS = 'PERDIENDO' then 
			    txtResult := txtResult||RPAD('|    '||'PERDIO',20,' ');
			 end if;
			 if partida.ESTATUS = 'GANANDO' then 
			    txtResult := txtResult||RPAD('|    '||'GANO',20,' ');
			 end if;
			 if partida.ESTATUS = 'EMPATE' then 
			    txtResult := txtResult||RPAD('|    '||'EMPATE',20,' ');
			 end if;
			  txtResult := txtResult||RPAD('|    '||partida.ID,10,' ')|| RPAD('|    ',20,' ');
			 DBMS_OUTPUT.PUT_LINE(txtResult);
	  end loop;
       DBMS_OUTPUT.PUT_LINE(RPAD('|     ',20,' '));
	   DBMS_OUTPUT.PUT_LINE(RPAD('|     ',20,' '));
  else
    RAISE error_usuario;
  end if;
  close getUsuarioPorNombre;
 EXCEPTION
  when error_usuario then
  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');
  DBMS_OUTPUT.PUT_LINE('|                                  ************   No existe un usuario  con ese nombre.  *********** ');
  DBMS_OUTPUT.PUT_LINE('|                                  ***************************************************************** ');

  WHEN OTHERS THEN
  DBMS_OUTPUT.put_line('Error:'||TO_CHAR(SQLCODE));
  DBMS_OUTPUT.put_line(SQLERRM);
 END;
 /