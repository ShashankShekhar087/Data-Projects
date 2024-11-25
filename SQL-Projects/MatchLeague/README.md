# Match League Project

## Overview
The Match League Project is an SQL-based analysis and data manipulation project designed to manage and explore match-related data for a league system.
It demonstrates the use of SQL for database creation, data cleaning, query optimization, and advanced analytics using real-world scenarios.

## Objectives
- Design and manage a relational database for match league data.
- Perform data cleaning, deduplication, and transformations.
- Execute complex queries to extract meaningful insights.
- Implement advanced SQL techniques, such as views, stored procedures, and window functions.
- Provide actionable metrics and analyses for decision-making.


## Key Features

### 1. **Database Schema**
- **Tables**: 'country', 'league', 'matches', 'team'
- **Relationships**:
  - 'league' links to 'country' via 'country_id'.
  - 'matches' links to 'team' for both home and away teams using 'team_api_id'.
  - 'matches' links to 'league' using 'league_id'.

### 2. **Data Cleaning**
- Identified and removed duplicate rows in 'country', 'league', and 'team' tables.
- Transformed the 'date' column in the 'matches' table from 'TEXT to 'TIMESTAMP' format for accurate temporal analysis.

### 3. **Data Analysis and Use Cases**
#### **Use Case 1**: Determine Match Winners
- Identified the winning team for each match based on goal counts.

#### **Use Case 2**: Country and League Analysis
- Listed leagues organized by country.

#### **Use Case 3**: Performance Metrics by Country and League
- Metrics include:
  - Number of stages and teams.
  - Average and total goals for home and away teams.

#### **Use Case 4**: High-Scoring Matches
- Identified matches with total goals greater than 10 and ranked leagues based on high scores.

#### **Use Case 5**: League Rankings
- Ranked leagues based on average goals per match using window functions.

#### **Use Case 6**: Team Goal Statistics
- Created a stored procedure to compute goal counts for home and away matches for a specific team.

#### **Use Case 7**: Running Totals
- Calculated running totals for home team goals using window functions.

---

## SQL Techniques Used
- **Primary and Foreign Keys**: Established relational integrity.
- **Views**: Simplified analysis with pre-aggregated data for home and away goals.
- **Window Functions**: Applied `SUM`, `LEAD`, and `LAG` for advanced analytics.
- **Common Table Expressions (CTEs)**: Simplified complex queries.
- **Stored Procedures**: Automated repetitive calculations.
- **Data Cleaning Queries**: Deduplicated rows and converted data types.

## Example Queries
Here are some key queries from the project:
#### USE CASE 1: IDENTIFY THE TEAM WON BASED ON THE NUMBER OF GOALS THEY HAVE MADE ON A DAY.

![image](https://github.com/user-attachments/assets/b22db044-8aa7-48bd-9e75-6779462d903d)  

#### USE CASE 2: LIST DOWN THE DIFFERENT COUNTRY NAMES AND DIFFERENT LEAGUES HAPPENED IN EVERY COUNTRY.

![image](https://github.com/user-attachments/assets/d34bf465-8302-4b34-bdd8-c6e3155dc88f)  

### USE CASE 3:
#### UNDER EVERY COUNTRY AND LEAGUE CALCULATE THE CERTAIN METRICS LIKE:
#### NUMBER OF DISTINCT STAGES/GROUNDS,
#### NUMBER OF TEAMS
#### AVERAGE HOME TEAM GOALS
#### AVERAGE AWAY TEAM GOALS
#### AVERAGE TOTAL NUMBER OF GOALS
#### SUM OF THE TOTAL GOALS MADE BY HOME AND AWAY TEAM

![image](https://github.com/user-attachments/assets/67f52797-bf78-4264-9d26-a151d4c3f030)  

#### USE CASE 4:  
#### IDENTIFY THE LEAGUE NAMES AND THE NUMBER OF HIGH SCORE HAPPENED IN EVERY LEAGUE  
#### HIGH SCORE MATCHES - MATCHES WITH TOTAL NUMBER OF GOALS GREATER THAN 10  
_(I am going to use CTE here which stands Common Table Expressions. It is a kind of alternative of Subquery)_

![image](https://github.com/user-attachments/assets/dff3f761-3dfd-43d7-b2f1-fd75da37ae78)  

#### USE CASE 5:  
#### RANK THE LEAGUE BASED ON THE AVERAGE TOTAL NUMBER OF GOALS ACHIEVED IN EACH LEAGUE  

![image](https://github.com/user-attachments/assets/053f496d-bb25-4d58-a511-e70c989a1b5e)

#### USE CASE 6: STORE PRECEDURE  
#### BUILD A PROCEDURE TO FIND OUT THE HOME TEAM GOAL COUNT AND AWAY TEAM GOAL COUNT  

![image](https://github.com/user-attachments/assets/b77642aa-05e1-47a5-b311-fed158575f72)  

#### USE CASE 7: LEAD & LAG FUNCTION
#### ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
#### ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
#### ROWS BETWEEN N PRECEDING AND N FOLLOWING  
#### FIND THE RUNNING TOTAL FOR A PARTICULAR TEAM e.g., "KAA Gent" WHEN THEY HAVE PLAYED AS A HOME_TEAM

![image](https://github.com/user-attachments/assets/0a128129-032e-4d26-8716-8cb4d730cd27)
