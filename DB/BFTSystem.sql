create database BFTSystem

create table [FLIGHT] 
(
flight_id char(10) primary key ,
flight_name nvarchar(15) ,
airline_name nvarchar(30) ,
from_location nvarchar(30) ,
to_location nvarchar(30) ,
departure_time nvarchar(10) ,
arrival_time nvarchar(10),
first_class_seats int,
business_seats int,
economy_seats int
)



create table FLIGHT_DETAILS 
(
detail_id char(10)  primary key,
flight_id char(10)  foreign key references FLIGHT(flight_id),
departure_date date ,
arrival_date date, 
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
first_class_book int,
business_book int,
economy_book int,
total_price money
)

create table USERS
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

drop table BOOKING


insert into FLIGHT values('AR56TU',)


select FLIGHT_DETAILS.flight_id, detail_id,flight_name,airline_name,from_location,to_location
	,departure_time,arrival_time,first_class_price,business_price,economy_price
from FLIGHT_DETAILS,FLIGHT 
where Flight.flight_id in( select flight_id from FLIGHT
					where from_location=N'Hà Nội HAN' and to_location=N'TP Hồ Chí Minh'
					)
	and departure_date= '2016-10-10'
	and avai_first_class_seats >=1
	and avai_business_seats  >=1
	and avai_economy_seats >=1



	
insert into FLIGHT values('AR56TU','VN 192', 'Vietnam Airline',N'Hà Nội HAN',N'TP Hồ Chí Minh',
		'07:00','09:10',28,35,211)

insert into FLIGHT values('BK74HN','VN 999', 'Vietnam Airline',N'Hà Nội HAN',N'TP Hồ Chí Minh',
		'07:00','09:10',28,35,211)
insert into FLIGHT_DETAILS values('AE87NU','AR56TU','2016-10-10','2016-10-10',4600,2600,1700,28,35,211)
insert into FLIGHT_DETAILS values('PLB456','BK74HN','2016-10-10','2016-10-10',4600,2600,1700,28,35,211)

select * from Flight_details