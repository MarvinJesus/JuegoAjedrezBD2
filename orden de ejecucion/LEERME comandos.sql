-- Al ejecutar el archivo 4insertar.sql se crearon usuarios y partidas  para poder probar el sistema, estas son la autentificaciones y los id de las partidas creadas :
		NOMBRE      PASSWORD   PARTIDAS
		luis      / 123     /  1 - 2
		marvin   /  123    /   1 - 3
		monge   /   123   /    2 - 4
	    calvo  /    123  /     3 - 4
		
-- A continuación se mostrara los comandos necesarios para hacer uso de las funcionalidades del sistema:
--1. Comando para crear un usuario, se le pasa como primer parametro el nombre del usuario y como segundo parametro el password.
exec crearusuario('luis',123);

--2. Comando para crear un usuario, se le pasa como primer parametro el nombre del usuario y como segundo parametro el password.
exec login('luis',123);

--3. Comando para crear una partida, el primer parametro es el titulo de la partida, el segundo es el nombre del usuario retado, el tercero es el nombre del usuario rival.
exec crearpartida('El gran reto','luis','marvin');

--4. Comando para Mostrar el tablero, se le pasa como parametro el id de la partida.
exec mostrartablero(1);

--5. Comando para mover una ficha,el primer parametro es el id de la partida, el segundo es la coordena de la posicion inicial y el tercero es la coordenada de la posicion final.
exec moverficha(1,'A2','A3');

--6. Comando para ver las estadisticas del los usuarios
exec estadistica;

--7. Comando para ver las partidas de un usuario, se le envía como parametro el nombre del usuario.
exec mostrarpartidausuario('luis');

--8. Comando para cerrar la sesion,se le pasa como primer parametro el nombre del usuario y como segundo parametro el password.
exec logout('luis',123);
exec logout('monge',123);