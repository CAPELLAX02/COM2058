create table if not exists employees (
                                         name varchar(100),
                                         team varchar(100),
                                         salary int,
                                         sick_leave int,
                                         annual_leave int
);

insert into employees (name, team, salary, sick_leave, annual_leave)
values
    ('ADAMS', 'RESEARCH', 28000, 34, 14),
    ('WILKES', 'MARKETING', 35000, 40, 10),
    ('STOKES', 'MARKETING', 32000, 22, 27),
    ('MEZA', 'COLLECTIONS', 43000, 37, 15),
    ('MERRICK', 'RESEARCH', 47000, 35, 18),
    ('RICHARDSON', 'MARKETING', 34500, 21, 26),
    ('FURY', 'COLLECTIONS', 35000, 27, 22),
    ('PRECOURT', 'PR', 41000, 23, 30);

select * from employees;

# 1. Show the average salary in each team. Group the output into teams.
select team, round(avg(salary), 2) as average_salary
from employees
group by team;

# 2. Find the teams that have average salaries under 39000.
select team
from employees
group by team
having avg(salary) < 39000;

# 3. Find the salary of everyone with less than 25 days of sick leave and order the
#    results by names.
select name, salary
from employees
where sick_leave < 25
order by name;

# 4. Find out how many people in each team have less than 30 days of sick leave
select team, count(*) as count_under_30_sickleave
from employees
where sick_leave < 30
group by team;

# 5. Find people (name) whose sick leave is more than annual leave.
select name
from employees
where sick_leave > annual_leave;