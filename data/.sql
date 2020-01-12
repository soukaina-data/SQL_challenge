-- Employee info 
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.gender,
    s.salary
FROM employees AS e 
LEFT JOIN salary AS s 
ON (e.emp_no = s.emp_no) 
ORDER BY e.emp_no

-- Employees hired in 1986
SELECT * 
FROM employees 
WHERE hire_date 
BETWEEN '1986-01-01'    
AND '1986-12-31'

--  The manager of each department
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM departments AS d
INNER JOIN dept_manager AS m ON
m.dept_no = d.dept_no
JOIN employees AS e ON
e.emp_no = m.emp_no;

-- The department of each employee : employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dt.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN departments AS dt ON
dt.dept_no = d.dept_no;

--The employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN departments AS dt ON
dt.dept_no = d.dept_no
WHERE dt.dept_name = 'Sales';

--The employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SSELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN departments AS dp ON
dt.dept_no = d.dept_no
WHERE dp.dept_name = 'Sales' 
OR dp.dept_name = 'Development';

--  list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT (last_name) AS FREQUENCY
FROM employees
GROUP BY last_name
ORDER BY FREQUENCY DESC;
