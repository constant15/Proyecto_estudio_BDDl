--use Proyecto_C3_G7


--select * from USUARIO

/*Creacion de un procedimiento almacenado para el registro de un usuario*/

create proc sp_registrarusuario(
@DNI varchar (50),
@Nombre varchar (50),
@Apellido varchar (50),
@Correo varchar (100),
@Clave varchar (100),
@IdRol int,
@Estado bit,
@IdUsuarioResultado int output,
@Mensaje varchar(500) output
)

as 
begin 

	set @IdUsuarioResultado = 0
	set @Mensaje = ''
	
	if not exists(select 1 from USUARIO where DNI = @DNI or Correo = @Correo)
	begin 
		insert into USUARIO(DNI, Nombre, Apellido, Correo, Clave, IdRol, Estado) values
		(@DNI, @Nombre, @Apellido, @Correo, @Clave, @IdRol, @Estado);

		set @IdUsuarioResultado = SCOPE_IDENTITY()
		set @Mensaje = 'Usuario registrado correctamente.';
	end
	else 
	begin
		SET @Mensaje = 'El DNI o el Correo ya están registrados para otro usuario.';

	end
end

go

/*Creacion de un procedimiento almacenado para el update de un usuario*/
create proc sp_editarusuario(
@IdUsuario int,
@DNI varchar (50),
@Nombre varchar (50),
@Apellido varchar (50),
@Correo varchar (100),
@Clave varchar (100),
@IdRol int,
@Estado bit,
@Respuesta bit output,
@Mensaje varchar(500) output
)

as 
begin 

	set @Respuesta = 0
	set @Mensaje = ''
	
	if not exists(select 1 from USUARIO where DNI = @DNI and IdUsuario != @IdUsuario)
	begin 
		update USUARIO set 
		DNI = @DNI, 
		Nombre = @Nombre, 
		Apellido = @Apellido,
		Correo = @Correo, 
		Clave = @Clave, 
		IdRol = @IdRol, 
		Estado = @Estado
		where IdUsuario = @IdUsuario
		set @Respuesta = 1
		set @Mensaje = 'Datos del usuario editados con exito.'
	end
	else 
	begin
		set @Mensaje = 'No se puede repetir el Nro de Documento para mas de un usuario.'
	end
end


go


/*Creacion de un procedimiento almacenado para la eliminacion de un usuario*/
create proc sp_EliminarUsuario(
@IdUsuario int,
@Respuesta bit output,
@Mensaje varchar(500) output
)

as 
begin 

	set @Respuesta = 0
	set @Mensaje = ''
	declare @pasoRegla bit = 1
	
	if exists (select 1
	from COMPRA c 
	inner join USUARIO u on u.IdUsuario = c.IdUsuario
	where u.IdUsuario = @IdUsuario)

	begin 
		set @pasoRegla = 0
		set @Respuesta = 0
		set @Mensaje = @Mensaje + 'No se puede eliminar el usuario seleccionado porque se encuentra relacionado a una compra.'
	end 
	
	if(@pasoRegla = 1)
	begin 
		delete from USUARIO 
		where IdUsuario = @IdUsuario

		if(@@ROWCOUNT > 0)
		begin
			set @Respuesta = 1
			set @Mensaje = 'Usuario eliminado con exito.'
		end
		else
		begin
			SET @Respuesta = 0;
            SET @Mensaje = 'No se encontró el usuario para eliminar.';
		end
	end

end

go


go
--Ejecucion del procedimiento registrar usuario
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


/*DELETE FROM nombre_tabla
WHERE condición;

delete from USUARIO where IdUsuario = 14*/
go

-- Ejecucion del procedimiento Editar usuario

DECLARE @Respuesta BIT;
DECLARE @Mensaje VARCHAR(500);

exec sp_editarusuario
@IdUsuario = 9,
@DNI = '101010',
@Nombre = 'Santiago',
@Apellido = 'Perez' ,
@Correo = 'Santi@gmail.com',
@Clave = 123 ,
@IdRol = 1,
@Estado = 1,
@Respuesta = @Respuesta output,
@Mensaje = @Mensaje output;

select @Respuesta as Respuesta, @Mensaje as Mensaje

go

--Ejecucion del procedimiento Eliminar Usuario

DECLARE @Respuesta BIT;
DECLARE @Mensaje VARCHAR(500);

exec sp_EliminarUsuario
@IdUsuario = 8,
@Respuesta =  @Respuesta output,
@Mensaje = @Mensaje output

select @Respuesta as Respuesta, @Mensaje as Mensaje