IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SpCategoria' AND user_name(uid) = 'dbo')
	DROP PROCEDURE [dbo].SpCategoria
GO
CREATE PROCEDURE [dbo].SpCategoria
(
	  @oper varchar(2)
	, @categoria varchar(100)	= ''
	, @id int					= 0
)
AS
	SET NOCOUNT OFF;
	if(@oper='I')
	Begin
		If IsNull(@categoria,'')=''
		Begin
			Raiserror('Debe escribir el nombre de la categoria', 16,1)
			Return
		End

		If (Select Count(*) From Categorias Where Nombre = @categoria)>0
		Begin
			Raiserror('Nombre de categoria ya usuado', 16,1)
			Return
		End

		Insert Into Categorias(Nombre, FechaCreacion, FechaModificacion, Estado)
		Select @categoria, GetDate(),GetDate(), 1

		Select scope_identity() As id
	End	

	Else if(@oper='S')
	Begin
		If IsNull(@id, 0)=0
		Begin
			Select Nombre, FechaCreacion, Estado, FechaModificacion, ID
			From Categorias
			Where Estado = 1
		End
		Else
		Begin
			Select Nombre, FechaCreacion, Estado, FechaModificacion, ID
			From Categorias
			Where ID = @id
		End
		
	End
	
	Else if(@oper='D')
	Begin
		
		If (Select Count(*) From Empresas where IdCategoria = @id And Estado = 1)>0
		Begin
			Raiserror('Esta Categoria no se puede eliminar porque tiene una o mas empresas asociadas', 16,1)
			Return
		End

		Update Categorias
		Set FechaModificacion = GetDate(), Estado = 0
		Where ID = @id

		
		Select Nombre, FechaCreacion, Estado, FechaModificacion, ID
		From Categorias
		Where Estado = 1
	End

	Else if(@oper='U')
	Begin
		If IsNull(@categoria,'')=''
		Begin
			Raiserror('Debe escribir el nombre de la categoria', 16,1)
			Return
		End

		If (Select Count(*) From Categorias Where Nombre = @categoria)>0
		Begin
			Raiserror('Nombre de categoria ya usuado', 16,1)
			Return
		End
		Update Categorias
		Set FechaModificacion = GetDate(), Nombre = @categoria
		Where ID = @id
	End
GO

