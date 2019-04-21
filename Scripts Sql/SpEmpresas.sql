IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SpEmpresas' AND user_name(uid) = 'dbo')
	DROP PROCEDURE [dbo].SpEmpresas
GO
CREATE PROCEDURE [dbo].SpEmpresas
(
	  @oper varchar(2)
	, @id int					= 0
	, @nombre varchar(200)		= ''
	, @celular varchar(12)		= ''
	, @telefono varchar(12)		= ''
	, @email varchar(400)		= ''
	, @descripcion varchar(800) = ''
	, @categorias int = 0
	, @usuario varchar(30)		= ''
	, @pass varchar(15)			= ''
	, @confirm varchar(15)		= ''
	, @img varchar(max)			= ''
)
AS
	SET NOCOUNT OFF;
	if(@oper='I')
	Begin
		IF IsNull(@nombre,'')=''
		Begin
			Raiserror('Debe proporcionar el nombre de la empresa', 16,1)
			Return
		End
		IF (Select Count(*) From Empresas Where Nombre = @nombre)>0
		Begin
			Raiserror('El nombre de la empresa ya se encuentra registrado', 16,1)
			Return
		End

		IF (IsNull(@celular,'')='') and (IsNull(@telefono,'')='')
		Begin
			Raiserror('Debe proporcionar minimo un número de contacto', 16,1)
			Return
		End
		
		IF IsNull(@email,'')=''
		Begin
			Raiserror('Debe proporcionar el Correo electronico', 16,1)
			Return
		End
		IF (Select Count(*) From Empresas Where Email = @email)>0
		Begin
			Raiserror('Correo Electronico ya registrado', 16,1)
			Return
		End
		IF IsNull(@categorias,'')=''
		Begin
			Raiserror('Debe seleccionar la categoria de la empresa', 16,1)
			Return
		End
		If IsNull(@usuario,'')=''
		Begin
			Raiserror('Debe ingresar el nombre de usuario', 16,1)
			Return
		End
		If (Select Count(*) From Empresas Where Usuario = @usuario)>0
		Begin
			Raiserror('Nombre de usuario ya escogido, Intente otro', 16,1)
			Return
		End
		If IsNull(@pass,'')=''
		Begin
			Raiserror('Debe ingresar la contraseña', 16,1)
			Return
		End
		If IsNull(@confirm,'')=''
		Begin
			Raiserror('Debe la confirmación de la contraseña', 16,1)
			Return
		End
		If @confirm<>@pass
		Begin
			Raiserror('Las Contraseñas deben ser iguales', 16,1)
			Return
		End

		Insert Into Empresas(Nombre, Celular, Telefono, Email, Descripcion, IdCategoria, FechaCreacion, FechaModificacion, Estado, Usuario, Clave, Imagen)
		Select @nombre, @celular, @telefono, @email, @descripcion, @categorias, getDate(), GetDate(), 1, @usuario, @pass, @img

		Select scope_identity() As id
	End	

	Else if(@oper='U')
	Begin
		IF IsNull(@nombre,'')=''
		Begin
			Raiserror('Debe proporcionar el nombre de la empresa', 16,1)
			Return
		End
		IF (Select Count(*) From Empresas Where Nombre = @nombre And Id <> @id)>0
		Begin
			Raiserror('El nombre de la empresa ya se encuentra registrado', 16,1)
			Return
		End

		IF (IsNull(@celular,'')='') and (IsNull(@telefono,'')='')
		Begin
			Raiserror('Debe proporcionar minimo un número de contacto', 16,1)
			Return
		End
		
		IF IsNull(@email,'')=''
		Begin
			Raiserror('Debe proporcionar el Correo electronico', 16,1)
			Return
		End
		IF (Select Count(*) From Empresas Where Email = @email And Id <> @id And Estado = 1)>0
		Begin
			Raiserror('Correo electronico ya registrado', 16,1)
			Return
		End
		IF IsNull(@categorias,'')=''
		Begin
			Raiserror('Debe seleccionar la categoria de la empresa', 16,1)
			Return
		End
		If IsNull(@usuario,'')=''
		Begin
			Raiserror('Debe ingresar el nombre de usuario', 16,1)
			Return
		End
		If (Select Count(*) From Empresas Where Usuario = @usuario And ID <> @id)>0
		Begin
			Raiserror('Nombre de usuario ya escogido, Intente otro', 16,1)
			Return
		End

		Update Empresas
		Set   Nombre = @nombre, Celular = @celular, Telefono = @telefono, Email = @email, Descripcion = @descripcion
			, IdCategoria=@categorias, FechaModificacion = GetDate(), Usuario = @usuario, Imagen = @img
		Where ID = @id
	End

	Else if(@oper='S')
	Begin
		If IsNull(@id, 0)=0
		Begin
			Select Empresas.Nombre, Empresas.Celular, Empresas.Telefono, Empresas.Email, Empresas.Descripcion, Empresas.IdCategoria
					, Empresas.FechaCreacion, Empresas.FechaModificacion, Empresas.Estado, Empresas.ID, Empresas.Usuario
					, Categorias.Nombre As Categoria, IsNull(Empresas.Imagen, '')
			From Empresas
				Inner Join Categorias On Empresas.IdCategoria = Categorias.ID
			Where Empresas.Estado = 1
		End
		Else
		Begin
			Select Empresas.Nombre, Empresas.Celular, Empresas.Telefono, Empresas.Email, Empresas.Descripcion, Empresas.IdCategoria
					, Empresas.FechaCreacion, Empresas.FechaModificacion, Empresas.Estado, Empresas.ID, Usuario, IsNull(Imagen, '')
			From Empresas
			Where Empresas.ID = @id
		End
		
	End
	
	Else if(@oper='D')
	Begin
		Update Empresas
		Set FechaModificacion = GetDate(), Estado = 0
		Where ID = @id

		Select Empresas.Nombre, Empresas.Celular, Empresas.Telefono, Empresas.Email, Empresas.Descripcion, Empresas.IdCategoria
				, Empresas.FechaCreacion, Empresas.FechaModificacion, Empresas.Estado, Empresas.ID, Empresas.Usuario
				, Categorias.Nombre As Categoria, IsNull(Empresas.Imagen, '')
		From Empresas
			Inner Join Categorias On Empresas.IdCategoria = Categorias.ID
		Where Empresas.Estado = 1
	End
GO

