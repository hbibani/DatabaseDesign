-- SQL TABLE CREATION SCRIPT

-- Delete any existing tables
-- Note that Underscores are used to differentiate from existing tables in the database
DROP TABLE _Booking;
DROP TABLE _Client;
DROP TABLE TrainingItem;
DROP TABLE CoachAchievements;
DROP TABLE Achievements;
DROP TABLE ExpertiseCoach;
DROP TABLE Expertise;
DROP TABLE Coach;
DROP TABLE Venue;


-- Create all the tables
create table Coach ( 
	coachID int, 
	firstName varchar(50), 
	lastName varchar(50), 
	phoneNumber varchar(50), 
	email varchar(50), 
	addressOF varchar(200),
	postCode varchar(4),
	CONSTRAINT Coach_pk PRIMARY KEY(coachID)
);


create table Achievements ( 
	achievementsID int, 
	descript varchar(200), 
	CONSTRAINT Achievements_pk PRIMARY KEY(achievementsID)
);


create table CoachAchievements ( 
	coachID int, 
	achievementsID int 
	CONSTRAINT CoachAchievements_pk PRIMARY KEY(coachID, achievementsID), 
	CONSTRAINT coachAch_fk FOREIGN KEY(coachID) REFERENCES Coach,
	CONSTRAINT achievements_fk FOREIGN KEY(achievementsID) REFERENCES Achievements 
);


create table Expertise ( 
	expertiseID int, 
	descript varchar(50), 
	CONSTRAINT expertise_pk PRIMARY KEY(expertiseID)
);

 
create table ExpertiseCoach ( 
	expertiseCoachID int, 
	expertiseID int, 
	coachID int, 
	costPerHour money, 
	CONSTRAINT ExpertiseCoach_pk PRIMARY KEY(expertiseCoachID),
	CONSTRAINT expertise_fk FOREIGN KEY(expertiseID) REFERENCES Expertise,
	CONSTRAINT coachExp_fk FOREIGN KEY(coachID) REFERENCES Coach 
);

 
create table Venue (
	venueID int, 
	venueName varchar(50), 
	telephoneNo varchar(50), 
	addr varchar(200), 
	postCode varchar(4),
	CONSTRAINT Venue_pk PRIMARY KEY(venueID) 
);


create table TrainingItem ( 
	trainingItemID int, 
	expertiseCoachID int, 
	venueID int, 
	CONSTRAINT trainingItem_pk PRIMARY KEY(trainingItemID), 
	CONSTRAINT expertiseCoachID_fk FOREIGN KEY(expertiseCoachID) REFERENCES ExpertiseCoach, 
	CONSTRAINT Venue_fk FOREIGN KEY(venueID) REFERENCES Venue 
);

 
create table _Client ( 
	clientID int, 
	fName varchar(50), 
	lName varchar(50), 
	phoneNo varchar(50), 
	addr varchar(200),
	CONSTRAINT client_pk PRIMARY KEY(clientID)
);
 

create table _Booking ( 
	bookingID int, 
	trainingItemID int, 
	clientID int, 
	timeStart datetime, 
	timeFinish datetime, 
	paymentStatus int,
	travelTime time,
	travelCost money, 
	CONSTRAINT booking_pk PRIMARY KEY(bookingID), 
	CONSTRAINT trainingitem_fk FOREIGN KEY(trainingItemID) REFERENCES TrainingItem, 
	CONSTRAINT client_fk FOREIGN KEY(clientID) REFERENCES _Client 
);


-- Insert some example records
INSERT INTO _Client VALUES (1, 'Josh', 'Frydenberg', '049994958', '77 summersby drive springvale'),
							(2, 'Scott', 'Morrison', '130069694', 'Parliament house'),
							(3, 'Bill', 'Shorten', '9932040831', '67 brookvale ave denisville');

INSERT INTO Coach VALUES (1, 'Alan', 'Jones', '043087835', 'alan.jones@2GB.com', '88 Macquarie st Macquarie', '2141'),
							(2, 'Ben', 'Fordham', '831583985', 'ben.fordham@2GB.com', '101 bushy st Springwood', '2801'),
							(3, 'Rita', 'Pannahi', '9932040831', 'r.pannahi@skynews.com.au', '12 brookvale ave Wollongong', '2032');

INSERT INTO Venue VALUES (1, 'Revesby Maths Highschool', '0400504032', '132 desterbury dr Revesby', '2223'),
							(2, 'Blacktown City Swimming pool', '999494942', '12 Main st Blacktown', '2760'),
							(3, 'Jacaranda Grammar School', '8985341112', '84 10th st Jacaranda', '2681');

INSERT INTO Achievements VALUES (1, 'Yo, this is to commemorate that someone did really well at swimming'),
							(2, 'Hey, this guy did really good at maths'),
							(3, 'Grammar and english bro');

INSERT INTO CoachAchievements VALUES (1, 2),
							(1, 3),
							(2, 1),
							(3, 1),
							(3, 2);

INSERT INTO Expertise VALUES (1, 'swimming'),
							(2, 'maths'),
							(3, 'english'),
							(4, 'grammar and punctuation');

INSERT INTO ExpertiseCoach VALUES (1, 2, 3, 61.45),
							(2, 1, 3, 77.33),
							(3, 2, 1, 55.45),
							(4, 3, 1, 51.12),
							(5, 2, 2, 82.96),
							(6, 1, 2, 44.81);

INSERT INTO TrainingItem VALUES (1, 1, 1),
							(2, 6, 2),
							(3, 4, 1),
							(4, 4, 3);

INSERT INTO _Booking VALUES (1, 1, 3, '10-Oct-2019 08:30:00', '10-Oct-2019 10:30:00', 1, '01:00:00', 0.0),
							(2, 2, 2, '10-Oct-2019 09:30:00', '10-Oct-2019 11:30:00', 0, '01:00:00', 0.0),
							(3, 3, 1, '10-Oct-2019 14:00:00', '10-Oct-2019 16:00:00', 1, '00:00:00', 0.0),
							(4, 4, 2, '10-Oct-2019 16:30:00', '10-Oct-2019 18:30:00', 0, '00:30:00', 12.45);