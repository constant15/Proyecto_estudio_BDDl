CREATE DATABASE ProcesamientoDatosJSON;


USE ProcesamientoDatosJSON;



--Creamos tabla que va a contener los datos JSON
CREATE TABLE Usuarios (
    ID INT IDENTITY PRIMARY KEY,
    DatosDelUsuario NVARCHAR(MAX) -- Columna que va a almacenar los datos en JSON
);

-------------Consultas--------------

--Consulta para datos anidados 
SELECT 
    JSON_QUERY(DatosDelUsuario, '$') AS DatosCompletos --JSON_QUERY es útil para obtener un objeto o arreglo JSON completo dentro de un JSON más grande
FROM Usuarios;


--Consultar datos JSON
SELECT 
    JSON_VALUE(DatosDelUsuario, '$.Nombre') AS Nombre,
    JSON_VALUE(DatosDelUsuario, '$.Edad') AS Edad,
	JSON_VALUE(DatosDelUsuario, '$.Correo') AS Correo
FROM Usuarios;

--Filtrar registros con un valor especifico 
SELECT 
    JSON_VALUE(DatosDelUsuario, '$.Nombre') AS Nombre,
    JSON_VALUE(DatosDelUsuario, '$.Ciudad') AS Ciudad
FROM Usuarios
WHERE JSON_VALUE(DatosDelUsuario, '$.Ciudad') = 'Córdoba';



--Muestra un JSON en filas
SELECT 
    Id,
    jsonData.[key] AS Clave,
    jsonData.[value] AS Valor
FROM Usuarios
CROSS APPLY OPENJSON(DatosDelUsuario) AS jsonData; --OPENJSON convierte el contenido de JSON en una tabla temporal



--Actualización de datos
UPDATE Usuarios
SET DatosDelUsuario = JSON_MODIFY(DatosDelUsuario, '$.Ciudad', 'Jujuy')
WHERE id = 5;
/*WHERE JSON_VALUE(DatosDelUsuario, '$.Correo') = 'carla@example.com';*/


--Agregar datos
UPDATE Usuarios
SET DatosDelUsuario = JSON_MODIFY(DatosDelUsuario, '$.Telefono', '12345678')
WHERE JSON_VALUE(DatosDelUsuario, '$.Nombre') = 'Maria';


--Eliminar un dato JSON
DELETE FROM Usuarios
WHERE JSON_VALUE(DatosDelUsuario, '$.Ciudad') = 'Corrientes';


SELECT * FROM Usuarios;

