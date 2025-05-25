USE FROMSERIES

/* Parecido a la procedure, cuando se introduce una residencia, modifica la anterior */
CREATE OR ALTER TRIGGER NewResidence
ON Residences AFTER INSERT
AS
BEGIN
	DECLARE @CharacterID INT = (SELECT CharacterID FROM inserted)
	DECLARE @StartDate DATE = (SELECT StartDate FROM inserted)

	/* Cuenta las residencias del personaje ya que en caso de ser una, no se modifica EndDate*/
	IF (SELECT COUNT(CharacterID)
		FROM Residences 
		WHERE CharacterID = @CharacterID) > 1
	BEGIN
		UPDATE Residences
		SET EndDate = DATEADD(day, -1, @StartDate)
		WHERE CharacterID = @CharacterID AND EndDate is null
	END
END

SELECT * FROM Residences

INSERT INTO Residences (CharacterID, LocationID, StartDate, EndDate)
VALUES
(1, 6, '2025-01-02', '2026-01-02')

/* Cuando se actualiza el estado de un personaje a muerto, se borran sus relaciones y se guarda
el cambio en la tabla de logs */

CREATE OR ALTER TRIGGER CharacterDeath
ON Characters AFTER UPDATE
AS
BEGIN
	DECLARE @CharacterID INT = (SELECT CharacterID FROM inserted)
	DECLARE @NewStatus VARCHAR(10) = (SELECT Status FROM inserted)
	DECLARE @OldStatus VARCHAR(10) = (SELECT Status FROM deleted)
	DECLARE @CharacterName VARCHAR(100) = (SELECT CONCAT(FirstName, ' ', LastName) FROM inserted)

	IF @NewStatus != @OldStatus
	BEGIN
		IF @NewStatus = 'Dead'
		BEGIN
			DELETE FROM Relationships
			WHERE CharacterID1 = @CharacterID OR CharacterID2 = @CharacterID
		END
	
	INSERT INTO Logs(OldRecord, NewRecord, LogDate)
	VALUES (CONCAT(@CharacterName, ': ', @OldStatus), 
	CONCAT(@CharacterName, ': ', @NewStatus),
	GETDATE())
	END
END

SELECT * FROM Characters
SELECT * FROM Logs
SELECT * FROM Relationships

UPDATE Characters
SET Status = 'Dead'
WHERE CharacterID = 2



