create table AIRPORT (
    Airport_code varchar(10) primary key,
    Name varchar(100),
    City varchar(50),
    State varchar(50)
);

create table AIRPLANE_TYPE (
    Type_name varchar(50) primary key,
    Company varchar(50),
    Max_seats int
);

create table AIRPLANE (
    Airplane_id varchar(20) primary key,
    Total_no_of_seats int,
    Type_name varchar(50),
    foreign key (Type_name) REFERENCES AIRPLANE_TYPE(Type_name)
);

create table AN_LAND (
    Airport_code varchar(10),
    Type_name varchar(50),
    primary key (Airport_code, Type_name),
    foreign key (Airport_code) REFERENCES AIRPORT(Airport_code),
    foreign key (Type_name) REFERENCES AIRPLANE_TYPE(Type_name)
);

create table FLIGHT (
    Number varchar(10) primary key,
    Airline varchar(50),
    Weekdays varchar(50)
);

create table FLIGHT_LEG (
    Flight_number varchar(10),
    Leg_no int,
    Departure_airport_code varchar(10),
    Arrival_airport_code varchar(10),
    Scheduled_dep_time time,
    Scheduled_arr_time time,
    primary key (Flight_number, Leg_no),
    foreign key (Flight_number) references FLIGHT(Number),
    foreign key (Departure_airport_code) references AIRPORT(Airport_code),
    foreign key (Arrival_airport_code) references AIRPORT(Airport_code)
);

create table LEG_INSTANCE (
    Flight_number varchar(10),
    Leg_no int,
    Date date,
    Airplane_id varchar(20),
    No_of_avail_seats int,
    Dep_time time,
    Arr_time time,
    primary key (Flight_number, Leg_no, Date),
    foreign key (Flight_number, Leg_no) references FLIGHT_LEG(Flight_number, Leg_no),
    foreign key (Airplane_id) references AIRPLANE(Airplane_id)
);

create table INSTANCE_OF (
    Flight_number varchar(10),
    Leg_no int,
    Date date,
    primary key (Flight_number, Leg_no, Date),
    foreign key (Flight_number, Leg_no, Date) references LEG_INSTANCE(Flight_number, Leg_no, Date)
);

create table FARE (
    Code varchar(10) primary key,
    Amount decimal(10,2),
    Restrictions text
);

create table FARES (
    Flight_number varchar(10),
    Fare_code varchar(10),
    primary key (Flight_number, Fare_code),
    foreign key (Flight_number) references FLIGHT(Number),
    foreign key (Fare_code) references FARE(Code)
);

create table SEAT (
    Airplane_id varchar(20),
    Seat_no varchar(10),
    primary key (Airplane_id, Seat_no),
    foreign key (Airplane_id) references AIRPLANE(Airplane_id)
);

create table RESERVATION (
    Flight_number varchar(10),
    Leg_no int,
    Date date,
    Seat_no varchar(10),
    Customer_name varchar(100),
    Cphone varchar(20),
    primary key (Flight_number, Leg_no, Date, Seat_no),
    foreign key (Flight_number, Leg_no, Date) references LEG_INSTANCE(Flight_number, Leg_no, Date),
    foreign key (Flight_number, Seat_no) references SEAT(Airplane_id, Seat_no)
);
