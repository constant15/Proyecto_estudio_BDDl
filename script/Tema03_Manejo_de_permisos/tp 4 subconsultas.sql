-- SERIE 4 SUBCONSULTAS

/*---------------------
--EJERCICIO 1 ------
--------------------
/*
1) Se requiere acceder a un informe que muestre la cantidad de 
departamentos por piso y consorcio. 
Formato de la salida:
provincia|localidad|consorcio|piso|cantidad de departamentos|
---------+---------+---------+----+-------------------------+
*/*/  
--DENTRO DE INMUEBLE: NRO PISO, AGRUPAR NUMERO POR CONSORCIO, CONTAR LA CANTIDAD DE 
--DPTO 

select idconsorcio, dptos_consorcio.nro_piso , dptos_consorcio.[cantidad dptos]from 

	(select distinct idconsorcio, nro_piso , count(dpto) as 'cantidad dptos' from inmueble 
	group by idconsorcio, nro_piso,idprovincia, idlocalidad 

	)as dptos_consorcio
	order by idconsorcio  asc

	
