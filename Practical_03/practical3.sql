--a) Find the average salary of instructors in the Computer Science department:
SELECT AVG(I.Salary) AS AverageSalary
FROM Instructor I
JOIN Department D ON I.DeptID = D.DeptID
WHERE D.Name = 'Computer Science';

--b) Find the average salary in each department:
SELECT D.Name AS Department, AVG(I.Salary) AS AverageSalary
FROM Department D
JOIN Instructor I ON D.DeptID = I.DeptID
GROUP BY D.Name;

--c) What is the total salary of all teachers earning more than 30K?
SELECT SUM(Salary) AS TotalSalary
FROM Instructor
WHERE Salary > 30000;

--d) List the number of students enrolled in each course:
SELECT C.CourseID, C.Title, COUNT(E.StudentID) AS EnrolledStudents
FROM Course C
LEFT JOIN Enrollment E ON C.CourseID = E.CourseID
GROUP BY C.CourseID, C.Title;

--e) Find the names of all departments whose building name includes the substring "Symbio":
SELECT Name
FROM Department
WHERE Location LIKE '%Symbio%';

--f) Find the names of the departments whose names contain the string "sci" as a substring, regardless of the case:
SELECT Name
FROM Department
WHERE LOWER(Name) LIKE '%sci%';

--g) Display the length of the name of all the students:
SELECT Name, LENGTH(Name) AS NameLength
FROM Student;

--h) Retrieve total number of instructors:
SELECT COUNT(*) AS TotalInstructors
FROM Instructor;

--i) Add hiredate column in the instructor table, insert 4 rows, and display names of instructors working for the past 5 years:

ALTER TABLE Instructor ADD COLUMN HireDate DATE;

INSERT INTO Instructor (Name, DeptID, Salary, isHOD, HireDate) VALUES
('John Doe', 1, 75000, false, '2019-01-15'),
('Jane Smith', 2, 80000, true, '2018-06-30'),
('Bob Johnson', 3, 70000, false, '2021-03-01'),
('Alice Brown', 1, 72000, false, '2023-11-01');

--Display names of instructors working for the past 5 years
SELECT Name
FROM Instructor
WHERE HireDate <= CURRENT_DATE - INTERVAL '5 years';

--j) Display the list of instructors who have joined before 30th June 90 or after 31st Dec 90:
SELECT Name
FROM Instructor
WHERE HireDate < '1990-06-30' OR HireDate > '1990-12-31';

--k) Display name of those instructors who are going to retire 01-Jan-24 if the maximum job period is 18 years:
SELECT Name
FROM Instructor
WHERE HireDate <= '2006-01-01';  -- 18 years before 2024-01-01

