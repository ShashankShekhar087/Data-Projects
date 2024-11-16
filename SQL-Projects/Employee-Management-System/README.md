# SQL_Employee-Management-System
Design and query a database for "ABC" a mid-sized company aiming to manage employee data efficiently. The system should store details about employees, their departments, projects, salaries, and attendance, with additional constraints to ensure data integrity.

**General Instructions :**
1.Referential Integrity: Ensure that all foreign key relationships are defined correctly between the tables.

2.Normalization: Ensure that the tables are normalized (at least 3NF), i.e., no repeating groups, no partial dependencies, and no transitive dependencies.

3.Constraints: Apply necessary constraints like NOT NULL, UNIQUE, CHECK, and DEFAULT values as specified.

4.Data Integrity: Handle scenarios like managing employees without a manager (nullable ManagerID), and ensure attendance status has valid options ('Present', 'Absent', 'Leave').

**Table/Schema Structure:**
![image](https://github.com/user-attachments/assets/7bb13b18-6f15-4d70-bf69-09aee710b24b)

**Table1. Department Table**
Question: Create a table named Department to store department information. The table should have the following columns:
•DepartmentID (Primary Key)
•DepartmentName (Name of the department, not null)
_Note: Ensure that DepartmentID is set as the primary key and DepartmentName is not allowed to be NULL._

**Answer:** - Created Table and Inserted desired values into this Department Table (Ataching herewith the Screenshot)
![image](https://github.com/user-attachments/assets/bbba6860-dac8-4aa6-8597-eca4a50344d3)

**Table2. Job Title Table**
Question: Create a table named JobTitle to store job titles for employees. The table should include:
•JobTitleID (Primary Key)
•JobTitleName (Name of the job title, not null)
_Note: Make sure to enforce that JobTitleName is unique and not NULL._

**Answer:** - Created Table and Inserted desired values into this Job Title Table (Ataching herewith the Screenshot)
![image](https://github.com/user-attachments/assets/e9bfd580-c3e7-4bb9-8dff-f105f4473c1a)

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
![image](https://github.com/user-attachments/assets/b68a9933-b00f-4589-a62b-ab396f2822e7)

****Table4. Attendance Table**
**Question: Create a table named Attendance to track employee attendance. The table should include the following columns:
•AttendanceID (Primary Key)
•EmployeeID (ID of the employee, foreign key referencing Employee)
•Date (Date of attendance)
•Status (Attendance status: 'Present', 'Absent', or 'Leave’)
_Note: Ensure that a foreign key constraint is placed on EmployeeID to reference the Employee table, and enforce that Status can only contain the values 'Present', 'Absent', or 'Leave'._

**Answer:** Created Table and Inserted desired values into this Attendance Table (Ataching herewith the Screenshot)
![image](https://github.com/user-attachments/assets/20d18df1-8284-440a-81eb-05706582d405)

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
![image](https://github.com/user-attachments/assets/0263390c-37e6-4bfa-af4f-abf70e961c3c)

**Table6. Project Table**
Question: Create a table named Project to store information about projects. The table should include the following columns:

•ProjectID (Primary Key)
•ProjectName (Name of the project, not null)
•StartDate (Start date of the project)
•EndDate (End date of the project)
•ProjectManagerID (ID of the manager responsible for the project, foreign key referencing Employee)

_Make sure to enforce that ProjectManagerID references the Employee table and indicates who is the manager of the project._

**Answer:** Created Table and Inserted desired values into this Project Table (Ataching herewith the Screenshot)
![image](https://github.com/user-attachments/assets/a3eef37b-6a21-4bfe-8f82-5aaab3818f39)

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
![image](https://github.com/user-attachments/assets/ae88d6f6-23f5-4c21-916b-cc918e334c84)


**************************************************************SOME ASSIGNMENT QUESTIONS ON DATA RETRIEVAL FROM THESE TABLES:*****************************************************************
**Question1: Retrieve the first and last names of all employees.**

**Solution:**
![image](https://github.com/user-attachments/assets/ab320bea-74e1-482b-87b6-e301e9610fbb)

**Question2. Retrieve the first and last names of employees who work as 'Software Engineer'.**

**Solution:**
![image](https://github.com/user-attachments/assets/6a476b3e-0a09-4bcc-8e95-1b8dcd177541)

**Questions3. Retrieve first names and last names of last 7 hires**

**Solution:** 
![image](https://github.com/user-attachments/assets/eed7f6fd-3ff8-4183-8037-0c38b80c6370)

**Questions4. Get the count of employees in each job title.**

**Solution:**
![image](https://github.com/user-attachments/assets/24790d18-d9f4-42d3-879c-acebfffdd84b)

**Questions5. Retrieve the full name & other personal info of employees who work in the 'Engineering' department.**

**Solution:**
![image](https://github.com/user-attachments/assets/f448759b-09bd-45fd-a010-89ea6fe66f49)

**Questions6. List job titles that have more than 3 employees.**

**Solution:**
![image](https://github.com/user-attachments/assets/b6386317-15dc-4d57-b82f-42c7edd8db0a)

**Questions7. Retrieve all employee names along with their department names.**

**Solution:**
![image](https://github.com/user-attachments/assets/54b612eb-1840-4b40-9b2f-b9e22e05649e)

**Questions8. Retrieve the first names of employees and the projects they are working on, along with their role in the project.**

**Solution:**
![image](https://github.com/user-attachments/assets/12425a40-5ae4-483d-80fe-9a2d0de5fef5)

**Questions9. Get the count of employees in each department.**

**Solution:**
![image](https://github.com/user-attachments/assets/cd73a09f-0db2-459e-8110-23760bd32e5a)

**Questions10. List all departments with more than 5 employees.**

**Solution:**
![image](https://github.com/user-attachments/assets/e1ad7e00-cd33-4da8-85ff-a83f33020cec)

**Questions11. Retrieve the full names of employees and their managers.**

**Solution:**
![image](https://github.com/user-attachments/assets/25c9bd00-1eb0-48d8-87b0-8b4f79f54f1e)

**Questions12. Which manager is managing more employees and how many?**

**Solution:**
![image](https://github.com/user-attachments/assets/23ea9d03-f827-4f54-9104-76e8175fc6f0)

**Questions13. Retrieve names of employees working on projects as 'Software Engineer', ordered by project start date**

**Solution:**
![image](https://github.com/user-attachments/assets/092c1e3a-e42c-4ee3-8fcf-583671d8abc2)

**Questions14. Retrieve the names of employees who are working on 'Project Delta'.**

**Solution:**
![image](https://github.com/user-attachments/assets/021eee37-d4d1-4813-9f47-b32f06fdeff1)

**Questions15. Retrieve the names of employees, department name, and total salary, ordered by total salary in descending order.**

**Solution:**
![image](https://github.com/user-attachments/assets/13d02039-c1eb-4da2-9df7-4c31d3129363)

**Questions16. Create a function to find employees with a birthday in the given month and calculate their age.**

**Solution:**
![image](https://github.com/user-attachments/assets/2c3cb22e-e962-4c18-b574-d92cf45c2574)
