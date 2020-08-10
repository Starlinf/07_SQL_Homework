DROP TABLE IF EXISTS employees;

SELECT * FROM employees;

-- Employees and their salaries
SELECT
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.sex,
	sal.salary
FROM employees emp
	INNER JOIN salaries sal ON emp.emp_no = sal.emp_no
ORDER BY emp.emp_no
;

-- Employees hired in 1986
SELECT
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.hire_date
FROM employees emp
WHERE date_part('year', emp.hire_date) = 1986
ORDER BY emp.emp_no
;

-- Employees and their departments
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	d.dept_no,
	d.dept_name
FROM employees e
	INNER JOIN dept_emp de ON e.emp_no = de.emp_no
	INNER JOIN departments d ON de.dept_no = d.dept_no
ORDER BY e.emp_no
;

-- Employees in the Sales and Development deparment
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e
	INNER JOIN dept_emp de ON e.emp_no = de.emp_no
	INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY e.emp_no
;


-- Employees with same last name counts
SELECT
	e.last_name,
	COUNT(e.last_name) AS "Count of Last Name"
FROM employees e
GROUP BY e.last_name
ORDER BY "Count of Last Name" DESC
;

-- Count check
-- SELECT
-- 	emp.emp_no,
-- 	emp.last_name,
-- 	emp.first_name
-- FROM employees emp
-- WHERE emp.last_name = 'Baba'
-- ORDER BY emp.emp_no
-- ;




