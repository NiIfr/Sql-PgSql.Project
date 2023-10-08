-- Question 1 

CREATE FUNCTION Q1(Rid integer)
   RETURNS TABLE (
	RepNum integer, 
	tit text,
	topcode integer
	) 
AS $$
BEGIN
RETURN QUERY select Report.ReportNumber , Report.Title, Concerns.TopicCode  
from  Report INNER JOIN Concerns ON Report.ReportNumber=Concerns.ReportNumber INNER JOIN Writes ON Report.ReportNumber = Writes.ReportNumber
INNER JOIN Researcher ON Writes.ID= Researcher.ID where Researcher.ID=Rid ;

END; $$ 
LANGUAGE 'plpgsql';





--Qustion2 Part 1

CREATE FUNCTION Q2(Rid integer)
  RETURNS TABLE (
		id integer, 
		Name VARCHAR(50),
		amount NUMERIC
		)
AS $$
BEGIN
RETURN QUERY select Investigates.ID, Researcher.Name , Grante.Amount from Investigates INNER JOIN Researcher ON Investigates.ID=Researcher.ID
INNER JOIN Supports ON Investigates.ProjectsNumber = Supports.ProjectsNumber INNER JOIN Grante ON Grante.GrantNumber=Supports.GrantNumber;

END; $$ 
LANGUAGE 'plpgsql';


CREATE FUNCTION Q2p2(Rid integer)
  RETURNS TABLE (id integer, Name varchar(50),amount numeric, pr varchar(50))
AS $$
BEGIN

RETURN QUERY select Works.ID , Researcher.Name , Grante.Amount ,'Not applicable'from Works INNER JOIN Researcher ON Works.ID=Researcher.ID
INNER JOIN Supports on Works.ProjectsNumber = Supports.ProjectsNumber INNER JOIN Grante ON Grante.GrantNumber=Supports.GrantNumber;
having sum (Grante.Amount)
END; $$ 
LANGUAGE 'plpgsql';



-- Qustion 3

    CREATE FUNCTION insert_last_Q1(PNumber integer, PName text) 
    RETURNS void AS $$
    BEGIN
      INSERT INTO Projects VALUES (PNumber, PName);
    END;
    $$ LANGUAGE plpgsql;


    CREATE FUNCTION insert_last_Q2(GNumber integer, Amnt NUMERIC,per VARCHAR (50)) 
    RETURNS void AS $$
    BEGIN
      INSERT INTO Grante VALUES (GNumber, Amnt,per);
    END;
    $$ LANGUAGE plpgsql;
