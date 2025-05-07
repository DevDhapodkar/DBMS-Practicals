--1. Display all employee names that start with "a" and are at least 3 characters in length.
SELECT first_name, last_name
FROM emp
WHERE first_name LIKE 'a%' AND LENGTH(first_name) >= 3;

--2. Display departments having Dallas, New York, and Chicago locations.
SELECT dept_name, location
FROM departments
WHERE location IN ('Dallas', 'New York', 'Chicago');

--3. Display the names of employees who are working as clerk, salesman, or analyst and drawing a salary more than 3000.
SELECT first_name, last_name, job, salary
FROM emp
WHERE (job = 'CLERK' OR job = 'SALESMAN' OR job = 'ANALYST') AND salary >= 3000;

--4. Display the names of employees who are not working as managers.
SELECT first_name, last_name
FROM emp
WHERE job != 'MANAGER';

--5. Display the name of the employee who earns the highest salary.
SELECT first_name, last_name
FROM emp
ORDER BY salary DESC
LIMIT 1;

--6. Display the employee number and name of the employee working as CLERK and earning the highest salary among CLERKS.
SELECT emp_no, first_name, last_name
FROM emp
WHERE job = 'CLERK'
ORDER BY salary DESC
LIMIT 1;

--7. Display the names of clerks who earn a salary more than that of James or less than that of Scott.
SELECT first_name, last_name
FROM emp
WHERE job = 'CLERK' AND (salary > (SELECT salary FROM emp WHERE first_name = 'James') 
    OR salary < (SELECT salary FROM emp WHERE first_name = 'Scott'));

--8. Display the names of the employees who earn the highest salary in their respective departments.
SELECT e1.first_name, e1.last_name, e1.salary, e1.deptno
FROM emp e1
WHERE e1.salary IN (
    SELECT MAX(e2.salary)
    FROM emp e2
    WHERE e2.deptno = e1.deptno
);

SELECT e1.first_name, e1.last_name, e1.salary,e1.deptno, d.dept_name
FROM emp e1
JOIN departments d ON e1.deptno = d.deptno
WHERE e1.salary  IN	 (
    SELECT MAX(e2.salary)
    FROM emp e2
    WHERE e2.deptno = e1.deptno
);

--9. Display those employees who are working in the same department where their manager is working.
SELECT e1.first_name, e1.last_name
FROM emp e1
JOIN emp e2 ON e1.manager_id = e2.emp_no
WHERE e1.deptno = e2.deptno;
