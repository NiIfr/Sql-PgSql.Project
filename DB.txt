use master 
go
create database HOSSEIN_DB collate persian_100_cs_as
go
use HOSSEIN_DB
go

--create tables

create table FundingAgent( Name nvarchar (50) not null primary key , addrress text not null,phone nvarchar(50) not null);
create table Grante( GrantNumber int not null primary key , Amount money not null,period nvarchar(50) not null);
create table Project( ProjectNumber int not null primary key ,Name text not null);
create table Topic( TopicCode int not null primary key ,Title nvarchar (50) not null);
create table Researcher (ID int not null primary key, Email nvarchar (50) not null, Name nvarchar (50) not null, Phone nvarchar (50) not null, Office nvarchar (50) not null);
create table Report (ReportNumber int not null primary key, Title text not null);
go



--related tables

create table Provides (GrantNumber int not null,foreign key(GrantNumber) REFERENCES Grante(GrantNumber), Name nvarchar (50) not null,foreign key(Name) REFERENCES FundingAgent(Name));
create table Supports (GrantNumber int not null,foreign key(GrantNumber) REFERENCES Grante(GrantNumber), ProjectNumber int not null,foreign key(ProjectNumber) REFERENCES Project(ProjectNumber));
create table Involve (ProjectNumber int not null,foreign key(ProjectNumber) REFERENCES Project(ProjectNumber), TopicCode int not null,foreign key(TopicCode) REFERENCES Topic(TopicCode));
create table Works (ID int not null,foreign key(ID) REFERENCES Researcher(ID), ProjectNumber int not null,foreign key(ProjectNumber) REFERENCES Project(ProjectNumber));
create table Writes (ID int not null,foreign key(ID) REFERENCES Researcher(ID), ReportNumber int not null,foreign key(ReportNumber) REFERENCES Report(ReportNumber));
create table Investigates (ProjectNumber int not null,foreign key(ProjectNumber) REFERENCES Project(ProjectNumber), ID int not null,foreign key(ID) REFERENCES Researcher(ID));
create table Concerns(TopicCode int not null,foreign key(TopicCode) REFERENCES Topic(TopicCode),ReportNumber int not null,foreign key(ReportNumber) REFERENCES Report(ReportNumber))
go




-- values

insert into FundingAgent(Name,addrress,phone) values ('NSERC','350 Albert Street-Ottawa- ON K1A 1H5','613-995-4273')
insert into FundingAgent(Name,addrress,phone) values ('OMAFRA','1 Stone Road West-Guelph-ON N1G 4Y2','519-826-3100')
go


insert into Grante(GrantNumber,Amount,period) values (6733,'$10000','2019-2020')
insert into Grante(GrantNumber,Amount,period) values (2355,'$80000','2019-2022')
insert into Grante(GrantNumber,Amount,period) values (3744,'$15000','2018-2019')
insert into Grante(GrantNumber,Amount,period) values (6347,'$20000','2017-2020')
insert into Grante(GrantNumber,Amount,period) values (9877,'$35000','2019-2022')
go

insert into Project(ProjectNumber,Name) values (10001,'A unified database structure for structured/unstructured/semistructured data')
insert into Project(ProjectNumber,Name) values (10002,'Advanced Machine learning in analyzing crop images')
insert into Project(ProjectNumber,Name) values (10003,'Efficient functional programming in Big Data')
go

insert into Topic(TopicCode,Title) values (301,'Machine learning')
insert into Topic(TopicCode,Title) values (302,'Databases')
insert into Topic(TopicCode,Title) values (303,'Big Data')
insert into Topic(TopicCode,Title) values (304,'Programming languages')
go

insert into Researcher(ID,Email,Name,Phone,Office) values (102323,'james@uoguelph.ca','James','X52838','REY3203')
insert into Researcher(ID,Email,Name,Phone,Office) values (103946,'jones@uoguelph.ca','Jones','X53371','REY3101')
insert into Researcher(ID,Email,Name,Phone,Office) values (117673,'white@uoguelph.ca','White','X56652','REY2331')
insert into Researcher(ID,Email,Name,Phone,Office) values (134262,'brown@uoguelph.ca','Brown','X53342','REY3228')
insert into Researcher(ID,Email,Name,Phone,Office) values (106469,'green@uoguelph.ca','Green','X54693','REY2044')
insert into Researcher(ID,Email,Name,Phone,Office) values (225320,'murry@uoguelph.ca','Murry','X52289','REY2388')
insert into Researcher(ID,Email,Name,Phone,Office) values (324201,'smith@uoguelph.ca','Smith','X54334','REY3781')
insert into Researcher(ID,Email,Name,Phone,Office) values (849171,'field@uoguelph.ca','Field','X56381','REY3544')
go

insert into Report(ReportNumber,Title) values (552,'A space efficient data warehouse')
insert into Report(ReportNumber,Title) values (554,'Computer vision based crop growth monitoring')
insert into Report(ReportNumber,Title) values (561,'Automated data extraction in big data analytics')
insert into Report(ReportNumber,Title) values (565,'A new hashing structure for large key-value data sets')
insert into Report(ReportNumber,Title) values (577,'Yet another language for big data analysis')
go



--related values

insert into Provides(GrantNumber, Name) values (6733,'NSERC')
insert into Provides(GrantNumber, Name) values (2355,'OMAFRA')
insert into Provides(GrantNumber, Name) values (3744,'NSERC')
insert into Provides(GrantNumber, Name) values (6347,'NSERC')
insert into Provides(GrantNumber, Name) values (9877,'OMAFRA')
go 

insert into Works (ID,ProjectNumber) values (102323,10002)
insert into Works (ID,ProjectNumber) values (103946,10001)

insert into Works (ID,ProjectNumber) values (106469,10003)
insert into Works (ID,ProjectNumber) values (225320,10002)
insert into Works (ID,ProjectNumber) values (324201,10003)
insert into Works (ID,ProjectNumber) values (849171,10001)
go

insert into Involve (ProjectNumber, TopicCode) values (10001,302)
insert into Involve (ProjectNumber, TopicCode) values (10001,303)
insert into Involve (ProjectNumber, TopicCode) values (10002,301)
insert into Involve (ProjectNumber, TopicCode) values (10003,303)
insert into Involve (ProjectNumber, TopicCode) values (10003,304)
go

insert into Concerns (TopicCode,ReportNumber) values (302,552)
insert into Concerns (TopicCode,ReportNumber) values (303,552)
insert into Concerns (TopicCode,ReportNumber) values (301,554)
insert into Concerns (TopicCode,ReportNumber) values (302,561)
insert into Concerns (TopicCode,ReportNumber) values (303,561)
insert into Concerns (TopicCode,ReportNumber) values (303,565)
insert into Concerns (TopicCode,ReportNumber) values (303,577)
insert into Concerns (TopicCode,ReportNumber) values (304,577)
go

insert into Supports(GrantNumber, ProjectNumber) values (6733,10001)
insert into Supports(GrantNumber, ProjectNumber) values (2355,10002)
insert into Supports(GrantNumber, ProjectNumber) values (3744,10001)
insert into Supports(GrantNumber, ProjectNumber) values (6347,10003)
insert into Supports(GrantNumber, ProjectNumber) values (9877,10002)
go

insert into Writes (ID,ReportNumber) values (102323,554)
insert into Writes (ID,ReportNumber) values (103946,552)
insert into Writes (ID,ReportNumber) values (103946,561)
insert into Writes (ID,ReportNumber) values (117673,552)
insert into Writes (ID,ReportNumber) values (117673,561)
insert into Writes (ID,ReportNumber) values (117673,565)
insert into Writes (ID,ReportNumber) values (117673,577)
insert into Writes (ID,ReportNumber) values (134262,554)
insert into Writes (ID,ReportNumber) values (106469,577)
insert into Writes (ID,ReportNumber) values (225320,554)
insert into Writes (ID,ReportNumber) values (324201,577)
insert into Writes (ID,ReportNumber) values (849171,552)
insert into Writes (ID,ReportNumber) values (849171,565)
go

insert into Investigates (ProjectNumber, ID) values (10001,117673)
insert into Investigates (ProjectNumber, ID) values (10003,117673)
insert into Investigates (ProjectNumber, ID) values (10002,134262)

go



---The functions
	--Qustion1

use HOSSEIN_DB


create function Q1
(@Rid int)
returns @QoneR table (RepNum int, tit text,topcode int)
as
begin
insert into @QoneR
select Report.ReportNumber , Report.Title, Concerns.TopicCode  
from  Report inner join Concerns on Report.ReportNumber=Concerns.ReportNumber inner join Writes on Report.ReportNumber = Writes.ReportNumber
inner join Researcher on Writes.ID= Researcher.ID where Researcher.ID=@Rid

return
end

go


---Test Out put

-- select DISTINCT * from dbo.Q1(Id of Researcher)

select DISTINCT * from dbo.Q1(117673)


	--Qustion2 Part 1

create function Q2
(@Rid int)
returns @Qtow table (id int, Name nvarchar(50),amount money)
as
begin
insert into @Qtow
select Investigates.ID, Researcher.Name , Grante.Amount from Investigates inner join Researcher on Investigates.ID=Researcher.ID
inner join Supports on Investigates.ProjectNumber = Supports.ProjectNumber inner join Grante on Grante.GrantNumber=Supports.GrantNumber
return
end

---Test Out put

-- select DISTINCT * from dbo.Q2(Id of Researcher)

select DISTINCT * from dbo.Q2(117673)


create function Q2p2
(@Rid int)
returns @Qtow2 table (id int, Name nvarchar(50),amount money, pr nvarchar(50))
as
begin
insert into @Qtow2
select Works.ID , Researcher.Name , Grante.Amount ,'Not applicable'from Works inner join Researcher on Works.ID=Researcher.ID
inner join Supports on Works.ProjectNumber = Supports.ProjectNumber inner join Grante on Grante.GrantNumber=Supports.GrantNumber
--having sum (Grante.Amount)
return
end
go
select DISTINCT * from dbo.Q2p2(117673)



-- Question3 insert values

CREATE PROCEDURE inproject
@name nvarchar(50),
@projectnum int
as
begin
insert into Project values (@projectnum,@name)
END
go 

CREATE PROCEDURE intop
@tit nvarchar (50),
@topcode int
as
begin
insert into Topic values (@topcode,@tit)
END
go 

CREATE PROCEDURE inFund
@name nvarchar (50),
@phone nvarchar (50),
@address text
as
begin
insert into FundingAgent values (@name,@address,@phone)
END
go


CREATE PROCEDURE ingrunt
@period nvarchar (50),
@amount money,
@gnum int
as
begin
insert into Grante values (@gnum,@amount,@period)
END
go  


CREATE PROCEDURE inwork
@procode int,
@id int
as
begin
insert into Works values (@id,@procode)
END
go


CREATE PROCEDURE inInv
@procode int,
@id int
as
begin
insert into Investigates values (@procode,@id)
END
go  