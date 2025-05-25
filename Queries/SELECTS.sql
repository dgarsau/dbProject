USE FROMSERIES

/* Selecciona los datos relacionados con los incidentes. En caso de no
tener un personaje claro asociado, se pone various. Por eso un LEFT JOIN
y el CASE. Ordena por capítulo. */

SELECT CONCAT(epi.SeasonNumber, 'x', epi.EpisodeNumber) AS 'Episode'
, CASE 
	WHEN cha.CharacterID IS NULL THEN 'Various'
	ELSE CONCAT(cha.FirstName, ' ', cha.LastName)
	END AS 'Character'
, loc.LocationName AS 'Location'
, inc.Description
FROM Incidents inc 
LEFT JOIN Characters cha ON inc.CharacterID = cha.CharacterID
JOIN Locations loc ON inc.LocationID = loc.LocationID
JOIN Episodes epi ON inc.EpisodeID = epi.EpisodeID
ORDER BY inc.EpisodeID ASC

/* Muestra los nombres de los personajes, su estado, su fecha
de llegada y el número de incidentes asociados. */

SELECT CONCAT(cha.FirstName, ' ', cha.LastName) AS 'Character'
, cha.ArrivalDate
, cha.Status
, COUNT(inc.IncidentID) AS 'Incidents'
FROM Characters cha
LEFT JOIN Incidents inc ON cha.CharacterID = inc.CharacterID
GROUP BY cha.FirstName, cha.LastName, cha.ArrivalDate,  cha.Status
ORDER BY COUNT(inc.IncidentID) DESC


/* Muestra las residencias de los personajes, ordenadas por
personaje y por fecha de inicio */

SELECT CONCAT(cha.FirstName, ' ', cha.LastName) AS 'Character'
, loc.LocationName, res.StartDate, res.EndDate
FROM Characters cha
JOIN Residences res ON cha.CharacterID = res.CharacterID 
JOIN Locations loc ON res.LocationID = loc.LocationID
ORDER BY cha.CharacterID, res.StartDate

/* Mostrar el número de incidentes ordenados por causa
(monstruo, maldición u otro) */

SELECT COUNT(IncidentID) AS 'Incidents caused by monsters'
, (SELECT COUNT(IncidentID)
	FROM Incidents inc
	JOIN Entities ent ON inc.EntityID = ent.EntityID
	WHERE EntityType = 'Curse') AS 'Incidents caused by curses'
,(SELECT COUNT(IncidentID)
	FROM Incidents inc
	WHERE EntityID is null) AS 'Other causes'
FROM Incidents inc
JOIN Entities ent ON inc.EntityID = ent.EntityID
WHERE EntityType = 'Monster'

/* Muestra las relaciones de una forma más clara */

SELECT CONCAT(cha1.FirstName, ' ', cha1.LastName) AS 'Character'
, CONCAT(cha2.FirstName, ' ', cha2.LastName) AS 'Character'
, rel.RelationType
FROM Relationships rel
JOIN Characters cha1 ON rel.CharacterID1 = cha1.CharacterID
JOIN Characters cha2 ON rel.CharacterID2 = cha2.CharacterID


