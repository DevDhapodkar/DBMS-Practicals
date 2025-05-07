--1. INNER JOIN
    --Objective: Retrieve and display the list of employees along with their department names.
    
   SELECT e.emp_name, d.dept_name 
    FROM Employees e 
    INNER JOIN Departments d ON e.dept_id = d.dept_id;


--2. LEFT JOIN
    --Objective: Display all employees and their assigned projects, including employees who are not assigned to any project.
   
    SELECT e.emp_name, p.proj_name 
    FROM Employees e 
    LEFT JOIN Assignments a ON e.emp_id = a.emp_id
    LEFT JOIN Projects p ON a.proj_id = p.proj_id;


--3. RIGHT JOIN
    --Objective: List all projects and the employees assigned to them, including projects with no employees.

    SELECT p.proj_name, e.emp_name 
    FROM Projects p 
    RIGHT JOIN Assignments a ON p.proj_id = a.proj_id
    RIGHT JOIN Employees e ON a.emp_id = e.emp_id;


--4. FULL OUTER JOIN
    --Objective: Get a list of all employees and departments, showing departments without employees and employees without departments.
    
    SELECT e.emp_name, d.dept_name 
    FROM Employees e 
    FULL OUTER JOIN Departments d ON e.dept_id = d.dept_id;


