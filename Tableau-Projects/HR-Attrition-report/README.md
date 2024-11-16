# Tableau_Dashboard_Employee_Attrition_HR
Identify patterns and trends in employee attrition within the organization.
_**Database Source: Attrition Data Received from Trainer at Learnbay for Project Work**_

##### Problem Statement
The purpose of this analysis is to identify patterns and trends in employee attrition within the organization. High attrition rates can be costly due to recruitment and training expenses and potential productivity losses. This analysis focuses on:

- Understanding attrition by department, gender, age group, job role, and education field.
- Identifying areas with the highest attrition to inform targeted retention strategies.

The goal is to provide actionable insights to HR for reducing attrition and improving employee satisfaction, using Tableau for visualization and exploratory data analysis.

### Solution Approach/Steps:

##### Data Preprocessing:

###### Load Data:
Import employee_attrition data into Tableau.
###### Data Cleaning:
Remove any null or irrelevant values to ensure data quality.
### Calculate New Fields (For easy visualisation):
###### Attrition count:
Gives the total count employee Attrition Count.
Formula used:
Attrition Count = IF [Attrition]='yes' THEN 1 ELSE 0 END
###### Age Bin:
Group employees into age ranges for easier analysis of attrition by age.
Created Papameter:
![image](https://github.com/user-attachments/assets/8f0e6f00-b42c-46a0-bda9-aaad2dbd413e)
 
###### Age Band/Group:
Categorize employees into broader age groups (e.g., Under 25, 25-34, etc.)
Formula Used:
IF [Age] < 25 THEN "Under 25"
ELSEIF [Age] >= 25 AND [Age] < 35 THEN "25-34"
ELSEIF [Age] >= 35 AND [Age] < 45 THEN "35-44"
ELSEIF [Age] >= 45 AND [Age] < 55 THEN "45-54"
ELSE "Over 55"
END
###### Attrition Rate:
Calculate overall and department-specific attrition rates to understand the impact across the organization.
Formula Used: SUM([Attrition Count])/ (SUM([Employee Count]))
###### Average Age:
Determine the average age of the employees experiencing attrition.

##### Dashboard Creation in Tableau:
###### Top-Level Metrics:
Display total employee count, active employees, attrition count, and overall attrition rate for quick insights.
###### Department-wise Attrition:
Use a pie chart to show department-wise attrition distribution, highlighting departments with higher attrition rates.
###### Employee Count by Age Group:
Create a bar chart to visualize employee distribution across age groups, helping to pinpoint ages where attrition is higher.
###### Job Satisfaction Rating by Job Role:
Use a heatmap to display job satisfaction ratings across roles, which may correlate with attrition patterns.
###### Attrition by Education Field:
Utilize a horizontal bar chart to show attrition based on employees' educational backgrounds.
###### Attrition by Age Group and Gender:
Create donut charts to show attrition across age groups and gender, revealing if specific age groups or genders are more prone to leaving.

#### Analysis & Interpretation:
###### High Attrition in Sales and Research Departments:
Analyze if work demands, environment, or satisfaction levels contribute to this.
###### Age Group Patterns:
Identify the age groups with the highest attrition. Employees aged 25-34 have the highest attrition, potentially due to career shifts or work-life balance needs.
###### Job Role Satisfaction Impact:
Roles with lower satisfaction ratings (e.g., Sales Executives) might benefit from interventions.
###### Educational Background:
Life Sciences and Medical fields have higher attrition rates, suggesting specific roles may have different expectations or career progression issues.

#### Recommendations:
###### 1. Targeted Retention Programs:
Focus on departments and job roles with high attrition, such as Sales and Research roles. Consider tailored retention strategies like flexible hours, upskilling opportunities, or mentorship.
###### 2. Improve Job Satisfaction:
For roles with low satisfaction, conduct focus groups or surveys to identify pain points and implement changes to improve working conditions.
###### 3. Career Development Opportunities:
High attrition in the 25-34 age range suggests employees in this group may seek growth. Offer clear career paths, promotions, or professional development to retain them.
###### 4. Review Hiring Practices in High-Attrition Education Fields:
Assess whether employees from specific educational backgrounds have mismatched expectations and consider refining role descriptions during recruitment.

Dashboard Link: https://public.tableau.com/app/profile/shashank.shekhar3512/viz/Employee_Attrition-HR/AttritionDashboard?publish=yes

![image](https://github.com/user-attachments/assets/706b4064-df9d-4246-bd14-a4551f204fdb)
