create table if not exists tv_programs (
    id int primary key,
    name varchar(50),
    type varchar(50),
    channel varchar(50),
    rating decimal(2, 1)
);

insert into tv_programs (id, name, type, channel, rating)
values
(1, 'COLD CASE', 'Serial', 'CNBC-E', 8.9),
(2, 'SEKSENLER', 'Serial', 'TRT 1', 7.5),
(3, 'STADYUM', 'Sport', 'TRT 1', 6.6),
(4, 'ATV ANA HABER', 'Newscast', 'ATV', 6.5),
(5, 'KANAL D HABER', 'Newscast', 'KANAL D', 5.2);

select * from tv_programs;