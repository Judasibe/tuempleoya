IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SpLogin' AND user_name(uid) = 'dbo')
	DROP PROCEDURE [dbo].SpLogin
GO
CREATE PROCEDURE [dbo].SpLogin
(
	  @usuario varchar(15)		= ''
	, @pass varchar(30)			= ''
	, @id Int					= 0
)
AS
	SET NOCOUNT OFF;

	if IsNull(@usuario,'')=''
	Begin
		Raiserror ('Debe proporcionar el nombre de usuario', 16,1)
		Return
	End

	If IsNull(@pass,'')=''
	Begin
		Raiserror ('Debe proporcionar la contraseña del usuario', 16,1)
		Return
	End

	Declare @tbl As Table(id int identity(1,1), idusuario Int, usuario varchar(30), tipousuario varchar(20))

	If (Select Count(*) From Empresas Where usuario = @usuario And Clave = @pass)<=0
	Begin
		
		If (Select Count(*) From Usuario Where NombreUsuario = @usuario And Clave = @pass)<=0
		Begin
			Raiserror('Usuario o Contrseña Erronea', 16,1)
			Return
		End
		Declare @usertipe SmallInt

		Select @id = Id From Usuario Where NombreUsuario = @usuario And Clave = @pass
		Select @usertipe = Rol From Usuario Where NombreUsuario = @usuario And Clave = @pass
		If @usertipe=1
		Begin
			Insert Into @tbl(idusuario, usuario, tipousuario)
			Select @id, @usuario, 'Usuario'
		End
		Else
		Begin
			Insert Into @tbl(idusuario, usuario, tipousuario)
			Select @id, @usuario, 'Administrador'
		End
		
	End
	Else
	Begin
		Select @id = Id From Empresas Where usuario = @usuario And Clave = @pass
		Insert Into @tbl(idusuario, usuario, tipousuario)
		Select @id, @usuario, 'Empresa'
	End


	Select id, usuario, tipousuario From @tbl
GO