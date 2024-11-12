USE C3_Grupo07
CREATE TABLE Registros (
    ID INT IDENTITY PRIMARY KEY,
    Nombre NVARCHAR(100),
    Fecha DATETIME,
    Monto DECIMAL(10, 2),
    Descripcion NVARCHAR(255)
);
-- Crear una tabla temporal para generar datos
DECLARE @Counter INT = 1;

-- Cargar 1 mill�n de registros en la tabla 'Registros'
WHILE @Counter <= 100000
BEGIN
    INSERT INTO Registros (Nombre, Fecha, Monto, Descripcion)
    VALUES (
        'Nombre_' + CAST(@Counter AS NVARCHAR(10)), -- Nombre ficticio
        DATEADD(DAY, @Counter % 3650, '2010-01-01'), -- Fecha aleatoria dentro de 10 a�os
        RAND() * 1000,  -- Monto aleatorio
        'Descripci�n del registro n�mero ' + CAST(@Counter AS NVARCHAR(10)) -- Descripci�n ficticia
    );
    
    SET @Counter = @Counter + 1;
END

select count(*)from Registros
select fecha from Registros

-- Consulta sin �ndice
DECLARE @FechaInicio DATETIME = '2015-01-01';
DECLARE @FechaFin DATETIME = '2020-01-01';

SET STATISTICS IO ON;  -- Habilitar estad�sticas de entrada/salida
SET STATISTICS TIME ON; -- Habilitar estad�sticas de tiempo

/*DECLARE @FechaInicio DATETIME = '2015-01-01';
DECLARE @FechaFin DATETIME = '2020-01-01';*/
SELECT * 
FROM Registros
WHERE Fecha BETWEEN @FechaInicio AND @FechaFin;

SET STATISTICS IO OFF;  
SET STATISTICS TIME OFF;


-- Crear �ndice agrupado en la columna 'Fecha'
CREATE CLUSTERED INDEX IX_fecha ON Registros (Fecha);

-- Repetir la consulta despu�s de crear el �ndice agrupado
DECLARE @FechaInicio DATETIME = '2015-01-01';
DECLARE @FechaFin DATETIME = '2020-01-01';

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT * 
FROM Registros
WHERE Fecha BETWEEN @FechaInicio AND @FechaFin;

SET STATISTICS IO OFF;  
SET STATISTICS TIME OFF;


-- Borrar el �ndice agrupado creado
DROP INDEX IX_Fecha ON Registros;

-- Crear un �ndice agrupado sobre 'Fecha' y columnas adicionales como 'Monto' y 'Descripcion'
CREATE CLUSTERED INDEX IX_Fecha_Incluidas ON Registros (Fecha) 
INCLUDE (Monto, Descripcion);


-- Repetir la consulta despu�s de crear el �ndice agrupado con columnas incluidas

SET STATISTICS IO ON;
SET STATISTICS TIME ON;
DECLARE @FechaInicio DATETIME = '2015-01-01';
DECLARE @FechaFin DATETIME = '2020-01-01';
SELECT * 
FROM Registros
WHERE Fecha BETWEEN @FechaInicio AND @FechaFin;

SET STATISTICS IO OFF;  
SET STATISTICS TIME OFF;


-- Mostrar plan de ejecuci�n
SET SHOWPLAN_ALL ON;

-- Realizar consulta de prueba
DECLARE @FechaInicio DATETIME = '2015-01-01';
DECLARE @FechaFin DATETIME = '2020-01-01';

SELECT * 
FROM Registros
WHERE Fecha BETWEEN @FechaInicio AND @FechaFin;

SET SHOWPLAN_ALL OFF;
-- Crear un �ndice no agrupado sobre la columna 'Fecha'
CREATE NONCLUSTERED INDEX IX_Fecha_NonClustered ON Registros (Fecha);



