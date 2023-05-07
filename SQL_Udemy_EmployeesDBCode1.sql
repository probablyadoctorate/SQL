use employees;

-- select clause

SELECT 
    first_name, last_name
FROM
    employees;
SELECT 
    *
FROM
    employees;
SELECT 
    *
FROM
    departments;

-- where clause 

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Dennis';
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';

-- and clause

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';

-- or clause

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        OR first_name = 'Elvis';
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        AND first_name = 'Elvis';
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';

-- logical order of operators

SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis' AND gender = 'M'
        OR gender = 'F';
SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis'
        AND (gender = 'M' OR gender = 'F');
SELECT 
    *
FROM
    employees
WHERE
    (first_name = 'Kellie'
        OR first_name = 'Aruna')
        AND gender = 'F';

-- in + not in clause

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Cathie'
        OR first_name = 'Mark'
        OR first_name = 'Nathan';
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');

-- like + not like clause

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar%');
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('ar%');
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar');
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar%');
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar_');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Mar%');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');

-- wildcard characters are * % _

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%jack%');
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%jack%');

-- between + and clause

SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';
SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';

SELECT 
    *
FROM
    salaries;
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN '66000' AND '70000';
SELECT 
    *
FROM
    salaries
WHERE
    emp_no NOT BETWEEN '10004' AND '10012';
SELECT 
    *
FROM
    departments;
SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';

-- is not null + is null clause

SELECT 
    *
FROM
    employees
WHERE
    first_name IS NOT NULL;
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;

SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
/* other comparison clauses are
= equal to
!= not equal to
<> not equal to
> geater than
< less than
>= greater than or equal to
<= less than or equal to */

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Mark';
SELECT 
    *
FROM
    employees
WHERE
    first_name != 'Mark';
SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';
SELECT 
    *
FROM
    employees
WHERE
    hire_date < '1985-02-01';
SELECT 
    *
FROM
    employees
WHERE
    hire_date <= '1985-02-01';

SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01'
        AND gender = 'F';
SELECT 
    *
FROM
    salaries
WHERE
    salary > '150000';
    
-- select distinct clause

SELECT 
    gender
FROM
    employees;
SELECT DISTINCT
    gender
FROM
    employees;

SELECT DISTINCT
    hire_date
FROM
    employees;

/* aggregate clause types
count()
sum()
min()
max()
avg() */

SELECT 
    COUNT(emp_no)
FROM
    employees;
SELECT 
    COUNT(first_name)
FROM
    employees;
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;

SELECT 
    COUNT(DISTINCT salary)
FROM
    salaries
WHERE
    salary >= 100000;
SELECT 
    COUNT(*)
FROM
    dept_manager;
    
-- order by clause

SELECT 
    *
FROM
    employees
ORDER BY first_name;
SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;
SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;
SELECT 
    *
FROM
    employees
ORDER BY first_name , last_name ASC;

SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

-- group by

SELECT 
    first_name
FROM
    employees
GROUP BY first_name;
SELECT 
    COUNT(first_name)
FROM
    employees
GROUP BY first_name;
SELECT 
    COUNT(first_name), first_name
FROM
    employees
GROUP BY first_name
ORDER BY first_name ASC;
SELECT 
    COUNT(first_name), first_name
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

-- as clause

SELECT 
    COUNT(first_name) AS number_of_names, first_name
FROM
    employees
GROUP BY first_name
ORDER BY first_name;

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary ASC;

-- having clause

SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';
SELECT 
    *
FROM
    employees
HAVING hire_date >= '2000-01-01';
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;

SELECT 
    emp_no, AVG(salary) AS avg_salary
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY AVG(salary) ASC;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;

SELECT 
    emp_no, COUNT(from_date) AS contract_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY COUNT(from_date) DESC;

-- limit clause

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC;
SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
    *
FROM
    dept_emp
ORDER BY dept_no ASC
LIMIT 100;