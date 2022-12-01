CREATE DATABASE IF NOT EXISTS swimming;
USE swimming;


CREATE TABLE IF NOT EXISTS Event (
  eventId       INT UNSIGNED,
  eventName     CHAR(50),

  PRIMARY KEY (eventID)
);


CREATE TABLE IF NOT EXISTS Venue (
  venueId       INT UNSIGNED,
  name          CHAR(100),
  location      CHAR(100),
  phone         CHAR(13),
  managerName   CHAR(50),

  PRIMARY KEY (venueId)
);


CREATE TABLE IF NOT EXISTS Swimmer (
  swimmerId     INT UNSIGNED,
  name          CHAR(50),
  birthDate     DATETIME,
  gender        CHAR(1),
  specialisation INT UNSIGNED,

  PRIMARY KEY (swimmerId),
  FOREIGN KEY (specialisation) REFERENCES Event (eventId)
);


CREATE TABLE IF NOT EXISTS Competition (
  compId        INT UNSIGNED,
  compName      CHAR(100),
  _date         DATETIME,
  venueId       INT UNSIGNED,

  PRIMARY KEY (compId),
  FOREIGN KEY (venueId) REFERENCES Venue (venueId)
);


CREATE TABLE IF NOT EXISTS Swim (
  swimmerId     INT UNSIGNED,
  compId        INT UNSIGNED,
  eventId       INT UNSIGNED,
  performanceTime   DOUBLE,
  position      INT UNSIGNED,

  PRIMARY KEY (swimmerId, compId, eventId),
  FOREIGN KEY (swimmerId) REFERENCES Swimmer (swimmerId),
  FOREIGN KEY (compId) REFERENCES Competition (compId),
  FOREIGN KEY (eventId) REFERENCES Event (eventId)
);


INSERT INTO Venue VALUES (1, "That pool over there", "1st St Novaskotia", "1800333000", "Nancy");
INSERT INTO Venue VALUES (2, "Parramatta olympic stadium", "21 Hansen St", "0404040040", "Mary");
INSERT INTO Venue VALUES (3, "Blacktown community pools", "1 Main St", "691418300927", "Bruce");
INSERT INTO Competition VALUES (1, "Competition of all time!", "1888-04-19", 1);
INSERT INTO Competition VALUES (2, "Competition for someone else!", "1800-02-22", 2);
INSERT INTO Competition VALUES (3, "Try and beat me!", "1930-09-28", 3);
INSERT INTO Event VALUES (1, "100m Free");
INSERT INTO Event VALUES (2, "250m Butter");
INSERT INTO Event VALUES (3, "500m Breath");
INSERT INTO Swimmer VALUES (1, "Georgene Shalash", "1857-10-08", "F", 3);
INSERT INTO Swimmer VALUES (2, "Winford Shropshire", "1977-04-18", "F", 1);
INSERT INTO Swimmer VALUES (3, "Percy Tillis", "1996-10-28", "F", 2);
INSERT INTO Swimmer VALUES (4, "Demetrius Lovette", "1855-02-26", "F", 3);
INSERT INTO Swimmer VALUES (5, "Ivey Hentz", "1804-06-05", "M", 1);
INSERT INTO Swim VALUES (1, 1, 1, 89.995, 3);
INSERT INTO Swim VALUES (2, 1, 1, 91.925, 2);
INSERT INTO Swim VALUES (5, 1, 1, 94.598, 1);
INSERT INTO Swim VALUES (5, 1, 3, 43.454, 4);
INSERT INTO Swim VALUES (4, 1, 3, 73.111, 3);
INSERT INTO Swim VALUES (1, 1, 3, 77.089, 2);
INSERT INTO Swim VALUES (2, 1, 3, 79.332, 1);
INSERT INTO Swim VALUES (5, 2, 1, 48.454, 4);
INSERT INTO Swim VALUES (4, 2, 1, 63.155, 3);
INSERT INTO Swim VALUES (1, 2, 1, 77.089, 2);
INSERT INTO Swim VALUES (2, 2, 1, 79.332, 1);
INSERT INTO Swim VALUES (1, 3, 1, 98.952, 2);
INSERT INTO Swim VALUES (5, 3, 1, 98.951, 1);
INSERT INTO Swim VALUES (5, 3, 2, 48.454, 5);
INSERT INTO Swim VALUES (4, 3, 2, 36.420, 4);
INSERT INTO Swim VALUES (1, 3, 2, 32.651, 3);
INSERT INTO Swim VALUES (2, 3, 2, 27.729, 2);
INSERT INTO Swim VALUES (3, 3, 2, 18.426, 1);
