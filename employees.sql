-- 1.What is the total number of employees?
SELECT COUNT(*) AS total_employees
FROM employees;
-- 2.What is the overall employee attrition rate?
SELECT 
ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0)/ COUNT(*),2) AS attrition_rate FROM employees;
-- 3.Which department has the highest attrition?
SELECT Department,COUNT(*) AS employees_left FROM employees
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY employees_left DESC;
-- 4.Which job role has the highest employee turnover?
SELECT JobRole, COUNT(*) AS attrition_count FROM employees
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY attrition_count DESC;
-- 5.What is the average salary by department?
SELECT Department,ROUND(AVG(MonthlyIncome),2) AS avg_salary FROM employees
GROUP BY Department
ORDER BY avg_salary DESC;
-- 6.Does overtime affect employee attrition?
SELECT OverTime, Attrition, COUNT(*) AS count FROM employees
 GROUP BY OverTime, Attrition 
 ORDER BY OverTime, Attrition;
-- 7.Which age group has the highest attrition?
SELECT Age_Group, COUNT(*) AS attrition_count FROM employees
WHERE Attrition = 'Yes'
GROUP BY Age_Group
ORDER BY attrition_count DESC; 
-- 8.What is the average job satisfaction by department?
SELECT Department, ROUND(AVG(JobSatisfaction),2) AS avg_satisfaction FROM employees
GROUP BY Department
ORDER BY avg_satisfaction ASC;
-- 9.Which employees work overtime?
SELECT EmployeeID, Department, JobRole,OverTime FROM employees
WHERE OverTime = 'Yes';
-- 10.Which employees have low job satisfaction?
SELECT EmployeeID,Department,JobRole,JobSatisfaction FROM employees
WHERE JobSatisfaction <= 2
ORDER BY JobSatisfaction;
-- 11.What is the employee distribution by gender?
SELECT Gender, COUNT(*) AS total_employees
FROM employees
GROUP BY Gender;
-- 12. Which salary slab has the highest attrition?
SELECT Salary_Slab,COUNT(*) AS attrition_count FROM employees
WHERE Attrition = 'Yes'
GROUP BY Salary_Slab
ORDER BY attrition_count DESC;
-- 13.What is the average experience by department?
SELECT Department,ROUND(AVG(YearsAtCompany),2) AS avg_experience FROM employees
GROUP BY Department
ORDER BY avg_experience DESC;
-- 14.Which employees are high attrition risk?
SELECT EmployeeID,Department,MonthlyIncome, OverTime, JobSatisfaction, YearsAtCompany FROM employees
WHERE OverTime = 'Yes'
    AND MonthlyIncome < 5000
    AND JobSatisfaction <= 2
    AND YearsAtCompany < 3;
-- 15.Which departments have the highest average salary?
SELECT Department, ROUND(AVG(MonthlyIncome),2) AS avg_salary FROM employees 
GROUP BY Department 
ORDER BY avg_salary DESC;
-- 16.Find top 5 Highest Paid Employees?
SELECT EmployeeID,Department,JobRole,MonthlyIncome FROM employees
ORDER BY MonthlyIncome DESC
LIMIT 5;
-- 17.Find attrition by Experience Level?
SELECT Experience_Level,COUNT(*) AS attrition_count FROM employees
WHERE Attrition = 'Yes'
GROUP BY Experience_Level
ORDER BY attrition_count DESC;
