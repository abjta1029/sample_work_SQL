
-- CASE STATEMENT

CREATE TABLE employee ( 
EmployeeID INT PRIMARY KEY, 
EmployeeName VARCHAR(100) NOT NULL, 
Gender VARCHAR(1) NOT NULL, 
StateCode VARCHAR(20) NOT NULL, 
Salary int NOT NULL
);

insert into employee
values(201, 'Jerome', 'M', 'FL', 83000),
(202, 'Ray', 'M', 'AL', 88000),
(203, 'Stella', 'F', 'AL', 76000),
(204, 'Gilbert', 'M', 'Ar', 42000),
(205, 'Edward', 'M', 'FL', 93000),
(206, 'Ernest', 'F', 'Al', 64000),
(207, 'Jorge', 'F', 'IN', 75000),
(208, 'Nicholas', 'F', 'Ge', 71000),
(209, 'Lawrence', 'M', 'IN', 95000),
(210, 'Salvador', 'M', 'Co', 75000);

select*from employee;

-- CASE statement to replace abbreviations
SELECT employeeID,employeeName,
CASE 
	WHEN Gender='M' THEN 'Male'
	ELSE 'Female'
	END as Gender
from employee;


-- CASE statement with comparison operator
Select employeeID, employeeName,Salary,
 CASE
	WHEN Salary >=50000 AND Salary <80000 THEN 'Senior Consultant'
	Else 'Director'
END as Designation
from employee;


-- CASE statement with Order by clause
Select employeeName,Gender,Salary
from employee
ORDER BY 
CASE Gender
	WHEN 'F' THEN Salary End DESC,        -- Female salary in descending order
	CASE WHEN Gender='M' THEN Salary      -- Male salary in ascending order
END;

-- CASE Statement with Group by clause
-- Maximum and Minimum salary recived by 'seniour consultant' and 'director'
Select 
CASE
	WHEN Salary >=50000 AND Salary <80000 THEN 'Senior Consultant'
	Else 'Director'
END AS Designation,
Min(salary) as Minimum_Salary,
Max(Salary) as Maximum_Salary
from Employee
Group By
CASE
	WHEN Salary >=50000 AND Salary <80000 THEN 'Senior Consultant'
	Else 'Director'
END;

-- Number of employees on the position of 'seniour consultant' and 'director'
Select 
CASE
	WHEN Salary >=50000 AND Salary <80000 THEN 'Senior Consultant'
	Else 'Director'
END AS Designation,
Count(employeename) as num_of_employee
from Employee
Group By
CASE
	WHEN Salary >=50000 AND Salary <80000 THEN 'Senior Consultant'
	Else 'Director'
END;


