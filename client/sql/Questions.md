
---

# SQL Questions Based on the Employees Database

This is a categorized list of SQL questions based on the **employees** database from the [test_db repository](https://github.com/datacharmer/test_db). Work through these questions from beginner to pro level to master key SQL concepts. If you get stuck, check the hints provided at the end of each section.

---

## Beginner Level

1. **List all the employees.**
2. **Show the first name, last name, and hire date of employees.**
3. **Retrieve all employees who were hired before the year 2000.**
4. **Retrieve the distinct job titles from the database.**
5. **Find all employees who have the first name 'John'.**
6. **Find all employees hired after January 1, 1995.**
7. **List employees whose last name starts with the letter 'S'.**
8. **Show the top 10 oldest employees (by birth date).**
9. **List employees sorted by hire date, most recent first.**
10. **Show the first 5 employees from the employees table.**
11. **List 10 employees starting from the 6th row.**
12. **Count the total number of employees in the company.**
13. **Find the average salary of employees.**
14. **Find the maximum and minimum hire dates.**
15. **Group employees by their gender and count the number in each group.**
16. **Show the average salary by job title.**
17. **Retrieve the full name and salary of all employees.**
18. **Show the job title and department for each employee.**

### Hints:
- Use `SELECT`, `DISTINCT`, `ORDER BY`, `LIMIT`, `OFFSET`, `COUNT()`, `AVG()`, `MAX()`, `MIN()`, `JOIN`, `GROUP BY`.

---

## Intermediate Level

1. **List all employees who work in the 'Sales' department.**
2. **Show the employee name, department name, and current salary for all employees in the 'Development' department.**
3. **Find the total number of employees in each department.**
4. **Show the highest salary in each department.**
5. **Find employees whose salary is higher than the average salary in the company.**
6. **List employees who are earning the highest salary in their respective departments.**
7. **Retrieve the employees who have never been promoted (no record in the `titles` table).**
8. **Show the number of employees in each department, but only for departments with more than 100 employees.**
9. **Find departments where the average salary is greater than $60,000.**
10. **List employees along with their managers.**

### Hints:
- Use `JOIN`, `GROUP BY`, `HAVING`, `MAX()`, `COUNT()`, `AVG()`, `SUBQUERY`, `SELF-JOIN`.

---

## Advanced Level

1. **Retrieve the list of all employees and their department name, even for those who currently have no department.**
2. **List employees who have changed departments more than once.**
3. **For each employee, show their current salary and the difference between their salary and the average salary of all employees.**
4. **Rank employees based on their salary within their department.**
5. **Generate a report that shows a hierarchy of employees and their managers.**
6. **Find employees who work in both 'Sales' and 'Development' departments.**
7. **List employees who work either in the 'Sales' or 'Development' department.**
8. **For each department, list the employees whose salary is above the department's average salary.**
9. **Find the employees who have the second-highest salary in their department.**
10. **Create a new table that stores only employees from the 'Sales' department, and populate it using an `INSERT INTO` with a `SELECT` query.**

### Hints:
- Use `LEFT JOIN`, `RANK()`, `ROW_NUMBER()`, `INTERSECT`, `UNION`, `CORRELATED SUBQUERY`, `INSERT INTO`.

---

## Pro Level

1. **Discuss the normalization of the `employees` database. Identify any potential redundancy or violations of normalization rules (1NF, 2NF, 3NF).**
2. **How would you redesign the schema to store multiple salaries for each employee more efficiently?**
3. **Analyze query performance for retrieving all employees and their salaries. How would you optimize the query using indexes?**
4. **Explain the difference between `EXISTS` and `IN`. Provide examples where each one is more efficient.**
5. **Write a query to give a 5% raise to all employees in the 'Development' department, ensuring that this update is performed in a single transaction.**
6. **Simulate a bank transfer operation where one employee transfers part of their salary to another employee, ensuring atomicity using transactions.**
7. **How would you ensure that only certain users can view employees' salary information? Write SQL queries to create roles and assign permissions.**
8. **Write a SQL query to create a database user with read-only access to the `employees` table.**
9. **Create a stored procedure that automatically updates the `salaries` table when a new salary is inserted.**
10. **Write a trigger that logs every time an employee's salary is updated.**
11. **Analyze and optimize a slow-running query that retrieves all employees who have been with the company for more than 10 years.**

### Hints:
- Use `NORMALIZATION`, `INDEXING`, `EXISTS`, `IN`, `TRANSACTIONS`, `ROLES`, `STORED PROCEDURE`, `TRIGGER`.

---

### Concepts Covered:
- **Basic SQL querying**: `SELECT`, `WHERE`, `JOIN`, etc.
- **Aggregate functions**: `COUNT`, `SUM`, `AVG`, etc.
- **Advanced querying**: Subqueries, correlated subqueries, window functions.
- **Performance optimization**: Indexing, query plans.
- **Database schema design**: Normalization, constraints.
- **Transaction management**: ACID principles, transactions, commits, rollbacks.
- **Database administration**: Security, roles, permissions.

---

This progression of questions ensures a strong foundation in SQL, leading to advanced concepts and best practices, helping you apply SQL in any real-world scenario. Work through them step-by-step, and feel free to check the hints if you get stuck!

