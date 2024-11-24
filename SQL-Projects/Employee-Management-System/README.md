# SQL_Employee-Management-System  

## General Instructions:  
1.**Referential Integrity**: Ensure that all foreign key relationships are defined correctly between the tables.  
2.**Normalization:** Ensure that the tables are normalized (at least 3NF), i.e., no repeating groups, no partial dependencies, and no transitive dependencies.  
3.**Constraints:** Apply necessary constraints like NOT NULL, UNIQUE, CHECK, and DEFAULT values as specified.  
4.**Data Integrity:** Handle scenarios like managing employees without a manager (nullable ManagerID), and ensure attendance status has valid options ('Present', 'Absent', 'Leave').  

**Table/Schema Structure:**  
![image](https://github.com/user-attachments/assets/8324472c-265a-4ef6-91c5-537164dfcc59)  

**USER credential:**
![image](https://github.com/user-attachments/assets/5d53f31f-91ba-403b-be48-eabcdfb1036e)  

**Table1. Department Table**  
Question: Create a table named Department to store department information. The table should have the following columns:  
•DepartmentID (Primary Key)  
•DepartmentName (Name of the department, not null)  
_Note: Ensure that DepartmentID is set as the primary key and DepartmentName is not allowed to be NULL._

**Answer:** - Created Table and Inserted desired values into this Department Table (Ataching herewith the Screenshot)
![image](https://github.com/user-attachments/assets/4331295e-0990-4f0c-9347-85178f76c078)  

**Table2. Job Title Table**  
Question: Create a table named JobTitle to store job titles for employees. The table should include:  
•JobTitleID (Primary Key)  
•JobTitleName (Name of the job title, not null)  
_Note: Make sure to enforce that JobTitleName is unique and not NULL._  

**Answer:** - Created Table and Inserted desired values into this Job Title Table (Ataching herewith the Screenshot) 
![image](https://github.com/user-attachments/assets/e39d4e65-b8de-40bb-b52f-7cc13410ff12)  

**Table3. Employee Table (Without Foreign Key Constraints)**  
Question: Create a table named Employee to store employee information.  
The table should include the following columns:  
•EmployeeID (Primary Key)  
•FirstName (First name of the employee, not null)  
•LastName (Last name of the employee, not null)  
•DateOfBirth (Date of birth of the employee)  
•Gender (Gender of the employee)  
•PhoneNumber (Phone number of the employee, unique)  
•Email (Email address of the employee, unique)  
•HireDate (Hire date of the employee)  
•DepartmentID (ID of the department the employee belongs to)  
•JobTitleID (ID of the job title of the employee)  
•ManagerID (ID of the manager of the employee, self-referencing foreign key)  
_Note: The ManagerID column should be nullable, allowing employees to have no manager (e.g., top-level managers)._  

**Answer:** Created Table and Inserted desired values into this Employee Table (Ataching herewith the Screenshot)
![image](https://github.com/user-attachments/assets/32c35e95-7746-4f9f-8719-e553f50c4be5)  

****Table4. Attendance Table**  
**Question: Create a table named Attendance to track employee attendance. The table should include the following columns:  
•AttendanceID (Primary Key)  
•EmployeeID (ID of the employee, foreign key referencing Employee)  
•Date (Date of attendance)  
•Status (Attendance status: 'Present', 'Absent', or 'Leave’)  
_Note: Ensure that a foreign key constraint is placed on EmployeeID to reference the Employee table, and enforce that Status can only contain the values 'Present', 'Absent', or 'Leave'._  

**Answer:** Created Table and Inserted desired values into this Attendance Table (Ataching herewith the Screenshot)
![image](https://github.com/user-attachments/assets/7806c171-2d9d-47b7-ac29-d4e70a889fc2)


**Table5: Salary Table**  
Question: Create a table named Salary to store salary details of employees. The table should include the following columns:  
•SalaryID (Primary Key)  
•EmployeeID (ID of the employee, foreign key referencing Employee)  
•BaseSalary (Base salary of the employee, not null)  
•Bonus (Bonus of the employee, default value of 0.00)  
•Deduction (Deductions for the employee, default value of 0.00)  
•PaymentDate (Date of salary payment)  
_Note: Ensure that a foreign key constraint is placed on EmployeeID to reference the Employee table._  

**Answer:** Created Table and Inserted desired values into this Salary Table (Ataching herewith the Screenshot)
![image](https://github.com/user-attachments/assets/711987f2-eca6-43cc-a5b3-16bb0c55e557)  

**Table6. Project Table**  
Question: Create a table named Project to store information about projects. The table should include the following columns:  
•ProjectID (Primary Key)  
•ProjectName (Name of the project, not null)  
•StartDate (Start date of the project)  
•EndDate (End date of the project)  
•ProjectManagerID (ID of the manager responsible for the project, foreign key referencing Employee)  
_Make sure to enforce that ProjectManagerID references the Employee table and indicates who is the manager of the project._  

**Answer:** Created Table and Inserted desired values into this Project Table (Ataching herewith the Screenshot)
![image](https://github.com/user-attachments/assets/ea9c1afd-c6fb-4f05-8b67-0b203ecb184b)  

**Table7: Project Allocation Table**  
Question: Create a table named ProjectAllocation to manage the many-to-many relationship between employees and projects. The table should include the following columns:  
•AllocationID (Primary Key)  
•EmployeeID (ID of the employee, foreign key referencing Employee)  
•ProjectID (ID of the project, foreign key referencing Project)  
•AllocationDate (Date when the employee is allocated to the project)  
_Ensure that:  
•Foreign key constraints are placed on EmployeeID (referencing Employee) and ProjectID (referencing Project).  
•The combination of EmployeeID and ProjectID should be unique to prevent an employee from being allocated to the same project more than once._  

**Answers:** Created Table and Inserted desired values into this ProjectAllocation Table (Ataching herewith the Screenshot)
![image](https://github.com/user-attachments/assets/89e75dc0-762e-4d73-bf2a-b0d84fedddb8)  

***************************SOME ASSIGNMENT QUESTIONS ON DATA RETRIEVAL FROM THESE TABLES:*******************
**Q1: Retrieve the first and last names of all employees.**

**Solution:**
![image](https://github.com/user-attachments/assets/2d45353b-ce5b-47be-a528-03975a5d1cee)  

**Q2. Retrieve the first and last names of employees who work as 'Software Engineer'.**

**Solution:**
![image](https://github.com/user-attachments/assets/c4f3c30d-67c3-4f3c-abbd-2f56072fefff)  

**Q3. Retrieve first names and last names of last 7 hires**

**Solution:** 
![image](https://github.com/user-attachments/assets/06bfdde5-6956-4d69-b2f5-f0f626fe6082)  

**Q4. Get the count of employees in each job title.**  

**Solution:**
![image](https://github.com/user-attachments/assets/c64eda84-6876-49d6-a23d-fcf9d6ad6df3)

**Q5. Retrieve the full name & other personal info of employees who work in the 'Engineering' department.**

**Solution:**
![image](https://github.com/user-attachments/assets/0ecaecb8-a62e-4711-bec7-f099ab076677)

**Q6. List job titles that have more than 3 employees.**

**Solution:**
![image](https://github.com/user-attachments/assets/f8f5dca5-749a-4628-bd67-11f62c1ac86e)  

**Q7. Retrieve all employee names along with their department names.**

**Solution:**
![image](https://github.com/user-attachments/assets/345ab73e-4fab-4edc-aeac-e1da0a939190)  

**Q8. Retrieve the first names of employees and the projects they are working on, along with their role in the project.**

**Solution:**
![image](https://github.com/user-attachments/assets/f0672fd6-bfc3-4026-914e-646e93979e1e)  

**Q9. Get the count of employees in each department.**

**Solution:**
![image](https://github.com/user-attachments/assets/3c807bc1-7ddc-49ce-9c33-11c6489439c0)  

**Q10. List all departments with more than 5 employees.**  

**Solution:**
![image](https://github.com/user-attachments/assets/cea38836-73be-4163-9bba-57562742ac72)

**Q11. Retrieve the full names of employees and their managers.**

**Solution:**
![image](https://github.com/user-attachments/assets/f781a54a-ee54-455e-bd17-1f46fd1162aa)  

**Q12. Which manager is managing more employees and how many?**  

**Solution:**
![image](https://github.com/user-attachments/assets/5673d5ef-d32a-429e-8aec-fc003380e960)

**Q13. Retrieve names of employees working on projects as 'Software Engineer', ordered by project start date**

**Solution:**
![image](https://github.com/user-attachments/assets/8db424e8-9a3b-4165-84d0-8572f5aee738)

**Q14. Retrieve the names of employees who are working on 'Project Delta'.**

**Solution:**
![image](https://github.com/user-attachments/assets/021eee37-d4d1-4813-9f47-b32f06fdeff1)

**Q15. Retrieve the names of employees, department name, and total salary, ordered by total salary in descending order.**

**Solution:**
![image](https://github.com/user-attachments/assets/86eda3a8-4835-4627-a5bc-3d538f7a46b6)

**Q16. Create a function to find employees with a birthday in the given month and calculate their age.**

**Solution:**
![image](https://github.com/user-attachments/assets/be287821-68bb-417b-81eb-e21dadddb39a)
