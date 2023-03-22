							CHAPTER 1
(1)
CREATE TABLE EMPLOYEE		
(
	EID INT,
	ENAME VARCHAR(50),
	GRADE VARCHAR(1),
	AGE INT,
	GENDER VARCHAR(1),
	STATE VARCHAR(2),
	SALARY NUMERIC(7,2)
)

INSERT INTO EMPLOYEE VALUES
(101,'Goutam Sinha','A',40,'M','BH',50000),
(102,'Srijan Basu','B',30,'M','WB',40000),
(103,'Nandini Apte','A',45,'F','MH',57000),
(104,'Satyen Mumu','B',33,'M','JH',32000),
(105,'Priya Kumari','C',31,'F','JH',25000),
(106,'Vignesh D','D',25,'M','TN',15000),
(107,'Grishma Dasari','C',27,'F','AP',17000)

(2)SELECT * FROM EMPLOYEE
(3)SELECT ENAME, GRADE FROM EMPLOYEE
(4) SELECT ENAME,AGE,GENDER FROM EMPLOYEE
(5)SELECT ENAME,STATE,AGE,STATE FROM EMPLOYEE
(6)SELECT ENAME, STATE AS LOCATION1,AGE, STATE AS LOCATION2 FROM EMPLOYEE
(7)SELECT EID AS [EMPLOYEE ID], ENAME AS [EMPLOYEE NAME] FROM EMPLOYEE
(8)SELECT ENAME FROM EMPLOYEE WHERE STATE='WB'
(9)SELECT ENAME FROM EMPLOYEE WHERE AGE<=30
(10)SELECT ENAME, STATE FROM EMPLOYEE WHERE GENDER='F'
(11)SELECT ENAME,EID FROM EMPLOYEE WHERE GENDER = 'F' AND AGE>=30
(12)SELECT ENAME FROM EMPLOYEE WHERE AGE>=30 AND AGE<=40
//ANOTHER WAY// SELECT ENAME FROM EMPLOYEE WHERE AGE BETWEEN 30 AND 40
(13) SELECT ENAME FROM EMPLOYEE WHERE AGE>=30 AND AGE<=40 AND STATE ='JH'
(14) SELECT ENAME FROM EMPLOYEE WHERE STATE='WB' OR STATE='JH' OR STATE ='MH'
(15) SELECT ENAME FROM EMPLOYEE WHERE STATE!='WB' OR STATE!='JH' OR STATE!='MH'
(16) SELECT STATE FROM EMPLOYEE
(17) SELECT DISTINCT STATE FROM EMPLOYEE
(18) SELECT ENAME,AGE FROM EMPLOYEE ORDER BY AGE ASC
(19) SELECT ENAME,AGE FROM EMPLOYEE ORDER BY AGE DESC
(20) SELECT ENAME, GRADE,AGE FROM EMPLOYEE ORDER BY GRADE ASC
(21) SELECT ENAME, GRADE, AGE FROM EMPLOYEE ORDER BY GRADE ASC , AGE ASC
(22) SELECT ENAME, GRADE, AGE FROM EMPLOYEE ORDER BY GRADE ASC , AGE DESC
(23) SELECT TOP 3 ENAME,AGE FROM EMPLOYEE ORDER BY AGE ASC
(24) SELECT TOP 1 ENAME,AGE FROM EMPLOYEE ORDER BY AGE DESC
(25) SELECT TOP 1 ENAME FROM EMPLOYEE ORDER BY GRADE ASC
(26) SELECT TOP 1 SALARY FROM EMPLOYEE ORDER BY SALARY DESC
(27) SELECT TOP 1 SALARY FROM EMPLOYEE ORDER BY SALARY ASC
(28) SELECT MAX(SALARY) FROM EMPLOYEE WHERE GENDER='M'
(29) SELECT MIN(SALARY) FROM EMPLOYEE WHERE GENDER='F'
(30) SELECT AVG(SALARY) FROM EMPLOYEE WHERE GENDER='M'
(31) SELECT COUNT(AGE) FROM EMPLOYEE WHERE GENDER='F'AND AGE<30
(32) SELECT SUM(SALARY) FROM EMPLOYEE WHERE STATE='WB'
(33) SELECT COUNT(ENAME), AVG(SALARY)FROM EMPLOYEE WHERE STATE='WB'
(34) SELECT MAX(SALARY) AS [MAX SALARY], MIN(SALARY) AS [MIN SALARY] FROM EMPLOYEE
(35) SELECT MAX(SALARY), MIN (SALARY), AVG(SALARY) FROM EMPLOYEE WHERE (STATE='WB' AND AGE>25) OR (STATE='MH' AND AGE>25)
(36) SELECT ENAME FROM EMPLOYEE WHERE ENAME LIKE 'a%'
(37) SELECT ENAME FROM EMPLOYEE WHERE ENAME LIKE '%a'
(38) SELECT ENAME FROM EMPLOYEE WHERE ENAME LIKE '%a' or ENAME LIKE '%e' or ENAME LIKE '%i' or ENAME LIKE '%o' or ENAME LIKE '%u'
(39) SELECT ENAME FROM EMPLOYEE WHERE ENAME LIKE 'a%'
(40) SELECT ENAME FROM EMPLOYEE WHERE ENAME not LIKE '%a%' 
(41) SELECT ENAME FROM EMPLOYEE WHERE ENAME LIKE '%sh%'
(42) SELECT ENAME FROM EMPLOYEE WHERE ENAME LIKE '_a%'
(43) select * from employee where ename like '% ____'
(44) SELECT ENAME FROM EMPLOYEE WHERE ENAME LIKE '%[T-Z]%'

								CHAPTER 2
(1)
CREATE TABLE CHARITY
(EID INT,
ENAME VARCHAR(50),
DONATION NUMERIC(6,2)
)

DROP TABLE CHARITY

SELECT * FROM CHARITY 
SELECT * FROM EMPLOYEE

INSERT INTO CHARITY VALUES
(101,'GOUTAM SINHA',500.00),
(103,'NANDINI APTE',3000.00),
(107,'GRISHMA DASARI',750.50),
(501,'DHEERAJ RAJ',1250.50)

(2)SELECT ENAME FROM CHARITY

(3) SELECT ENAME FROM EMPLOYEE
INTERSECT
SELECT ENAME FROM CHARITY

(4) SELECT ENAME FROM EMPLOYEE
EXCEPT
SELECT ENAME FROM CHARITY

(5) SELECT ENAME FROM CHARITY
EXCEPT 
SELECT ENAME FROM EMPLOYEE

(6) SELECT ENAME FROM EMPLOYEE
UNION 
SELECT ENAME FROM CHARITY

(7) SELECT DISTINCT ENAME FROM EMPLOYEE
UNION 
SELECT ENAME FROM CHARITY

(8) SELECT ENAME, EID FROM EMPLOYEE
INTERSECT 
SELECT ENAME,EID FROM CHARITY

(9) SELECT ENAME, EID FROM EMPLOYEE
UNION ALL
SELECT ENAME,EID FROM CHARITY

(10) SELECT DISTINCT ENAME,EID FROM EMPLOYEE
UNION
SELECT ENAME,EID FROM CHARITY

(11) SELECT ENAME FROM EMPLOYEE
UNION 
SELECT ENAME FROM CHARITY
EXCEPT
SELECT ENAME FROM EMPLOYEE
INTERSECT
SELECT ENAME FROM CHARITY

(12) select ename,grade,gender from employee where eid in (select eid from charity)
(13) ??
(14) select distinct grade from employee where grade not in
	(select distinct grade from employee where eid in (select eid from charity))

	 select distinct grade from employee  
	 except
	 select distinct grade from employee where eid in (select eid from charity)
(15) ??

(16) SELECT * FROM EMPLOYEE WHERE ENAME=
(SELECT TOP 1 ENAME FROM CHARITY ORDER BY DONATION DESC)

(17)
SELECT * FROM EMPLOYEE WHERE ENAME=
(
	SELECT TOP 1 ENAME FROM
	(
		SELECT TOP 3 * FROM CHARITY ORDER BY DONATION DESC
	)T1 ORDER BY DONATION ASC
)

(18) SELECT TOP 1 ENAME FROM EMPLOYEE ORDER BY SALARY DESC
(19) SELECT TOP 1 ENAME FROM
(
	SELECT TOP 2 * FROM EMPLOYEE ORDER BY SALARY DESC
)T3
ORDER BY SALARY ASC
(20)SELECT TOP 3 ENAME FROM EMPLOYEE ORDER BY SALARY ASC
(21)SELECT TOP 1 ENAME,AGE FROM 
(
	SELECT TOP 3 * FROM EMPLOYEE ORDER BY SALARY ASC
)T1 ORDER BY SALARY DESC

(22) SELECT STATE FROM EMPLOYEE WHERE GENDER='M'
EXCEPT
SELECT STATE FROM EMPLOYEE WHERE GENDER = 'F'
(23)SELECT ENAME FROM EMPLOYEE WHERE STATE =
(
SELECT STATE FROM EMPLOYEE WHERE GENDER='M'
INTERSECT
SELECT STATE FROM EMPLOYEE WHERE GENDER='F'

) AND GENDER='M'

(24) SELECT ENAME FROM EMPLOYEE WHERE SALARY <=30000
(25)SELECT * FROM EMPLOYEE WHERE GRADE =( 
SELECT DISTINCT GRADE FROM EMPLOYEE WHERE AGE>=35)
(26) select * from employee where age<32
	 and grade in (SELECT distinct grade FROM EMPLOYEE WHERE AGE>=32)
(27) SELECT ENAME FROM EMPLOYEE WHERE GRADE =(SELECT GRADE FROM EMPLOYEE WHERE ENAME LIKE '%ANDIN%')
(28) SELECT * FROM (SELECT DISTINCT GRADE FROM EMPLOYEE WHERE ENAME NOT LIKE '%T%')TB


								CHAPTER-3

								SP_HELP 'employee'

SELECT * FROM EMPLOYEE
(1) ALTER TABLE EMPLOYEE ADD EMAILID VARCHAR(100)
(2) ALTER TABLE EMPLOYEE ADD PHONE_NUMBER INT
(3) ALTER TABLE EMPLOYEE ADD MANAGER_ID INT
(4) Alter table EMPLOYEE ALTER COLUMN EID IDENTITY(1,1)
ALTER TABLE EMPLOYEE
ALTER COLUMN EID INT IDENTITY(101,1)
(5) ALTER TABLE EMPLOYEE
ALTER COLUMN PHONE_NUMBER BIGINT // DIFFERENCE BETWEEN INT AND BIGINT 
(6) ??? 
ALTER TABLE EMPLOYEE
ADD GENDER BIT 

(7)ALTER TABLE EMPLOYEE
ALTER COLUMN EMAILID VARCHAR(50)

(8) UPDATE EMPLOYEE SET PHONE_NUMBER=980400001 WHERE EID =101
UPDATE EMPLOYEE SET PHONE_NUMBER=983600001 WHERE EID =102
UPDATE EMPLOYEE SET PHONE_NUMBER=991200002 WHERE EID =104
UPDATE EMPLOYEE SET PHONE_NUMBER=898100003 WHERE EID =105
UPDATE EMPLOYEE SET PHONE_NUMBER=943300002 WHERE EID =106
UPDATE EMPLOYEE SET PHONE_NUMBER=987400005 WHERE EID =107

(9)
UPDATE EMPLOYEE SET MANAGER_ID=101 WHERE EID =102
UPDATE EMPLOYEE SET MANAGER_ID=101 WHERE EID =103
UPDATE EMPLOYEE SET MANAGER_ID=103 WHERE EID =104
UPDATE EMPLOYEE SET MANAGER_ID=102 WHERE EID =105
UPDATE EMPLOYEE SET MANAGER_ID=105 WHERE EID =106
UPDATE EMPLOYEE SET MANAGER_ID=104 WHERE EID =107

(10) ALTER TABLE EMPLOYEE
DROP COLUMN EMAILID

(11)INSERT INTO EMPLOYEE VALUES(108,'RAHUL ROY','D',22,'M','BH',NULL,NULL,NULL,NULL)
(12)INSERT INTO EMPLOYEE VALUES(109,'NIBEDITA SEN','C',29,NULL,NULL,NULL,NULL,NULL,NULL)
(13) ???
(14) ALTER TABLE EMPLOYEE 
ALTER COLUMN GRADE VARCHAR(1) NOT NULL
(15)DELETE FROM EMPLOYEE WHERE ENAME='NIBEDITA SEN'
(16)INSERT INTO EMPLOYEE VALUES(109,'NIBEDITA SEN','C',29,NULL,NULL,NULL,NULL,NULL)
(17)DELETE FROM EMPLOYEE



(18)INSERT INTO EMPLOYEE VALUES
(101,'Goutam Sinha','A',40,'M','BH',50000),
(102,'Srijan Basu','B',30,'M','WB',40000),
(103,'Nandini Apte','A',45,'F','MH',57000),
(104,'Satyen Mumu','B',33,'M','JH',32000),
(105,'Priya Kumari','C',31,'F','JH',25000),
(106,'Vignesh D','D',25,'M','TN',15000),
(107,'Grishma Dasari','C',27,'F','AP',17000)


SELECT * INTO EMPLOYEE_BKP FROM EMPLOYEE
SELECT * FROM EMPLOYEE

SELECT * FROM EMPLOYEE_BKP


								CHAPTER 4(GROUP BY)
	
(1)CREATE TABLE STUDENT
(
ROLL INT IDENTITY(100,1),
SNAME VARCHAR(50),
[PHY MARKS] NUMERIC(5,2),
[CHEM MARKS] NUMERIC(5,2),
[MATH MARKS] NUMERIC(5,2),
GENDER VARCHAR(1),
[STATE] VARCHAR(2))

SELECT * FROM STUDENT


INSERT INTO STUDENT VALUES
('RAHIM DAS',45.82,98.23,53.87,'M','WB'),
('MOHINI MAITY',63.87,23.42,98.23,'F','JH'),
('SWETA KUMARI',34.52,67.34,78.45,'F','BH'),
('SUBHAM KUMAR',54.75,55.65,78.45,'M','UP'),
('RAMESH SHARMA',40,35.65,65.89,'M','BH'),
('SUMAN MONDAL',34.53,65.45,45.65,'M','WB'),
('SWARNA SAKSHI',34.54,76.56,54.67,'F','BH'),
('SUJOY DEY',35.43,56.65,87.54,'M','WB'),
('PRITY SINGH',36.52,86.52,57.38,'F','UP'),
('KIRAN RAY',54.17,72.47,28.51,'M','BH')



SELECT MAX(MARKS)