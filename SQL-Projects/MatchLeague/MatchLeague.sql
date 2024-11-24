create database matchleague;
use matchleague;

select * from country limit 5;
select * from league limit 5;
select * from matches limit 5;
select * from team limit 5;

-- BUILDING OF PRIMARY KEY AND FOREIGN KEY

alter table country add primary key(id);

alter table league add primary key(id);

alter table matches add primary key(match_api_id);

alter table team add primary key(match_api_id);

alter table league add foreign key(country_id) references country(id);

alter table matches add foreign key(home_team_api_id) references team(team_api_id);

alter table matches add foreign key(away_team_api_id) references team(team_api_id);

alter table matches add foreign key(home_team_api_id) references team(team_api_id);

alter table matches add foreign key (league_id) references league (id);

-- DUPLICATES VALUES CHECKING IN COUNTRY TABLE

select id, name, count(*)
from country
group by id, name
having count(*) >1;

-- DUPLICATES VALUES CHECKING IN LEAGUE TABLE

select id, country_id, name, count(*)
from league
group by id, country_id, name
having count(*) >1;

-- DUPLICATES VALUES CHECKING IN TEAM TABLE
-- first, we need to add a duplicate values in team table manually just for easy reference.

select * from team;
insert into team values (31456, 1958, 110745, "Jagiellonia Bia?ystok", "BIA");

select team_api_id from
(select team_api_id,
row_number() over (partition by id, team_fifa_api_id, team_long_name, team_short_name) as r
from team)A
where r>=2;

-- if we want to display other relevent columns then we can select column names. But here primary key is team_api_id so we can
-- fetch the duplicates with this id and delete these duplicates.

-- finding and deleting duplicates in TEAM table

select team_api_id, id, team_fifa_api_id, team_long_name, team_short_name, r from
(select team_api_id, id,
row_number() over (partition by id, team_fifa_api_id, team_long_name, team_short_name) as r,
team_fifa_api_id, team_long_name, team_short_name
from team)A
where r>=2;


delete from team where team_api_id
in
(
select team_api_id from
(select team_api_id, id,
row_number() over (partition by id, team_fifa_api_id, team_long_name, team_short_name order by team_api_id) as r,
team_fifa_api_id, team_long_name, team_short_name
from team)A
where r>=2);

-- Finding duplicates in Matches table

select id, country_id, league_id, season, stage, 'date', match_api_id, home_team_api_id, away_team_api_id, count(*)
from matches
group by id, country_id, league_id, season, stage, 'date', match_api_id, home_team_api_id, away_team_api_id
having count(*) >1;

-- In the Matches table, the Date column is in Text datatype. Therefore, we need to convert the date column to the correct datatype.

select * from matches;
-- Defualt date-time format is in 'yyyy-mm-dd hh:mm: ss'

select str_to_date('date', "%y-%m-%d %H:%i:%s");

alter table matches modify column date timestamp;

-- Home team goals

select matches.home_team_api_id,
		team.team_long_name,
        sum(matches.home_team_goal) as goal_count
from 
		matches
        join
        team
on
		matches.home_team_api_id = team.team_api_id
group by matches.home_team_api_id, team.team_api_id
having sum(matches.home_team_goal) > 3;

-- CREATE A VIEW TO IDENTIFY THE NUMBER OF GOALS A 'HOME TEAM' AND 'AWAY TEAM'
create view home_team_goal_count as
select matches.home_team_api_id,
		team.team_long_name,
        sum(matches.home_team_goal) as goal_count
from 
		matches
        join
        team
on
		matches.home_team_api_id = team.team_api_id
group by matches.home_team_api_id, team.team_api_id
having sum(matches.home_team_goal) > 3;

select * from home_team_goal_count
order by goal_count desc;

drop view if exists home_goal_count; 

-- CREATE A VIEW TO IDENTIFY THE NUMBER OF GOALS A 'HOME TEAM' AND 'AWAY TEAM'

create view away_team_goal_count as
select matches.away_team_api_id,
		team.team_long_name,
        sum(matches.away_team_goal) as goal_count
from 
		matches
        join
        team
on
		matches.away_team_api_id = team.team_api_id
group by matches.away_team_api_id, team.team_api_id
having sum(matches.away_team_goal) > 3;

select * from away_team_goal_count
order by goal_count desc;

-- USE CASE 1: IDENTIFY THE TEAM WON BASED ON THE NUMBER OF GOALS THEY HAVE MADE ON A DAY.

select winning_team_api_id, team.team_long_name, match_date, match_api_id
from
(select match_api_id, date as match_date,
case
when home_team_goal > away_team_goal then home_team_api_id
when away_team_goal > home_team_goal then away_team_api_id
when away_team_goal = home_team_goal then "tie"

end as winning_team_api_id
from
matches)A
join
team
on
A.winning_team_api_id = team.team_api_id;

-- USE CASE 2: LIST DOWN THE DIFFERENT COUNTRY NAMES AND DIFFERENT LEAGUES HAPPENED IN EVERY COUNTRY.

select country.name as country_name,
league.name as league_name
from
country
join 
league
on country.id = league.country_id;

-- USE CASE 3:
-- UNDER EVERY COUNTRY AND LEAGUE CALCULATE THE CERTAIN METRICS LIKE:
-- NUMBER OF DISTINCT STAGES/GROUNDS,
-- NUMBER OF TEAMS
-- AVERAGE HOME TEAM GOALS
-- AVERAGE AWAY TEAM GOALS
-- AVERAGE TOTAL NUMBER OF GOALS
-- SUM OF THE TOTAL GOALS MADE BY HOME AND AWAY TEAM

select country.name as country_name,
league.name as league_name,
count(distinct matches.stage) as no_of_distinct_stages,
count(AT.team_api_id) as no_of_teams,
avg(matches.home_team_goal) as avg_home_team_goals,
avg(matches.away_team_goal) as avg_away_team_goals,
avg(matches.home_team_goal + matches.away_team_goal) as avg_total_no_of_goals,
sum(matches.home_team_goal + matches.away_team_goal) as sum_total_no_of_goals
from matches
join country
on country.id = matches.country_id
join league
on league.id = matches.league_id
left join team as HT
on HT.team_api_id = matches.home_team_api_id
left join team as AT
on AT.team_api_id = matches.away_team_api_id
group by country.name, league.name
order by country.name, league.name;

-- USE CASE 4: 
-- IDENTIFY THE LEAGUE NAMES AND THE NUMBER OF HIGH SCORE HAPPENED IN EVERY LEAGUE
-- HIGH SCORE MATCHES - MATCHES WITH TOTAL NUMBER OF GOALS GREATER THAN 10

-- (we are going to use CTE here which stands Common Table Expressions which is a kind of alternative of Subquery)

with big_game as (
select league_id, match_api_id,
home_team_api_id, away_team_api_id
from matches
where home_team_goal + away_team_goal >=10)
select league.name as league_name,
count(big_game.match_api_id) as high_score_matches
from big_game
left join league
on league.id = big_game.league_id
group by league_id;

-- USE CASE 5: 
-- RANK THE LEAGUE BASED ON THE AVERAGE TOTAL NUMBER OF GOALS ACHIEVED IN EACH LEAGUE

select league.name as league_name,
rank() over (order by avg(home_team_goal+away_team_goal) desc) as league_rank,
round(avg(home_team_goal+away_team_goal), 2) as avg_no_of_goals
from matches
left join league
on league.id = matches.league_id
group by league_id
order by league_rank;

-- USE CASE 6: STORE PRECEDURE
-- BUILD A PROCEDURE TO FIND OUT THE HOME TEAM GOAL COUNT AND AWAY TEAM GOAL COUNT

delimiter | 
create procedure team_goal_count(IN team_api int, OUT home_team_count int, OUT away_team_count int)
begin
select 
sum(case when home_team_api_id = team_api then home_team_goal end) as home_team_goal_count,
sum(case when away_team_api_id = team_api then away_team_goal end) as away_team_goal_count
from matches;
end | 

-- example team_api = 9987
set @team_api = 9987;
call team_goal_count(@team_api, @home_team_count, @away_team_count) 


-- USE CASE 7: LEAD & LAG FUNCTION
-- ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
-- ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
-- ROWS BETWEEN N PRECEDING AND N FOLLOWING
-- FIND THE RUNNING TOTAL FOR A PARTICULAR TEAM e.g., "KAA Gent" WHEN THEY HAVE PLAYED AS A HOME_TEAM

select matches.date, 
	team.team_long_name,
    home_team_goal,
    sum(home_team_goal) over (order by matches.date rows between unbounded preceding and current row) as running_total
    from
    matches
    join
    team
    on team.team_api_id = matches.home_team_api_id
    where team.team_api_id = 9991;