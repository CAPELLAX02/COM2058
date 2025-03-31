create table if not exists checks (
    check_id int primary key,
    payee varchar(100),
    amount decimal(5, 2),
    remarks varchar(100)
);

insert into checks (check_id, payee, amount, remarks)
values
    (1, 'Migros', 270.12, 'Groceries'),
    (2, 'Petrol Ofisi', 105.00, 'Gas (For Car)'),
    (3, 'TCDD', 25.00, 'Train to Konya'),
    (4, 'Turkcell', 528.00, 'Cellular Phone'),
    (5, 'Baskent Elektrik', 113.78, 'Electricity Bill'),
    (6, 'Flo', 175.00, 'Shoes'),
    (7, 'Migros', 315.90, 'Groceries'),
    (8, 'Allianz Sigorta', 365.43, 'Car Insurance');

select * from checks;

# Q1. Write a query that returns all checks (CHECK_ID, PAYEE, and AMOUNT) in the database in
#     which PAYEE begins with M or P.
select check_id, payee, amount
from checks
where payee like 'm%' or payee like '%p';

# Q2. Write a query that returns all checks (CHECK_ID, PAYEE, and AMOUNT) that is related to
#     Car expenses.
select check_id, payee, amount
from checks
where remarks like '%car%';

# Q3. Write a query that returns all PAYEEs in which the check AMOUNT is greater than 200.00.
#     Only one instance of duplicate data is shown.
select distinct payee
from checks
where amount > 200.00;

# Q4. Write a query that returns all the checks with the decreasing order of the check AMOUNT.
select *
from checks
order by amount desc;

# Q5. Write a query that returns all the checks (CHECK_ID, PAYEE, and AMOUNT) that is related
#     to Shoes or Groceries expenses.
select check_id, payee, amount
from checks
where remarks in ('Shoes', 'Groceries');

# second solution for Q5:
select check_id, payee, amount
from checks
where remarks like '%shoes%' or remarks like '%groceries%';