-- insert clause

use employees;
SELECT 
    *
FROM
    employees
LIMIT 10;

insert into employees (emp_no, birth_date, first_name, last_name, gender, hire_date) values 
(999901, '1986-04-21', 'John', 'Smith', 'M', '2011-01-01');
SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;
insert into employees values 
(999903, '1986-07-22', 'Johnathan', 'Creek', 'M', '2012-02-21');

SELECT 
    *
FROM
    titles
LIMIT 10;
insert into titles (emp_no, title, from_date) values (999903, 'Senior Engineer', '1997-10-01');
SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC;

SELECT 
    *
FROM
    dept_emp;
insert into dept_emp values (999903, 'd005', '1997-10-01', '9999-01-01');

-- using select to insert values in a table

SELECT 
    *
FROM
    departments;
CREATE TABLE dep_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
    
);
insert into dep_dup select * from departments;

SELECT 
    *
FROM
    dep_dup;
    
SELECT 
    *
FROM
    departments;
insert into departments values ('d010', 'Business Analysis');

-- update statement

use employees;
UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;
SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;

-- commit + rollback

COMMIT;

UPDATE dep_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality';
SELECT 
    *
FROM
    dep_dup;

ROLLBACK;

SELECT 
    *
FROM
    dep_dup;

COMMIT;

UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010';
    
-- delete clause

COMMIT;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;

DELETE FROM employees 
WHERE
    emp_no = 999903;
SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;

ROLLBACK;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;
    
COMMIT;

SELECT 
    *
FROM
    dep_dup;
DELETE FROM dep_dup;
SELECT 
    *
FROM
    dep_dup;
ROLLBACK;
SELECT 
    *
FROM
    dep_dup;
COMMIT;

delete from departments where dept_no = 'd010';
ROLLBACK;

/* drop structure, index and every data point is gone no recovery even after rollback
+ truncate removes data points and resets auto increment
+ delete removes a particular data point no reset of auto increment */

-- count()

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;
SELECT 
    COUNT(salary)
FROM
    salaries;
SELECT 
    COUNT(from_date)
FROM
    salaries;
SELECT 
    COUNT(DISTINCT from_date)
FROM
    salaries;

SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;
    
-- sum()

SELECT 
    SUM(salary)
FROM
    salaries;

SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
-- min() + max()

SELECT 
    MAX(salary)
FROM
    salaries;
SELECT 
    MIN(salary)
FROM
    salaries;

SELECT 
    MIN(emp_no)
FROM
    employees;
SELECT 
    MAX(emp_no)
FROM
    employees;
    
-- avg()

SELECT 
    AVG(salary)
FROM
    salaries;

SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
-- round()

SELECT 
    ROUND(AVG(salary))
FROM
    salaries;
SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries;
SELECT 
    ROUND(AVG(salary), 6)
FROM
    salaries;

SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
-- ifnull() + coalesce()

SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name
FROM
    dep_dup;

SELECT 
    dept_no,
    COALESCE(dept_name,
            'Department name not provided') AS dept_name
FROM
    dep_dup;
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    dep_dup;
SELECT 
    dept_no,
    dept_name,
    COALESCE('Department Manager') AS dept_manager
FROM
    dep_dup;
    
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    dep_dup
ORDER BY dept_no ASC;

SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name, 'department not given') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    dep_dup
ORDER BY dept_no ASC;