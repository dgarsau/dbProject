USE FROMSERIES

/* Las fechas que he usado son aproximadas basándome en la serie */
INSERT INTO Characters (FirstName, LastName, ArrivalDate, Status, Description) 
VALUES 
('Boyd', 'Stevens', '2019-10-23', 'Alive', 'Sheriff and retired veteran, promises to bring people home,'),
('Tabitha', 'Matthews', '2022-02-20', 'Alive', 'She came to the town with her family and has deep connections to the place.'),
('Jim', 'Matthews', '2022-02-20', 'Dead', 'Tabitha''s husband. Worked with Jade to find a way out.'),
('Jade', 'Herrera', '2022-02-20', 'Alive', 'An eccentric software developer haunted by visions.'),
('Donna', 'Raines', '2018-05-10', 'Alive', 'Leader of the residents at Colony House. She lost her sister on the first day,'),
('Victor', 'Kavanaugh', '1981-08-18', 'Alive', 'A rare resident of Colony House, trapped since childhood.'),
('Kristi', 'Miller', '2021-10-12', 'Alive', 'A medical internship student, the only nurse in town.'),
('Sara', 'Myers', '2021-12-21', 'Alive', 'Resident who hears voices and is manipulated by them.'),
('Rudra', 'Khatri', '2019-06-07', 'Dead', 'The town priest and Boyd''s supporter, runs a church in ruins.'),
('Ellis', 'Stevens', '2019-10-23', 'Alive', 'Boyd''s son, lives at Colony House, initially distant with his father.')


INSERT INTO Locations (LocationName, Description) 
VALUES
('The Town', 'The main place where residents live in individual houses, following Boyd''s rules '),
('Colony House', 'A large mansion where a group of residents lives communally, ruled by Donna.'),
('The Forest', 'The woods surrounding the town, home to the monsters and other mysteries.'),
('The Diner', 'The town''s diner, a meeting place and a source of food, managed by Tian-Chen Liu.'),
('Matthews House', 'The house assigned to the Matthews family in the Town. It later collapsed.'),
('Sheriff''s Office', 'Boyd Stevens'' home and base as sheriff.'),
('The Clinic', 'The town''s medical center, managed by Kristi, located in a school building.'),
('The Church', 'A church run by Father Khatri, with a cemetery in the courtyard.'),
('The Caves', 'An underground cave system, where monsters sleep during the day.'),
('The Lighthouse', 'A distant lighthouse in which children are supposed to have been imprisoned')

/* Estos datos corresponden con IMDB */
INSERT INTO Episodes (SeasonNumber, EpisodeNumber, Title, Synopsis) 
VALUES
(1, 1, 'Long Day''s Journey Into Night', 'The Matthews'' family road trip takes a horrifying turn when they are detoured to a small town from which they cannot leave. When their family RV crashes, Sheriff Boyd Stevens and other residents rush to save them before the sun goes down.'),
(1, 2, 'The Way Things Are Now', 'At Colony House, Tabitha and Julie grapple with their new nightmarish reality. Out in the forest, Jim, Boyd and Kristi struggle to treat Ethan''s injuries. Tragedy strikes from an unexpected source as a new threat arises.'),
(1, 3, 'Choosing Day', 'The Matthews family must choose which of the two settlements they will join. Meanwhile, Jade comes to terms with his situation and Boyd is faced with an impossible decision that strikes at the very heart of life in the town.'),
(1, 4, 'A Rock and a Farway', 'Julie and Ethan make new friends, their parents discuss their differences, and Boyd and Khatri talk about Boyd''s role in the community.'),
(1, 5, 'Silhouettes', 'Jim, Tabitha, and Ethan begin asking questions about where they are in the hopes it may lead them home. Ellis and Fatima show Julie the lighter side of life in town. Jade struggles to make sense of their situation as Boyd seeks guidance.'),
(1, 6, 'Book 74', 'Boyd''s plan to head off into the forest provokes an unexpected response from Kenny. Jade enlists Jim''s help with an experiment while Tabitha makes a chilling discovery that sends her down a unique path searching for answers.'),
(1, 7, 'All Good Things...', 'A celebration at Colony House turns into tragedy. Khatri tries to convince Boyd to take him and Sarah with him.'),
(1, 8, 'Broken Windows, Open Doors', 'In the wake of another death, Boyd questions his decision to leave; Kenny steps up and embraces his new role; Jim rallies the town around his idea to build a radio tower'),
(1, 9, 'Into the Woods', 'Boyd takes Sara into the forest to find a way home, and they uncover more mysteries. Some of the townfolk wonder if they want to go home.'),
(1, 10, 'Oh, the Places We''ll Go', 'Jim''s radio tower yields consequences which rock him to his very core. The hole that Tabitha has been digging leads her somewhere - and to someone - she could never have expected. Everything is about to change.')


INSERT INTO Entities (EntityName, EntityType, Description) VALUES
('Smiling Monsters', 'Monster', 'Human-like nocturnal smiling creatures. Sadistic and strong, they require an invitation to enter homes.'),
('Boy in White', 'Monster', 'An apparition of a boy visible only to a select few, mysterious and his intentions are not clear.'),
('Man in Yellow Suit', 'Monster', 'A powerful entity with a yellow suit, mysterious and seems to be closely related to the place.'),
('Cicadas', 'Curse', 'A strong curse causing terror through cicadas and nightmares. Drive people crazy and can kill them in their sleep'),
('Main curse', 'Curse', 'A misterious force that controls the town''s environment, controlling the weather and causing visions.'),
('Sara''s Voices', 'Curse', 'Voices that manipulate Sara, trying to convince her to kill and can predict the future.'),
('Music Box', 'Curse', 'A curse coming from a music box melody, causing madness and visions of a ballerina.'),
('Anghkooey Children', 'Monster', 'Spirits in the form of children who appear to certain residents, repeating "Anghkooey".'),
('Forest Spider', 'Curse', 'A forest entity that creates giant spider webs. Physical and mental threat as it causes visions.'),
('Martin (Chained Man)', 'Curse', 'A chained man who transfers a debilitating "worm" curse through blood contact.')

/* Algún incidente como los relacionados con las voces de Sara los he relacionado con ella aunque
no sea la víctima por que he introducido a los personajes importantes y muchos no aparecen en la base 
de datos*/
INSERT INTO Incidents (EpisodeID, LocationID, CharacterID, EntityID, Description) 
VALUES
--Episodio 1, El pueblo como localización, Tabitha como la afectada, sin entidad
(1, 1, 2, NULL, 'The Matthews family and Jade Herrera''s group arrive in town after their vehicles crash.'),
--Episodio 2, En la clínica, Sara, Voces de Sara
(2, 7, 8, 6, 'Guided by the voices, Sara Myers kills one of the newcomers in the clinic.'),
--Episodio 2, En la clínica, Sara, voces de Sara
(2, 7, 8, 6, 'Sara Myers intentionally lets monsters into the clinic, resulting in a massacre that killed Kenny''s father.'),
--Episodio 3, En el pueblo, Jade, La maldición principal
(3, 1, 4, 5, 'Jade, believing it all to be some sort of escape room, begins to have visions as he walks around town.'),
--Episodio 6, En el bosque, Jade, La maldición principal
(6, 3, 4, 5, 'Jade is tormented by a terrifying vision of a Civil War-era soldier while helping Jim with his radio.'),
--Episodio 5, En el pueblo, Sara, Voces de Sara
(5, 1, 8, 6, 'Under the influence of voices, Sara Myers attempts to harm Ethan Matthews but accidentally kills her own brother.'),
--Episodio 7, En Colony House, El padre Kathri, los monstruos
(7, 2, 9, 1, 'The Colony House Massacre: Monsters infiltrate a party after being let in, killing many residents, including Father Khatri.'),
--Episodio 8, En el bosque, Boyd, los monstruos
(8, 3, 1, 1, 'In a flashback, Boyd Stevens finds talismans hiding from monsters in a cave.'),
--Episodio 9, En el bosque, Boyd, La maldición princial
(9, 3, 1, 5, 'Searching for answers in the forest, a storm breaks out and Boyd runs into a tree that transports him to some ruins.'),
--Episodio 10, En el pueblo, sin afectado principal, sin entidad
(10, 1, NULL, NULL, 'A bus full of new people arrives, introducing a new group of residents.')

/* Para las fechas de las residencias me he basado en el inicio de la serie como
fecha real y una aproximación según el orden de llegada y diferentes sucesos. 
Por ejemplo, las que tienen fecha de fin se basan en un derrumbe de una casa y estancias
del primer día en el pueblo*/
INSERT INTO Residences (CharacterID, LocationID, StartDate, EndDate)
VALUES
(1, 6, '2020-01-02', NULL), 
(10, 2, '2020-01-17', NULL),
(5, 2, '2020-01-12', NULL),
(6, 2, '1984-12-19', NULL),
(2, 2, '2022-02-20', '2022-02-21'),
(2, 5, '2022-02-21', '2022-03-14'),
(2, 1, '2022-03-14', NULL),
(3, 2, '2022-02-20', '2022-02-21'),
(4, 2, '2022-02-20', '2022-02-24'),
(4, 1, '2022-02-24', NULL);

INSERT INTO Relationships (CharacterID1, CharacterID2, RelationType)
VALUES
(1, 10, 'Family'),
(2, 3, 'Married'),
(1, 9, 'Friends'),
(3, 4, 'Allies'),
(1, 5, 'Leaders'),
(5, 10, 'Friends'),
(4, 6, 'Tense Relationship'),
(1, 8, 'Tense Relationship'),
(8, 2, 'Conflict'),
(4, 2, 'Allies')

INSERT INTO Theories (Title, Description, Status, CreatorID)
VALUES
('The symbol means something', 'In his visions, Jade sees a symbol repeatedly. He believes he can get answers through it.', 'Proposed', 4),
('It''s all part of an experiment', 'Jim thinks it''s all part of an experiment similar to those conducted during World War II.', 'Proposed', 3)

INSERT INTO CharacterTheories (CharacterID, TheoryID)
VALUES
(4,1),
(2,1),
(6,1),
(3,2)

