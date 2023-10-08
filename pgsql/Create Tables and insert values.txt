CREATE DATABASE Hossein;
OWNER =  postgres			
ENCODING = 'UTF8'
LC_COLLATE = 'English_India.1252'			
LC_CTYPE = 'English_India.1252'
TABLESPACE = pg_default
CONNECTION LIMIT = -1


-- create tables

CREATE TABLE FundingAgent
( 
Name VARCHAR (50) NOT NULL PRIMARY KEY , 
addrress text NOT NULL,
phone VARCHAR (50) NOT NULL
);


CREATE TABLE Grante
( 
GrantNumber integer NOT NULL PRIMARY KEY , 
Amount NUMERIC NOT NULL,
period VARCHAR (50) NOT NULL
);


CREATE TABLE Projects
( 
ProjectsNumber integer NOT NULL PRIMARY KEY ,
Name text NOT NULL
);


CREATE TABLE Topic
( 
TopicCode integer NOT NULL PRIMARY KEY ,
Title VARCHAR (50) NOT NULL
);

CREATE TABLE Researcher 
(
ID integer NOT NULL PRIMARY KEY, 
Email VARCHAR (50) NOT NULL, 
Name VARCHAR (50) NOT NULL, 
Phone VARCHAR (50) NOT NULL, 
Office VARCHAR (50) NOT NULL
);


CREATE TABLE Report 
(
ReportNumber integer NOT NULL PRIMARY KEY, 
Title text NOT NULL
);

--related tables

CREATE TABLE Provides 
(
GrantNumber integer NOT NULL,
FOREIGN KEY(GrantNumber) REFERENCES Grante(GrantNumber), 
Name VARCHAR (50) NOT NULL,
FOREIGN KEY(Name) REFERENCES FundingAgent(Name)
);


CREATE TABLE Supports 
(
GrantNumber integer NOT NULL,
FOREIGN KEY(GrantNumber) REFERENCES Grante(GrantNumber), 
ProjectsNumber integer NOT NULL,
FOREIGN KEY(ProjectsNumber) REFERENCES Projects(ProjectsNumber)
);


CREATE TABLE Involve 
(ProjectsNumber integer NOT NULL,
FOREIGN KEY(ProjectsNumber) REFERENCES Projects(ProjectsNumber), 
TopicCode integer NOT NULL,
FOREIGN KEY(TopicCode) REFERENCES Topic(TopicCode)
);


CREATE TABLE Works 
(
ID integer NOT NULL,
FOREIGN KEY(ID) REFERENCES Researcher(ID), 
ProjectsNumber integer NOT NULL,
FOREIGN KEY(ProjectsNumber) REFERENCES Projects(ProjectsNumber)
);


CREATE TABLE Writes 
(
ID integer NOT NULL,
FOREIGN KEY(ID) REFERENCES Researcher(ID), 
ReportNumber integer NOT NULL,
FOREIGN KEY(ReportNumber) REFERENCES Report(ReportNumber)
);


CREATE TABLE Investigates 
(
ProjectsNumber integer NOT NULL,
FOREIGN KEY(ProjectsNumber) REFERENCES Projects(ProjectsNumber), 
ID integer NOT NULL,
FOREIGN KEY(ID) REFERENCES Researcher(ID)
);



CREATE TABLE Concerns
(
TopicCode integer NOT NULL,
FOREIGN KEY(TopicCode) REFERENCES Topic(TopicCode),
ReportNumber integer NOT NULL,
FOREIGN KEY(ReportNumber) REFERENCES Report(ReportNumber)
);


-- values

INSERT INTO FundingAgent(Name,addrress,phone) VALUES  ('NSERC','350 Albert Street-Ottawa- ON K1A 1H5','613-995-4273');
INSERT INTO FundingAgent(Name,addrress,phone) VALUES  ('OMAFRA','1 Stone Road West-Guelph-ON N1G 4Y2','519-826-3100');


INSERT INTO Grante(GrantNumber,Amount,period) VALUES  (6733,'10000','2019-2020');
INSERT INTO Grante(GrantNumber,Amount,period) VALUES  (2355,'80000','2019-2022');
INSERT INTO Grante(GrantNumber,Amount,period) VALUES  (3744,'15000','2018-2019');
INSERT INTO Grante(GrantNumber,Amount,period) VALUES  (6347,'20000','2017-2020');
INSERT INTO Grante(GrantNumber,Amount,period) VALUES  (9877,'35000','2019-2022');

INSERT INTO Projects(ProjectsNumber,Name) VALUES  (10001,'A unified database structure for structured/unstructured/semistructured data');
INSERT INTO Projects(ProjectsNumber,Name) VALUES  (10002,'Advanced Machine learning in analyzing crop images');
INSERT INTO Projects(ProjectsNumber,Name) VALUES  (10003,'Efficient functional programming in Big Data');

INSERT INTO Topic(TopicCode,Title) VALUES  (301,'Machine learning');
INSERT INTO Topic(TopicCode,Title) VALUES  (302,'Databases');
INSERT INTO Topic(TopicCode,Title) VALUES  (303,'Big Data');
INSERT INTO Topic(TopicCode,Title) VALUES  (304,'Programming languages');

INSERT INTO Researcher(ID,Email,Name,Phone,Office) VALUES  (102323,'james@uoguelph.ca','James','X52838','REY3203');
INSERT INTO Researcher(ID,Email,Name,Phone,Office) VALUES  (103946,'jones@uoguelph.ca','Jones','X53371','REY3101');
INSERT INTO Researcher(ID,Email,Name,Phone,Office) VALUES  (117673,'white@uoguelph.ca','White','X56652','REY2331');
INSERT INTO Researcher(ID,Email,Name,Phone,Office) VALUES  (134262,'brown@uoguelph.ca','Brown','X53342','REY3228');
INSERT INTO Researcher(ID,Email,Name,Phone,Office) VALUES  (106469,'green@uoguelph.ca','Green','X54693','REY2044');
INSERT INTO Researcher(ID,Email,Name,Phone,Office) VALUES  (225320,'murry@uoguelph.ca','Murry','X52289','REY2388');
INSERT INTO Researcher(ID,Email,Name,Phone,Office) VALUES  (324201,'smith@uoguelph.ca','Smith','X54334','REY3781');
INSERT INTO Researcher(ID,Email,Name,Phone,Office) VALUES  (849171,'field@uoguelph.ca','Field','X56381','REY3544');

INSERT INTO Report(ReportNumber,Title) VALUES  (552,'A space efficient data warehouse');
INSERT INTO Report(ReportNumber,Title) VALUES  (554,'Computer vision based crop growth monitoring');
INSERT INTO Report(ReportNumber,Title) VALUES  (561,'Automated data extraction in big data analytics');
INSERT INTO Report(ReportNumber,Title) VALUES  (565,'A new hashing structure for large key-value data sets');
INSERT INTO Report(ReportNumber,Title) VALUES  (577,'Yet another language for big data analysis');


--related values

INSERT INTO Provides(GrantNumber, Name) VALUES  (6733,'NSERC');
INSERT INTO Provides(GrantNumber, Name) VALUES  (2355,'OMAFRA');
INSERT INTO Provides(GrantNumber, Name) VALUES  (3744,'NSERC');
INSERT INTO Provides(GrantNumber, Name) VALUES  (6347,'NSERC');
INSERT INTO Provides(GrantNumber, Name) VALUES  (9877,'OMAFRA');

INSERT INTO Works (ID,ProjectsNumber) VALUES  (102323,10002);
INSERT INTO Works (ID,ProjectsNumber) VALUES  (103946,10001);
INSERT INTO Works (ID,ProjectsNumber) VALUES  (106469,10003);
INSERT INTO Works (ID,ProjectsNumber) VALUES  (225320,10002);
INSERT INTO Works (ID,ProjectsNumber) VALUES  (324201,10003);
INSERT INTO Works (ID,ProjectsNumber) VALUES  (849171,10001);

INSERT INTO Involve (ProjectsNumber, TopicCode) VALUES  (10001,302);
INSERT INTO Involve (ProjectsNumber, TopicCode) VALUES  (10001,303);
INSERT INTO Involve (ProjectsNumber, TopicCode) VALUES  (10002,301);
INSERT INTO Involve (ProjectsNumber, TopicCode) VALUES  (10003,303);
INSERT INTO Involve (ProjectsNumber, TopicCode) VALUES  (10003,304);

INSERT INTO Concerns (TopicCode,ReportNumber) VALUES  (302,552);
INSERT INTO Concerns (TopicCode,ReportNumber) VALUES  (303,552);
INSERT INTO Concerns (TopicCode,ReportNumber) VALUES  (301,554);
INSERT INTO Concerns (TopicCode,ReportNumber) VALUES  (302,561);
INSERT INTO Concerns (TopicCode,ReportNumber) VALUES  (303,561);
INSERT INTO Concerns (TopicCode,ReportNumber) VALUES  (303,565);
INSERT INTO Concerns (TopicCode,ReportNumber) VALUES  (303,577);
INSERT INTO Concerns (TopicCode,ReportNumber) VALUES  (304,577);

INSERT INTO Supports(GrantNumber, ProjectsNumber) VALUES  (6733,10001);
INSERT INTO Supports(GrantNumber, ProjectsNumber) VALUES  (2355,10002);
INSERT INTO Supports(GrantNumber, ProjectsNumber) VALUES  (3744,10001);
INSERT INTO Supports(GrantNumber, ProjectsNumber) VALUES  (6347,10003);
INSERT INTO Supports(GrantNumber, ProjectsNumber) VALUES  (9877,10002);

INSERT INTO Writes (ID,ReportNumber) VALUES  (102323,554);
INSERT INTO Writes (ID,ReportNumber) VALUES  (103946,552);
INSERT INTO Writes (ID,ReportNumber) VALUES  (103946,561);
INSERT INTO Writes (ID,ReportNumber) VALUES  (117673,552);
INSERT INTO Writes (ID,ReportNumber) VALUES  (117673,561);
INSERT INTO Writes (ID,ReportNumber) VALUES  (117673,565);
INSERT INTO Writes (ID,ReportNumber) VALUES  (117673,577);
INSERT INTO Writes (ID,ReportNumber) VALUES  (134262,554);
INSERT INTO Writes (ID,ReportNumber) VALUES  (106469,577);
INSERT INTO Writes (ID,ReportNumber) VALUES  (225320,554);
INSERT INTO Writes (ID,ReportNumber) VALUES  (324201,577);
INSERT INTO Writes (ID,ReportNumber) VALUES  (849171,552);
INSERT INTO Writes (ID,ReportNumber) VALUES  (849171,565);

INSERT INTO Investigates (ProjectsNumber, ID) VALUES (10001,117673);
INSERT INTO Investigates (ProjectsNumber, ID) VALUES (10003,117673);
INSERT INTO Investigates (ProjectsNumber, ID) VALUES (10002,134262);