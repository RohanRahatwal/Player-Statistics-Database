create database statistics;
create table info(
player_id int primary key,
player_name varchar(20),
player_dob date,
player_age int,
player_team varchar(20),
player_runs int,
player_salary int );
describe player_info;

#modify column
alter table info
modify column player_salary bigint;

#add 1 column into table
alter table info add(
player_email varchar(50));

#changing table name
alter table info
rename to player_info;

describe player_info;

insert into player_info values(1,"Virat","1988-11-05",34,"Rcb","Batsman",7263,170000000,"virat@gmail.com");
insert into player_info values(2,"Rohit","1987-04-30",36,"Mi","Batsman",6211,150000000,"rohit@gmail.com");
insert into player_info values(3,"Dhawan","1985-12-05",37,"PK","Batsman",6616,10000000,"dhawan@gmail.com");
insert into player_info values(4,"Dhoni","1981-07-07",34,"Csk","Wicket keeper",5082,150000000,"mahi@gmail.com");
insert into player_info values(5,"Rahul","1992-04-18",31,"Lsg","Batsman",4163,160000000,"rahul@gmail.com");
insert into player_info values(6,"Bumrah","1993-12-06",29,"Mi","Bowler",500,130000000,"bumrah@gmail.com");
insert into player_info values(7,"Ruturaj","1997-01-31",26,"Csk","Batsman",1797,80000000,"ruturaj@gmail.com");
insert into player_info values(8,"Siraj","1994-03-13",29,"Rcb","Bowler",100,70000000,"siraj@gmail.com");
insert into player_info values(9,"Shreyas","1994-12-09",28,"Kkr","Batsman",2776,130000000,"shreyas@gmail.com");
insert into player_info values(10,"Bhuvi","1990-02-05",33,"Srh","Bowler",300,60000000,"bhuvi@gmail.com");

select*from player_info;

# update a record in table
update player_info
set player_runs= 5000
where player_id=5;
select*from player_info;

update player_info
set
player_age ="42"
where player_id='4';

select player_name
from player_info
where player_team ="Mi";

#where condition
select player_name
from player_info
where player_id=9;

select*
from player_info
where player_name="Rohit";

select*
from player_info
where player_age>30;

select*
from player_info
where player_dept="Bowler";

select player_name, player_team,player_dept
from player_info
where player_age<30 or player_dept="Bowler";

select player_name, player_team,player_dept
from player_info
where player_age<30  and player_dept="Bowler";

#count all players from team MI
select count(*)
from player_info
where player_team="Mi";

#distinct
select distinct(player_team)
from player_info;

select count(distinct(player_team))
from player_info;

#between operator
select*
from player_info
where player_age between 34 and 42;

#and operator
select*
from player_info
where player_age>=30 and player_age<=42;

#or operator
select player_name, player_team
from player_info
where player_runs>6000 or player_runs<5000;

#in operator
select*
from player_info
where player_age in(29,36,42);

#aggregate function
select  sum(player_runs)
from player_info
where player_team="Mi";

select  avg(player_runs)
from player_info;

select  max(player_runs) as 'maximum runs'
from player_info;

select round (avg(player_runs),2)
from player_info;

#alias function
select  count(distinct(player_team)) as 'Total Teams'
from player_info;

#like or wildcard opeartor
select*
from player_info
where player_name like "%Bumrah%";

#is not equal to
select player_name,player_team,player_runs,player_dept
from player_info
where player_dept!="Batsman";

#order by
select player_name, player_runs
from player_info
order by player_runs;

#using order by and using descending order
select player_name, player_runs
from player_info
order by player_runs desc limit 5;

#group by function
select player_team as Team,count(*)as 'Total players'
from player_info
group by player_team;

select player_dept, round (avg(player_salary),2) as average_salary
from player_info
group by player_dept;

#department wise players
select player_dept,count(*) as 'count of players'
from player_info
group by player_dept;

#Having clause
SELECT player_dept, player_age
FROM player_info
GROUP BY player_dept,player_age
HAVING player_age > 25;

#date function
select player_name,player_dob,year(player_dob),monthname(player_dob),dayname(player_dob)
from player_info;

delete from player_info
where player_id=6;
select*from player_info;

#without subquery
select player_id,player_name,player_team
from player_info
order by player_age desc limit 1;

#subquery
select player_id,player_name,player_team
from player_info
where player_age=(select max(player_age) from player_info);

update player_info
set player_salary=player_salary*0.83
where player_id=1;

select * from player_info;

update player_info
set player_salary=player_salary*0.50
where player_id=3;