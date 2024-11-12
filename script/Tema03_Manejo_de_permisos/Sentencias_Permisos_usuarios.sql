
-----------------------------------------------------------
------------------creacion de usuarios---------------------

----Creo Usuario Pablo y le consedo permiso de administrador-
 create login Pablo with password = '1234' 
 create user Pablo for login Pablo
 -- concedo permiso de adm a todas las BD
  ALTER ROLE db_owner ADD MEMBER Pablo;

------Creo Usuario Carla y le consedo permiso de lectura----
 create Login Carla with password = '1234' 
 create user Carla for login Carla
 --Asigno a Carla permiso de lectura a ala base de datos
  alter server role db_datareader add member Carla
  ALTER ROLE db_datareader ADD MEMBER Carla;

---Permisos de ejecucion sobre proced. almacenado
GRANT EXECUTE ON sp_registrarusuario TO Carla;

--ejecucion del procedimiento almacenado
use Proyecto_C3_G7

DECLARE @IdUsuarioResultado INT;
DECLARE @Mensaje VARCHAR(500);

exec sp_registrarusuario
@DNI = '11223346', 
@Nombre = 'Nicolas', 
@Apellido = 'Battestin', 
@Correo = 'nicoOli@gmail.com', 
@Clave = '555', 
@IdRol = 2, 
@Estado = 1,
@IdUsuarioResultado =  @IdUsuarioResultado OUTPUT,
@Mensaje = @Mensaje output;

select @IdUsuarioResultado as ResultadoUsuario, @Mensaje as Mensaje

--Prueba insesrcion de datos a la tabla USUARIO 
--CARLA
insert into USUARIO(DNI, Nombre, Apellido, Correo, Clave, IdRol, Estado) 
values ('12345678','Juan','Rojas','juan@gmail.com','789',3,1)
 --PABLO 
 insert into USUARIO(DNI, Nombre, Apellido, Correo, Clave, IdRol, Estado) 
values ('32235','Juan','Rojas','juan56@gmail.com','789',3,1)

---------------------------------------------------------------------------------

---------------------------------------------------------
-------------CREACION DE ROLES---------------------------


--Creo dos usuarios 
use Proyecto_C3_G7
create Login Santiago with password = '1234' 
create user Santiago for login Santiago

 create Login Analia with password = '1234' 
 create user Analia for login Pablo 


--sentencia de creacion de rol de Base de Datos
CREATE ROLE lecturaTablas;

--Otorgo permisos al rol de selctura sobre las tablas
GRANT SELECT ON producto TO lecturaTablas;
GRANT SELECT ON usuario TO lecturaTablas;

--Agrego los usuarios al rol creados
ALTER ROLE lecturaTablas ADD MEMBER Santiago; --Santiago va a tendrá acceso de solo lectura en las tablas


--Prueba lectura de datos Usuario Santiago
select * from PRODUCTO
select * from USUARIO

--Prueba lectura de datos Usuario Analia
select * from PRODUCTO
select * from USUARIO
 
	
