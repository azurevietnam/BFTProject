create database BFTSystem

create table [FLIGHT] 
(
flight_id varchar(10) primary key ,
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
detail_id varchar(10)  primary key,
flight_id varchar(10)  foreign key references FLIGHT(flight_id),
departure_date date ,
arrival_date date, 
first_class_price money,
business_price money,
economy_price money,
avai_first_class_seats int,
avai_business_seats int,
avai_economy_seats int
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

create table BOOKING
(
booking_id nvarchar(10) primary key,
username nvarchar(30) foreign key references USERS(username),
detail_id varchar(10) foreign key references FLIGHT_DETAILS(detail_id),
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


create table PASSENGER
(
passenger_id varchar(10) primary key,
booking_id nvarchar(10) foreign key references BOOKING(booking_id),
first_name nvarchar(30) ,
last_name nvarchar(30) ,
gender bit,
country nvarchar(30) ,
tel_no nvarchar(15) ,
email nvarchar(50) ,
)




insert into FLIGHT values('AR56TU',)


SELECT flight_details.flight_id, detail_id,flight_name,airline_name,
	departure_time,arrival_time,arrival_date,
	first_class_price,business_price,economy_price,
	avai_first_class_seats,avai_business_seats,avai_economy_seats
FROM FLIGHT_DETAILS,FLIGHT 
WHERE 
	FLIGHT.flight_id=FLIGHT_DETAILS.flight_id
    AND Flight.flight_id IN
				( SELECT flight_id FROM FLIGHT
				   WHERE from_location=N'Hà Nội HAN' AND to_location=N'TP Hồ Chí Minh'
				)
	AND departure_date= '2016-10-10'
	




insert into FLIGHT values('BU77HL','VN 333', 'Vietnam Airline',N'Hòa Lạc HOL',N'Detech',
		'07:00','09:10',28,35,211)

	
insert into FLIGHT values('AR56TU','VN 192', 'Vietnam Airline',N'Hà Nội HAN',N'TP Hồ Chí Minh',
		'07:00','09:10',28,35,211)

insert into FLIGHT values('BK74HN','VN 999', 'Vietnam Airline',N'Hà Nội HAN',N'TP Hồ Chí Minh',
		'07:00','09:10',28,35,211)
insert into FLIGHT_DETAILS values('AE87NU','AR56TU','2016-10-10','2016-10-10',4600,2600,1700,28,35,211)
insert into FLIGHT_DETAILS values('PLB456','BK74HN','2016-10-10','2016-10-10',4600,2600,1700,28,35,211)

select distinct from_location from FLIGHT

select DISTINCT to_location from FLIGHT
select * from BOOKING

insert into USERS values('tungds','admin','Tung','Dong','tungds@fpt.vn','','',1)

SELECT booking_id, flight_name, airline_name, from_location+' to '+to_location as route,
	booking_closed,booking_date, departure_date, arrival_date,total_price,
	class=CASE 
				WHEN first_class_book>0 THEN 'First Class'
				WHEN business_book>0 THEN 'Business'
				ELSE 'Economy'
			END  
FROM BOOKING,FLIGHT_DETAILS,FLIGHT  
WHERE BOOKING.detail_id=FLIGHT_DETAILS.detail_id  
AND FLIGHT_DETAILS.flight_id=FLIGHT.flight_id
AND username='tungds'