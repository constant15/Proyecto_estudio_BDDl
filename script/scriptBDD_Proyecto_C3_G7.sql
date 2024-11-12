create database Proyecto_C3_G7;

use Proyecto_C3_G7;

create table ROL(
	IdRol int identity,
	descripcion varchar(50) not null,
	CONSTRAINT pk_id_rol PRIMARY KEY (IdRol)

)

go

create table PERMISO(
	IdPermiso int identity,
	IdRol int not null,
	NombreMenu varchar(50) not null,
	constraint pk_id_permmiso PRIMARY KEY(IdPermiso),
	constraint fk_id_rol foreign key (IdRol) references ROL(IdRol)
)

go

create table PROVEEDOR(
	IdProveedor int identity,
	DNI int not null,
	RazonSocial varchar(50) not null,
	Correo varchar(50),
	Telefono varchar(50) not null,
	Estado bit,
	FechaRegistro datetime default getdate(),
	constraint pk_id_proveedor PRIMARY KEY(IdProveedor)

)

go

create table CLIENTE(
	IdCliente int identity,
	DNI int not null,
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Correo varchar(50) null,
	Telefono varchar(50) not null,
	Estado bit,
	FechaRegistro datetime default getdate(),
	constraint pk_id_cliente PRIMARY KEY(IdCliente)

)

go

create table USUARIO(
	IdUsuario int identity,
	DNI int not null, 
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Correo varchar(50) not null,
	Clave varchar(50) not null,
	IdRol int not null,
	Estado bit,
	FechaRegistro datetime default getdate(),
	constraint pk_id_usuario PRIMARY KEY(IdUsuario),
	constraint fk_id_rol_usuario foreign key (IdRol) references ROL(IdRol)

)

go

create table CATEGORIA(
	IdCategoria int identity,
	Descripcion varchar (100) not null,
	Estado bit,
	FechaRegistro datetime default getdate(),
	constraint pk_id_categoria PRIMARY KEY(IdCategoria)

)

go

create table PRODUCTO(
	IdProducto int identity,
	Codigo varchar (50) not null,
	Nombre varchar (50) not null,
	Descripcion varchar (100) not null,
	IdCategoria int,
	Stock int not null default 0,
	PrecioCompra decimal(10,2) default 0,
	PrecioVenta decimal(10,2) default 0,
	Estado bit,
	FechaRegistro datetime default getdate(),
	constraint pk_id_producto PRIMARY KEY(IdProducto),
	constraint fk_id_categoria foreign key (IdCategoria) references CATEGORIA(IdCategoria)

)

go

create table COMPRA(
	IdCompra int identity,
	IdUsuario int not null,
	IdProveedor int not null,
	TipoDocumento varchar(50) not null,
	NumeroDocumento varchar(50) not null,
	MontoTotal decimal(10,2),
	FechaRegistro datetime default getdate(),
	constraint pk_id_compra PRIMARY KEY(IdCompra),
	constraint fk_id_usuario FOREIGN KEY(IdUsuario) references USUARIO(IdUsuario),
	constraint fk_id_proveedor FOREIGN KEY (IdProveedor) references PROVEEDOR(IdProveedor)
)

go




create table DETALLE_COMPRA(
	IdDetalleCompra int identity,
	IdCompra int,
	IdProducto int,
	PrecioCompra decimal(10,2) default 0,
	PrecioVenta decimal(10,2) default 0,
	Cantidad int,
	MontoTotal decimal(10,2), 
	--ssubtotal
	FechaRegistro datetime default getdate(),
	constraint pk_id_detallecompra PRIMARY KEY(IdDetalleCompra),
	constraint fk_id_compra FOREIGN KEY(IdCompra) references COMPRA(IdCompra),
	constraint fk_id_producto FOREIGN KEY(IdProducto) references PRODUCTO(IdProducto),
)


go


create table VENTA(
	IdVenta int identity,
	IdUsuario int,
	TipoDocumentoVenta varchar(50),
	NumeroDocumentoVenta varchar(50),
	DocumentoCliente int not null,
	NombreCliente varchar (100) not null,
	MontoPago decimal(10,2),
	MontoCambio decimal(10,2),
	MontoTotal decimal(10,2),
	FechaRegistro datetime default getdate(),
	constraint pk_id_venta PRIMARY KEY(IdVenta),
	constraint fk_id_usuario_venta FOREIGN KEY(IdUsuario) references USUARIO(IdUsuario)

)


alter table venta
add IdCliente int;

alter table venta 
add constraint fk_id_cliente foreign key (IdCliente) references CLIENTE(IdCliente);
select * from VENTA

go

create table DETALLE_VENTA(
	IdDetalleVenta int identity,
	IdVenta int,
	IdProducto int,
	PrecioVenta decimal(10,2),
	Cantidad int,
	SubTotal decimal(10,2),
	FechaRegistro datetime default getdate(),
	constraint pk_id_detalleventa PRIMARY KEY(IdDetalleVenta),
	constraint fk_id_venta FOREIGN KEY(IdVenta) references Venta(IdVenta),
	constraint fk_id_producto_venta FOREIGN KEY(IdProducto) references PRODUCTO(IdProducto)
)

go

