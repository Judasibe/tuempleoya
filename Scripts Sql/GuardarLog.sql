IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GuardarLog' AND user_name(uid) = 'dbo')
	DROP PROCEDURE [dbo].GuardarLog
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].GuardarLog
(
	@Consulta nvarchar(MAX) = null
)
AS
	SET NOCOUNT OFF;

	Insert Into Log(Query, FechaCreacion)
	Select @Consulta, GETDATE()
GO

