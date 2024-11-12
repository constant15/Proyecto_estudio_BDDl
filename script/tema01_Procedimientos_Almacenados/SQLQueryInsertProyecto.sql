
--use Proyecto_C3_G7

insert into ROL(descripcion) values ('Administrador')

insert into ROL(descripcion) values ('Empleado')

insert into ROL(descripcion) values ('Gerente')

insert into USUARIO(DNI, Nombre, Apellido, Correo, Clave, IdRol, Estado) values ('12345678','Juan','Rojas','juan@gmail.com','789',3,1)

insert into USUARIO(DNI, Nombre, Apellido, Correo, Clave, IdRol, Estado) values ('87654321','Jorge','Romero','jorge@gmail.com','456',2,1)

insert into USUARIO(DNI, Nombre, Apellido, Correo, Clave, IdRol, Estado) values ('09876543','Agustin','Rodriguez','Agustin@gmail.com','987',2,1)

insert into USUARIO(DNI, Nombre, Apellido, Correo, Clave, IdRol, Estado) values ('13579864','Maria','Losada','Maria@gmail.com','654',2,1)

insert into USUARIO(DNI, Nombre, Apellido, Correo, Clave, IdRol, Estado) values ('40678956','Josefina','Alves','Josefina@gmail.com','321',2,1)

insert into USUARIO(DNI, Nombre, Apellido, Correo, Clave, IdRol, Estado) values ('101010','Admin','Perez','@gmail.com','123',1,1)

select * from ROL

select * from PERMISO 

insert into PERMISO(IdRol, NombreMenu) values
(1, 'menuUsuarios'),
(1, 'menuMantenedor'),
(1, 'menuVentas'),
(1, 'menuCompras'),
(1, 'menuClientes'),
(1, 'menuProveedores'),
(1, 'menuReportes'),
(1, 'menuBackup')

insert into PERMISO(IdRol, NombreMenu) values
(2, 'menuVentas'),
(2, 'menuCompras'),
(2, 'menuClientes'),
(2, 'menuProveedores')

insert into PERMISO(IdRol, NombreMenu) values
(3, 'menuVentas'),
(3, 'menuCompras'),
(3, 'menuClientes'),
(3, 'menuReportes')

select * from PERMISO
select * from PROVEEDOR
select * from USUARIO
select * from ROL
select * from COMPRA

select p.IdPermiso, r.descripcion, p.NombreMenu from PERMISO p
inner join ROL r 
on r.IdRol = p.IdRol

insert into PROVEEDOR(DNI, RazonSocial, Correo, Telefono, Estado) values ('40123456','NikeShoes','nikeS@gmail.com','0800111222', 1)
insert into PROVEEDOR(DNI, RazonSocial, Correo, Telefono, Estado) values ('35789456','NikeJeans','nikeJeans@gmail.com','0800555666', 1)
insert into PROVEEDOR(DNI, RazonSocial, Correo, Telefono, Estado) values ('45033698','NikeT-Shirt','nikeTS@gmail.com','0810222888', 1)

insert into COMPRA(IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (5, 1, 'Boleta A', '00001', 150000)





insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (5, 1, 'Factura A', '00001', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (5, 1, 'Factura A', '00002', 355000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (5, 1, 'Factura A', '00003', 370000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (5, 1, 'Factura A', '00004', 390000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (5, 1, 'Factura A', '00005', 400000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (5, 1, 'Factura A', '00006', 425000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (5, 1, 'Factura A', '00007', 450000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (5, 1, 'Factura A', '00008', 475000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (5, 1, 'Factura A', '00009', 490000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (5, 1, 'Factura A', '00010', 495000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (6, 2, 'Factura A', '00011', 500000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (6, 2, 'Factura A', '00012', 375000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (6, 2, 'Factura A', '00013', 360000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (6, 2, 'Factura A', '00014', 250000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (6, 2, 'Factura A', '00015', 350400);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (6, 2, 'Factura A', '00016', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (6, 2, 'Factura A', '00017', 335000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (6, 2, 'Factura A', '00018', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (6, 2, 'Factura A', '00019', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (6, 2, 'Factura A', '00020', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (6, 2, 'Factura A', '00021', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (6, 2, 'Factura A', '00022', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (6, 2, 'Factura A', '00023', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (6, 2, 'Factura A', '00024', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (6, 2, 'Factura A', '00025', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (6, 2, 'Factura A', '00026', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (7, 3, 'Factura A', '00027', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (7, 3, 'Factura A', '00028', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (7, 3, 'Factura A', '00029', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (7, 3, 'Factura A', '00030', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (7, 3, 'Factura A', '00031', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (7, 3, 'Factura B', '00032', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (7, 3, 'Factura B', '00033', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (7, 3, 'Factura B', '00034', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (7, 3, 'Factura B', '00035', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (7, 3, 'Factura B', '00036', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (7, 3, 'Factura B', '00037', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (7, 3, 'Factura B', '00038', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (4, 3, 'Factura B', '00039', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (4, 2, 'Factura B', '00040', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (4, 2, 'Factura B', '00041', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (4, 1, 'Factura B', '00042', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (4, 2, 'Factura B', '00043', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (4, 3, 'Factura B', '00044', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (4, 3, 'Factura B', '00045', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (4, 3, 'Factura B', '00046', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (4, 3, 'Factura B', '00047', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (4, 3, 'Factura B', '00048', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (4, 3, 'Factura B', '00049', 350000);
insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (4, 3, 'Factura B', '00050', 350000);



insert into COMPRA (IdUsuario, IdProveedor, TipoDocumento, NumeroDocumento, MontoTotal) values (8, 3, 'Factura B', '00051', 350000);
