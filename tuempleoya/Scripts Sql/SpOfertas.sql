IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SpOfertas' AND user_name(uid) = 'dbo')
	DROP PROCEDURE [dbo].SpOfertas
GO
CREATE PROCEDURE [dbo].SpOfertas
(
	  @oper varchar(2)
	, @idskill Int								= 0
	, @nameskill varchar(50)					= ''
	
	, @id int									= 0
	, @idempresa int							= 0
	, @titulo varchar(50)						= ''
	, @descripcion varchar(400)					= ''
	, @valor Money								= 0
	, @tiempo varchar(40)						= ''
	, @categoria Int							= 0

	, @skilloferta Int							= 0
	, @descripcionSkillOferta	varchar(150)	= ''
)
AS
	SET NOCOUNT OFF;
	if(@oper='IS')
	Begin
		If (Select Count(*) From Skills Where Nombre = @nameskill And Estado = 1)>0
		Begin
			Raiserror('Skills ya registrado', 16,1)
			Return
		End

		Insert Into Skills(Nombre, FechaCreacion, FechaModificacion, Estado)
		Select @nameskill, GetDate(), GetDate(), 1

		Select scope_identity() As id
	End	

	Else if(@oper='US')
	Begin
		Update Skills
		Set Nombre = @nameskill, FechaModificacion = GetDate()
		Where Id = @idskill
		Return
	End

	Else if(@oper='SS')
	Begin
		If IsNull(@idskill,0)=0 
		Begin
			Select ID, Nombre, FechaCreacion, FechaModificacion, Estado 
			From Skills
			Where Estado = 1
		End
		Else 
		Begin
			Select ID, Nombre, FechaCreacion, FechaModificacion, Estado 
			From Skills
			Where ID = @idskill
		End
		Return
	End
	
	Else if(@oper='DS')
	Begin
		IF (Select Count(*) From OfertaSkill Where IdSkill = @idskill and Estado = 1)>0
		Begin	
			raiserror('Esta Requerimiento ya se encuentra usado por una oferta', 16,1)
			Return
		End

		Update Skills
		Set Estado = 0, FechaModificacion = GetDate()
		Where Id = @idskill
		
		Select ID, Nombre, FechaCreacion, FechaModificacion, Estado 
		From Skills
		Where Estado = 1
		Return
	End

	Else If (@oper='IO')
	Begin
		If (Select Count(*) From Ofertas Where Titulo = @titulo And idEmpresa = @idempresa And Estado = 1)>0
		Begin
			raiserror('Esta Oferta ya se encuentra registrada', 16,1)
			return
		End

		Insert Into Ofertas(Titulo, Descripcion, Valor, Tiempo, idCategoria, FechaCreacion, FechaModificacion, Estado, idEmpresa)
		Select @titulo, @descripcion, @valor, @tiempo, @categoria, GetDate(), GetDate(), 1, @idempresa

		Select scope_identity() As id
		return
	End

	Else IF(@Oper = 'UO')
	Begin
		Update Ofertas
		Set   Titulo = @titulo, Descripcion = @descripcion, Valor = @valor, Tiempo = @tiempo, idCategoria = @categoria
			, FechaModificacion = GetDate()
		Where ID = @id
		Return
	End

	Else If (@Oper='DO')
	Begin

		Select @idempresa = idEmpresa From Ofertas Where ID = @id
		Update Ofertas
		Set   Estado = 0, FechaModificacion = GetDate()
		Where ID = @id

		Select    Ofertas.ID, Ofertas.Titulo, Convert(varchar(100),Ofertas.Descripcion) + '...' As Descripcion, Convert(Int, Valor) As Valor
				, Ofertas.Tiempo, Ofertas.idCategoria, Ofertas.FechaCreacion, Ofertas.FechaModificacion, Ofertas.Estado
				, Categorias.Nombre As Categoria
		From Ofertas
			Inner Join Categorias On Ofertas.idCategoria = Categorias.ID
		Where Ofertas.Estado = 1 And Ofertas.idEmpresa = @idempresa
	End

	Else If (@oper='SO')
	Begin
		If IsNull(@id, 0)=0
		Begin
			Select    Ofertas.ID, Ofertas.Titulo, Convert(varchar(100),Ofertas.Descripcion) + '...' As Descripcion, Convert(Int, Valor) As Valor
					, Ofertas.Tiempo, Ofertas.idCategoria, Ofertas.FechaCreacion, Ofertas.FechaModificacion, Ofertas.Estado
					, Categorias.Nombre As Categoria
			From Ofertas
				Inner Join Categorias On Ofertas.idCategoria = Categorias.ID
			Where Ofertas.Estado = 1 And Ofertas.idEmpresa = @idempresa
		End
		Else
		Begin
			Select ID, Titulo, Descripcion, Convert(Int, Valor) As Valor, Tiempo, idCategoria, FechaCreacion, FechaModificacion, Estado
			From Ofertas
			Where ID = @id
			
			Select Skills.Nombre As Skills, Ofertas.Descripcion As Ofertas, OfertaSkill.Descripcion As OfertaSkill
			From OfertaSkill
				Inner Join Ofertas On OfertaSkill.IdOferta = Ofertas.ID
				Inner Join Skills On OfertaSkill.IdSkill = Skills.ID
			Where OfertaSkill.IdOferta = @id

			Select   Usuario.Nombre + ' ' + Usuario.Apellidos As Usuario, Usuario.Email, AspirarOferta.ID, Usuario.NombreUsuario
			From AspirarOferta
				Inner Join Usuario On AspirarOferta.IdUsuario = Usuario.ID
				Inner Join Ofertas On AspirarOferta.IdOferta = Ofertas.ID
			Where Ofertas.ID = @id
		End
		Return
	End

	Else If (@Oper='IK')
	Begin
		IF (Select Count(*) From OfertaSkill Where IdOferta = @id And IdSkill = @idskill and Estado = 1)>0
		Begin	
			raiserror('La relación entre esta oferta y esta skill ya existe', 16,1)
			Return
		End
		Insert Into OfertaSkill(IdOferta, IdSkill, Descripcion, FechaModificacion, Estado)
		Select @id, @idskill, @descripcionSkillOferta, GetDate(), 1

		
		Select Skills.Nombre As Skills, Ofertas.Descripcion As Ofertas, OfertaSkill.Descripcion As OfertaSkill
		From OfertaSkill
			Inner Join Ofertas On OfertaSkill.IdOferta = Ofertas.ID
			Inner Join Skills On OfertaSkill.IdSkill = Skills.ID
		Where OfertaSkill.IdOferta = @id
		return
	End

	Else If (@oper='UK')
	Begin
		Update OfertaSkill
		Set IdSkill = @idskill, FechaModificacion = GetDate(), Descripcion = @descripcionSkillOferta
		Where ID = @skilloferta

		
		Select Skills.Nombre As Skills, Ofertas.Descripcion As Ofertas, OfertaSkill.Descripcion As OfertaSkill
		From OfertaSkill
			Inner Join Ofertas On OfertaSkill.IdOferta = Ofertas.ID
			Inner Join Skills On OfertaSkill.IdSkill = Skills.ID
		Where OfertaSkill.IdOferta = @id
		return
	End

	Else If (@oper='DK')
	Begin
		Select @id = IdOferta From OfertaSkill Where ID = @skilloferta

		Update OfertaSkill
		Set Estado = 0, FechaModificacion = GetDate()
		Where ID = @skilloferta

		
		Select Skills.Nombre As Skills, Ofertas.Descripcion As Ofertas, OfertaSkill.Descripcion As OfertaSkill
		From OfertaSkill
			Inner Join Ofertas On OfertaSkill.IdOferta = Ofertas.ID
			Inner Join Skills On OfertaSkill.IdSkill = Skills.ID
		Where OfertaSkill.IdOferta = @id
		return
	End

	Else IF (@oper='SK')
	Begin
		IF IsNull(@skilloferta, 0)=0
		Begin
			Select Skills.Nombre As Skills, Ofertas.Descripcion As Ofertas, OfertaSkill.Descripcion As OfertaSkill
			From OfertaSkill
				Inner Join Ofertas On OfertaSkill.IdOferta = Ofertas.ID
				Inner Join Skills On OfertaSkill.IdSkill = Skills.ID
			Where OfertaSkill.IdOferta = @id
		End
		Else
		Begin
			Select ID, IdOferta, IdSkill, FechaModificacion, Estado, OfertaSkill.Descripcion
			From OfertaSkill
			Where ID = @skilloferta
		End
	End
GO