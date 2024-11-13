
Manejo de permisos a nivel de usuarios de base de datos.

Base de datos a modo mixto:
    Para poder autenticar el inicio de sesión con el modo de autenticación de Windows o con la autenticación de SQL Server, 
    se debe configurar la base de datos a modo mixto, para ello debemos iniciar sesión en SQL Server Management Studio con una cuenta que tenga permisos de administrador en el servidor, dirigirse a la pestaña de seguridad del servidor y en la sección de Autenticación de servidor, selecciona Modo de autenticación de SQL Server y de Windows.

Creacion de Login y Usuarios:
    Con la sentencia "create login NOMBRE  with password = ''" creamos un login y al que se le asignara un usuario con la sentencia
    " create user NOMBRE for login NOMBRE". 

Permisos a usuarios nivel de base de datos:
    Desde la cuenta de sql server con permisos de administrador, le podremos dar permisos a estos usuarios creados, ya sea a nivel de servidor, es decir para que el nuevo usuario pueda ver y editar todas las bases de datos existentes, o a nivel de base de datos, es decir, el usuario podrá acceder unicamente a la base de datos asignada. Esto podemos lograrlo a travs de una serie de permisos por ejemplo SELECT, INSERT, UPDATE, DELETE en tablas específicas o en toda la base de datos.

Creacion de Roles:
    Al crear un rol, podremos asignar  varios permisos a la vez al agregar un usuario a ese rol, en lugar de otorgar permisos uno por uno. 

    



