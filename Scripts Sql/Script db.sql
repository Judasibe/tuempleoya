Create Database tuempleoya;
use tuempleoya;

Create Table Categorias
(
	  ID Int Primary Key Identity(1,1)
	, Nombre Varchar(100) Not Null
	, FechaCreacion SmallDateTime Not Null
	, FechaModificacion SmallDateTime Not Null
	, Estado SmallInt
)
-- Select * From Categorias
-- Delete From Categorias Where Estado = 0

Create Table Log
(
	  ID Int Primary Key Identity(1,1)
	, Query Varchar(max) Not Null
	, FechaCreacion SmallDateTime Not Null
)
-- Select * From Log
-- Delete From Log

Create table Empresas
(
	  Id Int Primary Key Identity(1,1)
	, Nombre varchar(200) Not Null
	, Celular varchar(12) Not Null
	, Telefono varchar(12) Not Null
	, Email varchar(400) Not Null
	, Descripcion varchar(800)
	, Usuario  varchar(30)
	, Clave varchar(50)
	, IdCategoria Int Not Null
	, FechaCreacion SmallDateTime Not Null
	, FechaModificacion SmallDateTime Not Null
	, Estado SmallInt
)
-- Select * From Empresas
-- Delete From Empresas Where Estado = 0

Create Table Usuario
(
	  ID int Primary Key Identity(1,1)
	, Nombre varchar(100)
	, Apellidos varchar(100)
	, Email varchar(100)
	, numeroCelular varchar(11)
	, NombreUsuario varchar(40)
	, Clave varchar(15)
	, Rol SmallInt Default 1
	, FechaCreacion SmallDateTime Not Null Default GetDate()
	, FechaModificacion SmallDateTime Not Null Default GetDate()
	, Estado SmallInt Default 1
)
-- Select * From Usuario
-- Delete From Usuario Where Estado = 0

Insert Into Usuario(Nombre, Apellidos, Email, numeroCelular, NombreUsuario, Clave, FechaCreacion, FechaModificacion, Estado, Rol)
Select 'Super', 'Administrador', '', '', 'SuperAdmin', 'aiorostec3991', GetDate(),GetDate(), 1, 3