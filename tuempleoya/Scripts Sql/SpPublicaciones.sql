IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SpPublicaciones' AND user_name(uid) = 'dbo')
	DROP PROCEDURE [dbo].SpPublicaciones
GO
CREATE PROCEDURE [dbo].SpPublicaciones
(
      @oper varchar(2)
	, @categoria Int			= 0
	, @idoferta Int				= 0
	, @user Int					= 0

	, @idaspiranteusuario Int	= 0
	, @archivo varchar(max)		= ''
)
AS
	
	-- Ver Todas
	If @oper='SA'
	Begin
		
		If IsNull(@categoria,0)=0
		Begin
			Select    Ofertas.ID, Ofertas.Titulo, Ofertas.Descripcion, Convert(Int, Valor) As Valor
					, Ofertas.Tiempo, Ofertas.idCategoria, Ofertas.FechaCreacion, Ofertas.FechaModificacion, Ofertas.Estado
					, Categorias.Nombre As Categoria
					, Empresas.Nombre as Empresa
			From Ofertas
				Inner Join Categorias On Ofertas.idCategoria = Categorias.ID
				Inner Join Empresas On Ofertas.idEmpresa = Empresas.Id
			Where Ofertas.Estado = 1
		End
		Else
		Begin
			Select    Ofertas.ID, Ofertas.Titulo, Ofertas.Descripcion, Convert(Int, Valor) As Valor
					, Ofertas.Tiempo, Ofertas.idCategoria, Ofertas.FechaCreacion, Ofertas.FechaModificacion, Ofertas.Estado
					, Categorias.Nombre As Categoria
					, Empresas.Nombre as Empresa
			From Ofertas
				Inner Join Categorias On Ofertas.idCategoria = Categorias.ID
				Inner Join Empresas On Ofertas.idEmpresa = Empresas.Id
			Where Categorias.ID =  @categoria And Ofertas.Estado = 1
		End
	End

	-- Ver Solo Una
	If @oper='SO'
	Begin
		Select    Ofertas.ID, Ofertas.Titulo, Ofertas.Descripcion, Convert(Int, Valor) As Valor
				, Ofertas.Tiempo, Ofertas.idCategoria, Ofertas.FechaCreacion, Ofertas.FechaModificacion, Ofertas.Estado
				, Categorias.Nombre As Categoria
				, Empresas.Nombre as Empresa, IsNull(Empresas.Imagen, '') As Imagen
		From Ofertas
			Inner Join Categorias On Ofertas.idCategoria = Categorias.ID
			Inner Join Empresas On Ofertas.idEmpresa = Empresas.Id
		Where Ofertas.ID = @idoferta

		Select OfertaSkill.Descripcion As Minimo, Skills.Nombre As Skill
		From OfertaSkill
			Inner Join Skills  On OfertaSkill.idSkill = Skills.ID
		Where IdOferta = @idoferta
	End
	
	If @oper='AO'
	Begin
		If (Select Count(*) From AspirarOferta Where IdOferta = @idoferta And  IdUsuario = @user)>0
		Begin
			Raiserror('Usted ya esta aspirando a esta oferta', 16,1)
			Return
		End
		Insert Into AspirarOferta(IdOferta, IdUsuario, FechaModificacion, Estado)
		Select @idoferta, @user, getDate(), 1
		Return
	End

	if @oper='OA'
	Begin
		Select @idoferta = IdOferta From AspirarOferta Where Id = @idaspiranteusuario

		Update AspirarOferta
		Set Estado = 2
		Where Id = @idaspiranteusuario
		
		Select   Usuario.Nombre + ' ' + Usuario.Apellidos As Usuario, Usuario.Email, AspirarOferta.ID, Usuario.NombreUsuario
		From AspirarOferta
			Inner Join Usuario On AspirarOferta.IdUsuario = Usuario.ID
			Inner Join Ofertas On AspirarOferta.IdOferta = Ofertas.ID
		Where Ofertas.ID = @idoferta
	End

	if @oper = 'HV'
	Begin
		Select Id, Archivo, IdUsuario, FechaModificacion, Estado
		From HojaDevida 
		Where IdUsuario = @user

		Select Empresas.Nombre, Ofertas.Titulo, 
				Case When AspirarOferta.Estado = 1 Then 'Aspirante' 
					When AspirarOferta.Estado = 2 Then 'Fuera de Aspirante'
					End As Estado
		From AspirarOferta
				Inner Join Usuario On AspirarOferta.IdUsuario = Usuario.ID
				Inner Join Ofertas On AspirarOferta.IdOferta = Ofertas.ID
				Inner Join Empresas On Ofertas.IdEmpresa = Empresas.ID
		Where AspirarOferta.IdUsuario = @user
	End

	If @oper='AH'
	Begin
		Update HojaDevida
		Set Archivo = @archivo, FechaModificacion = GetDate()
		Where IdUsuario = @user
		Return
	End

GO