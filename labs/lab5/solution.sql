create table if not exists faculty (
    f_id int primary key,
    f_name varchar(50),
    dept_id int
);

insert into faculty (f_id, f_name, dept_id)
values
    (45, 'Bugra H.', 1298),
    (46, 'Demir R.', 1317),
    (48, 'Semih Z.', 1405),
    (41, 'Selin C.', 2396),
    (47, 'Zeynep Z.', 2453),
    (49, 'Zafer K.', 2198);

create table if not exists student (
    s_num int primary key,
    s_name varchar(50),
    major varchar(50),
    level varchar(50),
    age int
);

insert into student (s_num, s_name, major, level, age)
values
    (1234, 'Ahmet Kartal', 'History', 'Senior', 21),
    (3456, 'Mehmet Sahin', 'Math', 'Junior', 18),
    (2356, 'Hasan Dogan', 'Statistics', 'Freshmen', 17),
    (3345, 'Ali Serce', 'Comp. Eng.', 'Sophomore', 18),
    (1256, 'Murat Baykus', 'History', 'Junior', 20),
    (9874, 'Fatma Seyhan', 'History', 'Junior', 18),
    (5643, 'Emine Ceyhan', 'Comp. Eng.', 'Senior', 19),
    (5649, 'Gulay Sakarya', 'Comp. Eng.', 'Senior', 20);

create table if not exists class (
    name varchar(10),
    meet_sat varchar(20),
    room varchar(10),
    f_id int,
    foreign key (f_id) references faculty(f_id),
    primary key (name, meet_sat)
);

insert into class (name, meet_sat, room, f_id)
values
    ('HIS105', 'Tuesday 10:30',    'R128', 48),
    ('MAT108', 'Thursday 13:30',   'R128', 48),
    ('MAT107', 'Friday 14:30',     'R111', 45),
    ('HIS207', 'Monday 15:30',     'R111', 48),
    ('HIS105', 'Wednesday 15:30',  'R345', 48),
    ('ENG208', 'Monday 15:30',     'R345', 46),
    ('MAT101', 'Wednesday 11:30',  'R345', 45),
    ('ENG205', 'Friday 10:30',     'R128', 41);

create table if not exists enrolled (
    s_num int,
    c_name varchar(10),
    primary key (s_num, c_name),
    foreign key (s_num) references student(s_num),
    foreign key (c_name) references class(name)
);

insert into enrolled (s_num, c_name)
values
    (1234, 'HIS105'),
    (1234, 'HIS207'),
    (1234, 'ENG208'),
    (1234, 'ENG205'),
    (3456, 'MAT108'),
    (3456, 'MAT107'),
    (3456, 'MAT101'),
    (2356, 'MAT107'),
    (3345, 'MAT101'),
    (3345, 'ENG208'),
    (1256, 'HIS105'),
    (1256, 'HIS207'),
    (1256, 'MAT101'),
    (1256, 'ENG208'),
    (9874, 'HIS207'),
    (9874, 'HIS105'),
    (9874, 'MAT108'),
    (5643, 'ENG208'),
    (5643, 'MAT107'),
    (5643, 'ENG205');

select * from faculty;
select * from student;
select * from class;
select * from enrolled;

# 1. Find the names of all juniors who are enrolled in a class taught by faculty with the id of 45.
select distinct student.s_name
from student, class, enrolled
where (student.level = 'junior') and
      (class.f_id = 45) and
      (class.name = enrolled.c_name) and
      (student.s_num = enrolled.s_num);

# 2. Find the age of the oldest students who is either a History major or enrolled in a course taught by faculty with the id of 45.
select max(student.age)
from student
where (student.major = 'history') or
      (student.s_num in (
              select enrolled.s_num
              from class, enrolled
              where (class.f_id = 45) and
                    (class.name = enrolled.c_name)
          )
      );

# 3. Find the names of all classes that either meet in room R128 or have three or more students enrolled.
select distinct class.name
from class
where (class.room = 'R128') or
      (class.name in (
              select enrolled.c_name
              from enrolled
              group by enrolled.c_name
              having count(*) >= 3
          )
      );

# 4. Find the names of all students who are enrolled in two classes that meet at the same time.
select distinct student.s_name
from student
where student.s_num in (
        select e1.s_num
        from
            enrolled e1,
            enrolled e2,
            class c1,
            class c2
        where (e1.s_num = e2.s_num) and
              (e1.c_name != e2.c_name) and
              (e1.c_name = c1.name) and
              (e2.c_name = c2.name) and
              (c1.meet_sat = c2.meet_sat)
    );

# 5. Find the names of faculty members who teach in every room in which some class is taught.
select distinct faculty.f_name
from faculty
where not exists(
    select *
    from class c1
    where c1.room not in (
            select c2.room
            from class c2
            where faculty.f_id = c2.f_id
        )
);

# 6. Find the names of faculty members for whom the combined enrollment of the courses that they teach is less than five.
select distinct faculty.f_name
from faculty
where (5 > (
        select count(enrolled.s_num)
        from class, enrolled
        where (class.name = enrolled.c_name) and
              (class.f_id = faculty.f_id)
    )
);

# 7. For each level, print the level and the average age of students for that level.
select student.level, avg(student.age)
from student
group by student.level;

# 8. For all levels except juniors, print the level and the average age of students for that level.
select student.level, avg(student.age)
from student
where student.level != 'junior'
group by student.level;




















