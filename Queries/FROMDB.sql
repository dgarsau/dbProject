--DROP DATABASE FROMSERIES 

CREATE DATABASE FROMSERIES
GO

USE FROMSERIES

CREATE TABLE Characters (
	CharacterID INT IDENTITY PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	ArrivalDate DATE NULL,
	Status VARCHAR(10) NOT NULL,
	Description VARCHAR(250) NULL,
	
	CHECK (Status in ('Alive', 'Dead', 'Missing'))
)

CREATE TABLE Locations (
	LocationID INT IDENTITY PRIMARY KEY,
	LocationName VARCHAR(50) NOT NULL UNIQUE,
	Description VARCHAR(250) NULL
)


CREATE TABLE Episodes (
	EpisodeID INT IDENTITY PRIMARY KEY,
	SeasonNumber INT NOT NULL,
	EpisodeNumber INT NOT NULL,
	Title VARCHAR(50) NOT NULL,
	Synopsis VARCHAR(250) NOT NULL,

	CHECK (SeasonNumber > 0),
	CHECK (EpisodeNumber > 0)
)

CREATE TABLE Entities (
	EntityID INT IDENTITY PRIMARY KEY,
	EntityName VARCHAR(50) NOT NULL UNIQUE,
	EntityType VARCHAR(10) NOT NULL,
	Description VARCHAR(250) NULL,
	
	CHECK (EntityType IN ('Monster', 'Curse'))
)

CREATE TABLE Theories (
	TheoryID INT IDENTITY PRIMARY KEY,
	Title VARCHAR(100) NOT NULL UNIQUE,
	Description VARCHAR(250) NOT NULL,
	Status VARCHAR(20),
	CreatorID INT NOT NULL,

	FOREIGN KEY (CreatorID) REFERENCES Characters(CharacterID),
	CHECK (Status IN ('Proposed', 'Refuted', 'Confirmed'))

)

CREATE TABLE CharacterTheories (
	CharacterID INT NOT NULL,
	TheoryID INT NOT NULL,

	PRIMARY KEY (CharacterID, TheoryID),
	FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID),
	FOREIGN KEY (TheoryID) REFERENCES Theories(TheoryID),
)

CREATE TABLE Incidents (
	IncidentID INT IDENTITY PRIMARY KEY,
	EpisodeID INT NOT NULL,
	LocationID INT NOT NULL,
	CharacterID INT NULL,
	EntityID INT NULL,
	Description VARCHAR(250) NOT NULL,
	
	FOREIGN KEY (EpisodeID) REFERENCES Episodes(EpisodeID),
	FOREIGN KEY (LocationID) REFERENCES Locations(LocationID),
	FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID),
	FOREIGN KEY (EntityID) REFERENCES Entities(EntityID)
)

CREATE TABLE Residences (
	CharacterID INT NOT NULL,
	LocationID INT NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NULL,

	PRIMARY KEY (CharacterID, LocationID, StartDate),
	FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID),
	FOREIGN KEY (LocationID) REFERENCES Locations(LocationID),
	
	CHECK (EndDate IS NULL OR EndDate > StartDate)
)


CREATE TABLE Relationships (
	CharacterID1 INT NOT NULL,
	CharacterID2 INT NOT NULL,
	RelationType VARCHAR(50) NOT NULL,

	PRIMARY KEY (CharacterID1, CharacterID2),
	FOREIGN KEY (CharacterID1) REFERENCES Characters(CharacterID),
	FOREIGN KEY (CharacterID2) REFERENCES Characters(CharacterID),

	CHECK (CharacterID1 != CharacterID2)
)


/* TABLA LOG PARA EL TRIGGER */

CREATE TABLE Logs (
	LogID INT IDENTITY PRIMARY KEY,
	OldRecord VARCHAR(250) NOT NULL,
	NewRecord VARCHAR(250) NOT NULL,
	LogDate DATETIME NOT NULL
)