IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SpUsuario' AND user_name(uid) = 'dbo')
	DROP PROCEDURE [dbo].SpUsuario
GO
CREATE PROCEDURE [dbo].SpUsuario
(
	  @oper varchar(2)
	, @Nombre varchar(100)			= ''
	, @Apellidos varchar(100)		= ''
	, @Email varchar(100)			= ''
	, @numeroCelular varchar(11)	= ''
	, @NombreUsuario varchar(40)	= ''
	, @Clave varchar(15)			= ''
	, @confirmacion varchar(15)		= ''
	, @id int						= 0
)
AS
	SET NOCOUNT OFF;
	if(@oper='I')
	Begin
		If IsNull(@Nombre,'')=''
		Begin
			Raiserror('Debe escribir su nombre', 16,1)
			return
		End
		If IsNull(@Apellidos,'')=''
		Begin
			Raiserror('Debe escribir su(s) apellido(s)', 16,1)
			return
		End
		If IsNull(@NombreUsuario,'')=''
		Begin
			Raiserror('Debe escribir su nombre de usuario', 16,1)
			return
		End
		If IsNull(@Email,'')=''
		Begin
			Raiserror('Debe escribir su correo electronico', 16,1)
			return
		End
		If IsNull(@Clave, '')=''
		Begin
			Raiserror('Debe escribir la clave', 16,1)
			return
		End

		If IsNull(@confirmacion, '')=''
		Begin
			Raiserror('Debe escribir la confirmación de la contraseña', 16,1)
			return
		End

		if @Clave<>@confirmacion
		Begin
			Raiserror('La Contraseña y la confirmación deben ser iguales', 16,1)
			Return
		End

		Insert Into Usuario(Nombre, Apellidos, Email, numeroCelular, NombreUsuario, Clave, FechaCreacion, FechaModificacion, Estado, Rol)
		Select @Nombre, @Apellidos, @Email, @numeroCelular, @NombreUsuario, @Clave, GetDate(),GetDate(), 1, 1

		Select scope_identity() As id
	End	

	Else if(@oper='U')
	Begin
		If IsNull(@Nombre,'')=''
		Begin
			Raiserror('Debe escribir su nombre', 16,1)
			return
		End
		If IsNull(@Apellidos,'')=''
		Begin
			Raiserror('Debe escribir su(s) apellido(s)', 16,1)
			return
		End
		If IsNull(@NombreUsuario,'')=''
		Begin
			Raiserror('Debe escribir su nombre de usuario', 16,1)
			return
		End
		If IsNull(@Email,'')=''
		Begin
			Raiserror('Debe escribir su correo electronico', 16,1)
			return
		End
		If (Select Count(*) From Usuario Where Email = @Email And ID <> @id)>0
		Begin
			Raiserror('Este correo electronico ya se encuentra registrado', 16,1)
			return
		End
		Update Usuario
		Set Nombre = @Nombre, Apellidos = @Apellidos, Email = @Email, numeroCelular = @numeroCelular, NombreUsuario = @NombreUsuario
			, Clave = @Clave, FechaModificacion = GetDate()
		Where ID = @id
	End

	Else if(@oper='S')
	Begin
		If IsNull(@id, 0)=0
		Begin
			Select ID, Nombre, Apellidos, Email, numeroCelular, NombreUsuario, Clave, FechaCreacion, FechaModificacion, Estado
			From Usuario
			Where Estado = 1
		End
		Else
		Begin
			Select ID, Nombre, Apellidos, Email, numeroCelular, NombreUsuario, Clave, FechaCreacion, FechaModificacion, Estado
			From Usuario
			Where ID = @id
		End
		
	End
	
	Else if(@oper='D')
	Begin

		Update Usuario
		Set FechaModificacion = GetDate(), Estado = 0
		Where ID = @id

		
		Select ID, Nombre, Apellidos, Email, numeroCelular, NombreUsuario, Clave, FechaCreacion, FechaModificacion, Estado
		From Usuario
		Where Estado = 1
	End
GO

