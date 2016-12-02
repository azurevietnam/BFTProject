create database BFTSystem
create table [FLIGHT] 
(
flight_id char(10) primary key ,
flight_name nvarchar(15) ,
airline_name nvarchar(30) ,
from_location nvarchar(30) ,
to_location nvarchar(30) ,
departure_time datetime ,
arrival_time datetime ,
first_class_seats int,
business_seats int,
economy_seats int
)

create table FLIGHT_DETAILS 
(
detail_id char(10)  primary key,
flight_id char(10)  foreign key references FLIGHT(flight_id),
departure_date datetime ,
arrival_date datetime, 
first_class_price money,
business_price money,
economy_price money,
avai_first_class_seats int,
avai_business_seats int,
avai_economy_seats int
)

create table PASSENGER
(
passenger_id char(10) primary key,
first_name nvarchar(30) ,
last_name nvarchar(30) ,
address nvarchar(50) ,
tel_no nvarchar(15) ,
email nvarchar(50) ,
)


create table BOOKING
(
booking_id char(10) primary key,
passenger_id char(10) foreign key references PASSENGER(passenger_id),
detail_id char(10) foreign key references FLIGHT_DETAILS(detail_id),
booking_closed bit,
booking_date datetime,
adults int,
children int,
infants int,
class int,
total_price money
)

create table users
(
username nvarchar(30) primary key,
password nvarchar(30) ,
first_name nvarchar(30)  ,
last_name nvarchar(30)   ,
email nvarchar(50) ,
facebook_id nvarchar(20),
facebook_link nvarchar(80),
is_admin bit
)



insert into FLIGHT_DETAILS values(?,?,?,?,?,?,?,?,?,?)

select * from FLIGHT_DETAILS where detail_id=?
delete from FLIGHT_DETAILS where detail_id=

select * from users

