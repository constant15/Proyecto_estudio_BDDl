-- Crear una tabla temporal para generar datos
DECLARE @Counter INT = 1;

-- Cargar 1 millón de registros en la tabla 'Registros'
WHILE @Counter <= 100000
BEGIN
    INSERT INTO Registros (Nombre, Fecha, Monto, Descripcion)
    VALUES (
        'Nombre_' + CAST(@Counter AS NVARCHAR(10)), -- Nombre ficticio
        DATEADD(DAY, @Counter % 3650, '2010-01-01'), -- Fecha aleatoria dentro de 10 años
        RAND() * 1000,  -- Monto aleatorio
        'Descripción del registro número ' + CAST(@Counter AS NVARCHAR(10)) -- Descripción ficticia
    );
    
    SET @Counter = @Counter + 1;
END

select count(*)from Registros
select fecha from Registros
