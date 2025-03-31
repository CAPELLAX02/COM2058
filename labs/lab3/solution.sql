create table if not exists students (
    id int primary key,
    name varchar(100),
    gpa decimal(3, 2),
    age int
);

insert into students (id, name, gpa, age)
values
    (17, 'Ali K.', 3.56, 21),
    (11, 'Mehmet S.', 2.12, 18),
    (25, 'Ayhan D.', 1.78, 17),
    (27, 'Fatma B.', 2.45, 17),
    (68, 'Fulya K.', 2.67, 19),
    (62, 'Ahmet T.', 3.03, 20),
    (42, 'Yasemin K.', 3.48, 22),
    (45, 'Nilüfer C.', 3.12, 18),
    (28, 'Mehmet R.', 2.89, 23),
    (36, 'Mustafa D.', 1.56, 18);


select * from students;

# 1. Find the names and ages of all the students.
select name, age
from students;

# 2. Find the students (names and ids) who have GPA above 3.00.
select id, name
from students
where gpa > 3.00;

# 3. Find the average of GPAs of students who have GPA above 2.50.
select avg(gpa) as average_gpa
from students
where gpa > 2.50;

# 4. Find the maximum age.
select max(age) as max_age
from students;

# 5. Find average of ages and average of GPAs.
select round(avg(age), 2) as average_age, round(avg(gpa), 2) as average_gpa
from students;

# 6. Find the average of student’s ages whose name start with the letter ‘M’.
select round(avg(age), 2) as avg_age_m_names
from students
where name like 'm%';

# 7. Display all the information sorted on age with descending order.
select *
from students
order by age desc;