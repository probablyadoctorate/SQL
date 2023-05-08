USE employees;
ALTER TABLE dep_dup DROP COLUMN dept_manager;
ALTER TABLE dep_dup CHANGE COLUMN dept_no dept_no CHAR(4) NULL;
ALTER TABLE dep_dup CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

-- group by clause error 1055 fix
SET @@GLOBAL..sql_mode := REPLACE(@@GLOBAL..sql_mode, 'ONLY_FULL_GROUP_BY', '');

DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup (
    emp_no INT NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);
INSERT INTO dept_manager_dup SELECT * FROM dept_manager;
INSERT INTO dept_manager_dup (emp_no, from_date) VALUES (999904, '2017-01-01'), (999905, '2017-01-01'), (999906, '2017-01-01'), (999907, '2017-01-01');

DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';
INSERT INTO dep_dup (dept_name) VALUES ('Public Relations');
DELETE FROM dep_dup 
WHERE
    dept_no = 'd002';
    
    
-- inner join 

SELECT 
    *
FROM
    dept_manager_dup;
SELECT 
    *
FROM
    dep_dup;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dep_dup d
        INNER JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees e
        INNER JOIN
    dept_manager dm ON dm.emp_no = e.emp_no;

-- duplicates creating them first and removing them

INSERT INTO dept_manager_dup VALUES ('110228', 'd003', '1992-03-01', '9999-01-01');
INSERT INTO dep_dup VALUES ('d009', 'Customer Service');

SELECT 
    *
FROM
    dept_manager_dup;
SELECT 
    *
FROM
    dep_dup;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dep_dup d
        INNER JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
GROUP BY m.emp_no ORDER BY d.dept_no;

DELETE FROM dept_manager_dup 
WHERE
    emp_no - '110228';
DELETE FROM dep_dup 
WHERE
    dept_no = 'd009';

INSERT INTO dept_manager_dup VALUES ('110228','d003','1992-03-21', '9999-01-01');
INSERT INTO dep_dup VALUES ('d009', 'Customer Service');
 
-- left join

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    dep_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;

SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    dep_dup d
        LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    dm.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC , e.emp_no;

-- right join

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        RIGHT JOIN
    dep_dup d ON m.dept_no = d.dept_no
    ORDER BY m.dept_no;

# old join syntax 

SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees e,
    dept_manager dm
WHERE
    e.emp_no = dm.emp_no;
    
-- join + where together

SELECT 
    e.emp_no, e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > 145000;

SELECT 
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    first_name = 'Margareta'
        AND last_name = 'Markovitch'
ORDER BY e.emp_no;

-- cross join

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;
SELECT 
    dm.*, d.*
FROM
    dept_manager dm,
    departments d
ORDER BY dm.emp_no , d.dept_no;
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    e.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
        JOIN
    employees e ON dm.emp_no = e.emp_no;

SELECT 
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_no;

SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no , d.dept_name;

-- aggregate functions with join

SELECT 
    e.gender, AVG(s.salary) AS average_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY gender;


-- join with more than 2 tables

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no;
    
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
ORDER BY e.emp_no;

SELECT
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
            AND m.from_date = t.from_date
ORDER BY e.emp_no;


SELECT 
    d.dept_name, AVG(salary) AS average_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name HAVING average_salary >10000 ORDER BY average_salary DESC;

SELECT 
    e.gender, COUNT(dm.emp_no)
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;

-- union vs union all

DROP TABLE IF EXISTS employees_dup;
CREATE TABLE employees_dup (
    `emp_no` INT,
    `birth_date` DATE,
    `first_name` VARCHAR(14),
    `last_name` VARCHAR(16),
    `gender` ENUM('M', 'F'),
    `hire_date` DATE
);
INSERT INTO employees_dup SELECT e.* FROM employees e LIMIT 20;
SELECT 
    *
FROM
    employees_dup;
insert into employees_dup values ('10001','1953-09-02','Georgi','Facello','M','1986-06-26');

SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT 
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) AS a
ORDER BY - a.emp_no DESC;