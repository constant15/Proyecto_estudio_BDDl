--use Proyecto_C3_G7


--Funciones almacenadas

--Funcion Calcular cantidad de documentos de tipo FACTURA A
CREATE FUNCTION fn_CantidadTipoDocumentos()
RETURNS varchar(18)
AS
BEGIN
    DECLARE @TotalDocA varchar(18);
    
    -- Cuenta la cantidad de documentos del tipo FACTURA A
    SELECT @TotalDocA = COUNT(TipoDocumento)
    FROM COMPRA
	WHERE TipoDocumento = 'Factura A'
    group by TipoDocumento
    -- Retornar el total calculado
    RETURN @TotalDocA;
END;
GO

SELECT dbo.fn_CantidadTipoDocumentos() as 'Total Facturas A'; 


go

--Funcion Almacenada Monto total de egresos monetarios

CREATE FUNCTION fn_TotalCompras()
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @TotalCompras DECIMAL(18, 2);
    
    -- Sumar todos los valores de la columna 'Monto' en la tabla 'COMPRA'
    SELECT @TotalCompras = SUM(MontoTotal)
    FROM COMPRA;
    
    -- Retornar el total calculado
    RETURN @TotalCompras;
END;
GO


SELECT dbo.fn_TotalCompras() AS TotalDeCompras;

go


-- Funcion almacenada que trae usuarios por su rol

CREATE FUNCTION fn_ObtenerUsuariosPorRol
(
    @IdRol INT -- Parámetro de entrada para el rol
)
RETURNS TABLE
AS
RETURN
(
    SELECT IdUsuario, DNI, Nombre, Apellido, Correo, Estado
    FROM USUARIO
    WHERE IdRol = @IdRol -- Filtra por el rol especificado
);


GO

SELECT * 
FROM dbo.fn_ObtenerUsuariosPorRol(2);  -- Devuelve todos los usuarios con el rol de ID = 2


GO