
---

# SQL Answer Sheet for Employees Database

### Beginner Level

1. **List all the employees.**
   ```sql
   SELECT * FROM employees;
   ```

2. **Show the first name, last name, and hire date of employees.**
   ```sql
   SELECT first_name, last_name, hire_date FROM employees;
   ```

3. **Retrieve all employees who were hired before the year 2000.**
   ```sql
   SELECT * FROM employees WHERE hire_date < '2000-01-01';
   ```

4. **Retrieve the distinct job titles from the database.**
   ```sql
   SELECT DISTINCT title FROM titles;
   ```

5. **Find all employees who have the first name 'John'.**
   ```sql
   SELECT * FROM employees WHERE first_name = 'John';
   ```

6. **Find all employees hired after January 1, 1995.**
   ```sql
   SELECT * FROM employees WHERE hire_date > '1995-01-01';
   ```

7. **List employees whose last name starts with the letter 'S'.**
   ```sql
   SELECT * FROM employees WHERE last_name LIKE 'S%';
   ```

8. **Show the top 10 oldest employees (by birth date).**
   ```sql
   SELECT * FROM employees ORDER BY birth_date ASC LIMIT 10;
   ```

9. **List employees sorted by hire date, most recent first.**
   ```sql
   SELECT * FROM employees ORDER BY hire_date DESC;
   ```

10. **Show the first 5 employees from the employees table.**
    ```sql
    SELECT * FROM employees LIMIT 5;
    ```

11. **List 10 employees starting from the 6th row.**
    ```sql
    SELECT * FROM employees LIMIT 10 OFFSET 5;
    ```

12. **Count the total number of employees in the company.**
    ```sql
    SELECT COUNT(*) FROM employees;
    ```

13. **Find the average salary of employees.**
    ```sql
    SELECT AVG(salary) FROM salaries;
    ```

14. **Find the maximum and minimum hire dates.**
    ```sql
    SELECT MAX(hire_date) AS max_hire, MIN(hire_date) AS min_hire FROM employees;
    ```

15. **Group employees by their gender and count the number in each group.**
    ```sql
    SELECT gender, COUNT(*) FROM employees GROUP BY gender;
    ```

16. **Show the average salary by job title.**
    ```sql
    SELECT title, AVG(salary) 
    FROM employees 
    JOIN titles ON employees.emp_no = titles.emp_no 
    JOIN salaries ON employees.emp_no = salaries.emp_no 
    GROUP BY title;
    ```

17. **Retrieve the full name and salary of all employees.**
    ```sql
    SELECT first_name, last_name, salary 
    FROM employees 
    JOIN salaries ON employees.emp_no = salaries.emp_no;
    ```

18. **Show the job title and department for each employee.**
    ```sql
    SELECT employees.first_name, employees.last_name, titles.title, departments.dept_name 
    FROM employees 
    JOIN titles ON employees.emp_no = titles.emp_no 
    JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
    JOIN departments ON dept_emp.dept_no = departments.dept_no;
    ```

---

### Intermediate Level

1. **List all employees who work in the 'Sales' department.**
   ```sql
   SELECT employees.first_name, employees.last_name 
   FROM employees 
   JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
   JOIN departments ON dept_emp.dept_no = departments.dept_no 
   WHERE departments.dept_name = 'Sales';
   ```

2. **Show the employee name, department name, and current salary for all employees in the 'Development' department.**
   ```sql
   SELECT employees.first_name, employees.last_name, departments.dept_name, salaries.salary 
   FROM employees 
   JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
   JOIN departments ON dept_emp.dept_no = departments.dept_no 
   JOIN salaries ON employees.emp_no = salaries.emp_no 
   WHERE departments.dept_name = 'Development';
   ```

3. **Find the total number of employees in each department.**
   ```sql
   SELECT departments.dept_name, COUNT(*) AS total_employees 
   FROM employees 
   JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
   JOIN departments ON dept_emp.dept_no = departments.dept_no 
   GROUP BY departments.dept_name;
   ```

4. **Show the highest salary in each department.**
   ```sql
   SELECT departments.dept_name, MAX(salaries.salary) AS highest_salary 
   FROM employees 
   JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
   JOIN departments ON dept_emp.dept_no = departments.dept_no 
   JOIN salaries ON employees.emp_no = salaries.emp_no 
   GROUP BY departments.dept_name;
   ```

5. **Find employees whose salary is higher than the average salary in the company.**
   ```sql
   SELECT employees.first_name, employees.last_name, salaries.salary 
   FROM employees 
   JOIN salaries ON employees.emp_no = salaries.emp_no 
   WHERE salaries.salary > (SELECT AVG(salary) FROM salaries);
   ```

6. **List employees who are earning the highest salary in their respective departments.**
   ```sql
   SELECT employees.first_name, employees.last_name, departments.dept_name, salaries.salary 
   FROM employees 
   JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
   JOIN departments ON dept_emp.dept_no = departments.dept_no 
   JOIN salaries ON employees.emp_no = salaries.emp_no 
   WHERE salaries.salary = (SELECT MAX(salary) FROM salaries WHERE employees.emp_no = salaries.emp_no);
   ```

7. **Retrieve the employees who have never been promoted (no record in the `titles` table).**
   ```sql
   SELECT * FROM employees 
   WHERE emp_no NOT IN (SELECT emp_no FROM titles);
   ```

8. **Show the number of employees in each department, but only for departments with more than 100 employees.**
   ```sql
   SELECT departments.dept_name, COUNT(*) AS total_employees 
   FROM employees 
   JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
   JOIN departments ON dept_emp.dept_no = departments.dept_no 
   GROUP BY departments.dept_name 
   HAVING COUNT(*) > 100;
   ```

9. **Find departments where the average salary is greater than $60,000.**
   ```sql
   SELECT departments.dept_name, AVG(salaries.salary) AS avg_salary 
   FROM employees 
   JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
   JOIN departments ON dept_emp.dept_no = departments.dept_no 
   JOIN salaries ON employees.emp_no = salaries.emp_no 
   GROUP BY departments.dept_name 
   HAVING AVG(salaries.salary) > 60000;
   ```

10. **List employees along with their managers.**
    ```sql
    SELECT e.first_name AS employee_first_name, e.last_name AS employee_last_name, 
           m.first_name AS manager_first_name, m.last_name AS manager_last_name 
    FROM employees e 
    JOIN dept_manager dm ON e.emp_no = dm.emp_no 
    JOIN employees m ON dm.emp_no = m.emp_no;
    ```

---

### Advanced Level

1. **Retrieve the list of all employees and their department name, even for those who currently have no department.**
   ```sql
   SELECT employees.first_name, employees.last_name, departments.dept_name 
   FROM employees 
   LEFT JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
   LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no;
   ```

2. **List employees who have changed departments more than once.**
   ```sql
   SELECT emp_no, COUNT(dept_no) AS dept_changes 
   FROM dept_emp 
   GROUP BY emp_no 
   HAVING COUNT(dept_no) > 1;
   ```

3. **For each employee, show their current salary and the difference between their salary and the average salary of all employees.**
   ```sql
   SELECT employees.first_name, employees.last_name, salaries.salary, 
          (salaries.salary - (SELECT AVG(salary) FROM salaries)) AS salary_diff 
   FROM employees 
   JOIN salaries ON employees.emp_no = salaries.emp_no;
   ```

4. **Rank employees based on their salary within their department.**
   ```sql
   SELECT employees.first_name, employees.last_name, departments.dept_name, salaries.salary, 
          RANK() OVER (PARTITION BY departments.dept_name ORDER BY salaries.salary DESC) AS salary_rank 
   FROM employees 
   JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
   JOIN departments ON dept_emp.dept_no = departments.dept_no 
   JOIN salaries ON employees.emp_no = salaries.emp_no;
   ```

5. **Generate a report that shows a hierarchy of employees and their managers.**
   ```sql
   WITH RECURSIVE employee_hierarchy AS (
       SELECT emp_no, manager_emp_no, first_name, last_name 
       FROM employees 
       WHERE manager_emp_no IS NULL
       UNION ALL
       SELECT e.emp_no, e.manager_emp_no, e.first_name, e.last_name 


       FROM employees e 
       JOIN employee_hierarchy eh ON e.manager_emp_no = eh.emp_no
   )
   SELECT * FROM employee_hierarchy;
   ```

6. **Find employees who work in both 'Sales' and 'Development' departments.**
   ```sql
   SELECT employees.first_name, employees.last_name 
   FROM employees 
   JOIN dept_emp AS sales ON employees.emp_no = sales.emp_no 
   JOIN departments AS sales_dept ON sales.dept_no = sales_dept.dept_no 
   JOIN dept_emp AS dev ON employees.emp_no = dev.emp_no 
   JOIN departments AS dev_dept ON dev.dept_no = dev_dept.dept_no 
   WHERE sales_dept.dept_name = 'Sales' AND dev_dept.dept_name = 'Development';
   ```

7. **List employees who work either in the 'Sales' or 'Development' department.**
   ```sql
   SELECT employees.first_name, employees.last_name 
   FROM employees 
   JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
   JOIN departments ON dept_emp.dept_no = departments.dept_no 
   WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';
   ```

8. **For each department, list the employees whose salary is above the department's average salary.**
   ```sql
   SELECT employees.first_name, employees.last_name, departments.dept_name, salaries.salary 
   FROM employees 
   JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
   JOIN departments ON dept_emp.dept_no = departments.dept_no 
   JOIN salaries ON employees.emp_no = salaries.emp_no 
   WHERE salaries.salary > (SELECT AVG(salary) 
                            FROM employees 
                            JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
                            JOIN salaries ON employees.emp_no = salaries.emp_no 
                            WHERE dept_emp.dept_no = departments.dept_no);
   ```

9. **Find the employees who have the second-highest salary in their department.**
   ```sql
   SELECT employees.first_name, employees.last_name, departments.dept_name, salaries.salary 
   FROM employees 
   JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
   JOIN departments ON dept_emp.dept_no = departments.dept_no 
   JOIN salaries ON employees.emp_no = salaries.emp_no 
   WHERE salaries.salary = (SELECT MAX(salary) 
                            FROM salaries 
                            WHERE salary < (SELECT MAX(salary) 
                                            FROM salaries 
                                            WHERE dept_no = departments.dept_no));
   ```

10. **Create a new table that stores only employees from the 'Sales' department, and populate it using an `INSERT INTO` with a `SELECT` query.**
    ```sql
    CREATE TABLE sales_employees AS 
    SELECT * FROM employees 
    JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
    JOIN departments ON dept_emp.dept_no = departments.dept_no 
    WHERE departments.dept_name = 'Sales';
    ```

---

### Pro Level

1. **Discuss the normalization of the `employees` database.**
   The employees database is fairly normalized, complying with 1NF, 2NF, and 3NF:
   - 1NF: Each column has atomic values.
   - 2NF: All non-key attributes depend on the primary key.
   - 3NF: Non-key attributes are independent of each other.

2. **Redesign schema to store multiple salaries efficiently.**
   - You could merge the `employees` and `salaries` table to avoid separate lookups. Alternatively, consider indexing `salary` fields for faster access.

3. **Analyze query performance for retrieving employees and salaries.**
   ```sql
   EXPLAIN SELECT employees.first_name, employees.last_name, salaries.salary 
   FROM employees 
   JOIN salaries ON employees.emp_no = salaries.emp_no;
   ```

4. **Difference between `EXISTS` and `IN`.**
   `EXISTS` checks for the existence of rows and is usually faster for subqueries with large outer queries. `IN` is used when you need specific values.
   ```sql
   -- EXISTS
   SELECT * FROM employees WHERE EXISTS (SELECT 1 FROM dept_emp WHERE employees.emp_no = dept_emp.emp_no);
   
   -- IN
   SELECT * FROM employees WHERE emp_no IN (SELECT emp_no FROM dept_emp);
   ```

5. **5% raise for employees in the 'Development' department.**
   ```sql
   START TRANSACTION;
   UPDATE salaries 
   SET salary = salary * 1.05 
   WHERE emp_no IN (SELECT emp_no FROM dept_emp JOIN departments ON dept_emp.dept_no = departments.dept_no WHERE dept_name = 'Development');
   COMMIT;
   ```

6. **Simulate a bank transfer operation using transactions.**
   ```sql
   START TRANSACTION;
   UPDATE employees SET salary = salary - 1000 WHERE emp_no = 1001;
   UPDATE employees SET salary = salary + 1000 WHERE emp_no = 1002;
   COMMIT;
   ```

7. **Create roles and permissions for viewing salary information.**
   ```sql
   CREATE ROLE salary_viewer;
   GRANT SELECT ON salaries TO salary_viewer;
   ```

8. **Create a database user with read-only access to the `employees` table.**
   ```sql
   CREATE USER 'readonly_user'@'%' IDENTIFIED BY 'password';
   GRANT SELECT ON employees TO 'readonly_user'@'%';
   ```

9. **Create a stored procedure to automatically update the `salaries` table.**
   ```sql
   CREATE PROCEDURE update_salary(IN emp_no INT, IN new_salary DECIMAL(10,2)) 
   BEGIN
      UPDATE salaries SET salary = new_salary WHERE emp_no = emp_no;
   END;
   ```

10. **Write a trigger to log every time an employee's salary is updated.**
    ```sql
    CREATE TRIGGER salary_update_log 
    AFTER UPDATE ON salaries 
    FOR EACH ROW 
    BEGIN
       INSERT INTO salary_logs (emp_no, old_salary, new_salary, update_time) 
       VALUES (NEW.emp_no, OLD.salary, NEW.salary, NOW());
    END;
    ```

11. **Optimize a slow query for retrieving employees who have been with the company for over 10 years.**
    ```sql
    CREATE INDEX idx_hire_date ON employees(hire_date);
    
    SELECT * FROM employees WHERE hire_date < CURDATE() - INTERVAL 10 YEAR;
    ```

---

This answer sheet covers a range of SQL queries and concepts that will help you understand SQL more deeply and prepare you to work on any database system.