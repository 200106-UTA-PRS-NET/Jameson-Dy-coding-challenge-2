CREATE TABLE Department (
	id int PRIMARY KEY IDENTITY(1,1),
	name varchar(40),
	location varchar(40)
)

CREATE TABLE Employee (
	emp_id int PRIMARY KEY IDENTITY(1,1),
	fname varchar(40),
	lname varchar(40),
	ssn	varchar(9) UNIQUE,
	deptID int REFERENCES Department(id)
)

CREATE TABLE EmpDetails (
	id int PRIMARY KEY IDENTITY(1,1),
	emp_id int REFERENCES Employee(emp_id) UNIQUE,
	salary money,
	address varchar(50),
	city varchar(30),
	state varchar(2),
	country varchar(20)
)




-- ADD 3 RECORDS INTO EACH TABLE
INSERT INTO Department (name, location)
VALUES ('Snipers', 'Above'), ('Assault', 'Inside'), ('Sleepers', 'Bed')

INSERT INTO Employee (fname, lname, ssn, deptID)
VALUES 
('John', 'Wick', '999999999', 2),
('Spongebob', 'Squarepants', '123121234', 1),
('James', 'James', '765962738', 3)

INSERT INTO EmpDetails (emp_id, salary, address, city, state, country)
VALUES
(1, 3500000, '31 Heated Dr.', 'Alpacino', 'AD', 'Cuba'),
(2, 250000, '124 Conch St.', 'Bikini Bottom', 'BW','Pacific Ocean'),
(3, 45, '4 Pine St.', 'Big Number','TX', 'United States')

SELECT * FROM Department
SELECT * FROM Employee
SELECT * FROM EmpDetails

-- ADD DEPARTMENT MARKETING
INSERT INTO Department (name, location)
VALUES ('Marketing', 'Main Building')

-- ADD EMPLOYEE TINA SMITH
INSERT INTO Employee (fname, lname, ssn, deptID)
VALUES ('Tina', 'Smith', '50000', 4)

INSERT INTO EmpDetails (emp_id, salary, address, city, state, country)
VALUES
(4, 60000, '11 Street', 'Somewhere', 'IN', 'There')
-- fixing ssn
UPDATE Employee
SET ssn='675489766'
WHERE fname='Tina' AND lname='Smith'

-- ADD ANOTHER EMPLOYEE TO MARKETING
INSERT INTO Employee (fname, lname, ssn, deptID)
VALUES ('John', 'Smith', '989898772', 4)

INSERT INTO EmpDetails (emp_id, salary, address, city, state, country)
VALUES
(5, 60000, '11 Street', 'Somewhere', 'IN', 'There')

-- LIST ALL EMPLOYEES IN MARKETING
SELECT * FROM Employee e
WHERE e.deptID = 4

-- TOTAL SALARY OF MARKETING
SELECT SUM(ed.salary) MarketingSalary FROM EmpDetails ed
LEFT JOIN Employee e ON ed.emp_id = e.emp_id
LEFT JOIN Department d ON e.deptID=d.id
WHERE d.name='Marketing'

-- TOTAL EMPLOYEES BY DEPARTMENT
SELECT d.name, COUNT(*) #employees FROM Employee e
JOIN Department d ON e.deptID = d.id
GROUP BY e.deptID, d.name

-- INCREASE TINA SMITH SALARY TO 90000\
UPDATE EmpDetails
SET salary=90000
WHERE emp_id=4

SELECT fname,lname, salary FROM EmpDetails ed
JOIN Employee e ON e.emp_id = ed.emp_id

SELECT * FROM Department
SELECT * FROM Employee
SELECT * FROM EmpDetails