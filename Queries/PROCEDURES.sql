USE FROMSERIES

/* Procedure para insertar una residencia de un personaje, comprueba que los
datos sean válidos y actualiza la fecha en su residencia anterior */
CREATE OR ALTER PROCEDURE UpdateResidence
(@CharacterName VARCHAR(50),
@NewLocationName VARCHAR(50),
@MoveDate DATE)
AS
	BEGIN
		/* Comprobamos que los datos estén bien */
		IF @CharacterName not in (SELECT FirstName FROM Characters)
			BEGIN
				PRINT 'The character doesn''t exist'
				RETURN
			END
		IF @NewLocationName not in (SELECT LocationName FROM Locations)
			BEGIN
				PRINT 'The location doesn''t exist'
				RETURN
			END

		DECLARE @CharacterID INT = (SELECT CharacterID FROM Characters WHERE FirstName = @CharacterName)
		DECLARE @OldResidenceID INT = (SELECT LocationID FROM Residences WHERE CharacterID = @CharacterID AND EndDate is null)
		DECLARE @NewLocationID INT = (SELECT LocationID FROM Locations WHERE LocationName = @NewLocationName)

		/* Actualizamos residencia anterior con la fecha de la nueva, si 
		no tiene asignada ya, este update no hace nada */

		UPDATE Residences
		SET EndDate = @MoveDate
		WHERE CharacterID = @CharacterID AND LocationID = @OldResidenceID

		/* Introducimos la nueva */

		INSERT INTO Residences (CharacterID, LocationID, StartDate)
		VALUES (@CharacterID, @NewLocationID, @MoveDate)

	END
GO

EXEC UpdateResidence 'Boyd', 'Colony House', '2023-06-25' --DATOS CORRECTOS
EXEC UpdateResidence 'Daniel', 'Colony House', '2023-06-21' --NOMBRE INCORRECTO
EXEC UpdateResidence 'Victor', 'Abandoned House', '2023-06-21' --LOCATION INCORRECTA

SELECT * FROM Characters
SELECT * FROM Locations
SELECT * FROM Residences

/* Muestra los incidentes agrupados por entidad en formato de lista */

CREATE OR ALTER PROCEDURE IncidentsEntities
AS
BEGIN
	DECLARE @EntityID INT
	DECLARE @EntityName VARCHAR(MAX)
	DECLARE @list VARCHAR(MAX)

	PRINT 'INCIDENTS BY ENTITY:' + CHAR(10)

	DECLARE EntityCursor CURSOR FOR
	SELECT DISTINCT ent.EntityID, ent.EntityName
	FROM Incidents inc
	JOIN Entities ent ON inc.EntityID = ent.EntityID
	WHERE inc.EntityID is not null
	ORDER BY ent.EntityName

	OPEN EntityCursor
	FETCH NEXT FROM EntityCursor INTO @EntityID, @EntityName
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @list=''
		
		PRINT UPPER(@EntityName) + ':'
		PRINT '----------------------------------------------------------------------------------------------------------------'
		
		/* Para cada iteración del cursor añade a la lista con un STRING_AGG
		La víctima, localización y descripción. */
		SELECT @list = @list +
		STRING_AGG(CONCAT('Victim: ', cha.FirstName, ' ', CAST(cha.LastName AS CHAR(15)), 
		'Location: ', CAST(loc.LocationName AS CHAR(15)), CHAR(10)
		, inc.Description, CHAR(10))
		,CHAR(10))
		FROM Incidents inc
		JOIN Characters cha ON inc.CharacterID = cha.CharacterID
		JOIN Locations loc ON inc.LocationID = loc.LocationID
		WHERE inc.EntityID = @EntityID

		PRINT @list + CHAR(10)

		FETCH NEXT FROM EntityCursor INTO @EntityID, @EntityName
	END

	CLOSE EntityCursor
	DEALLOCATE EntityCursor
END
GO

EXEC IncidentsEntities


SELECT * FROM Incidents