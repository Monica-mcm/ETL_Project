-- Import Table for Strabucks locations

drop table if exists starbucks

create table starbucks(
	id INT primary key,
	store_name text,
	street_address text,
	state_name text,
	country_name text,
	postcode numeric,
	longitude numeric,
	latitude numeric
)

select * from starbucks

-- import from wizard starbucks csv

select * from starbucks

-- Import Table for Post Codes

drop table if exists Postcodes

create table Postcodes(
	id INT primary key,
	Postcode numeric,
	state_name text,
	municipality_name text,
	City text,
	Settlement text
)

select * from Postcodes

-- import from wizard Postal Codes

select * from Postcodes


-- Import Table for Air B&B properties

drop table if exists AirBNB

create table AirBNB(
    id int primary key,
    name text,
    neighbourhood text,
    latitude numeric,
    longitude numeric,
    room_type text
)

select * from AirBNB

-- import from wizard Postal Codes

select * from AirBNB

-- Transform AIR B&B with latitude & longitude with only 2 decimals

alter table AirBNB
add column latitude_aprox numeric,
add column longitude_aprox numeric;

select * from AirBNB


update AirBNB
set latitude_aprox = TRUNC(latitude, 2);

update AirBNB
set longitude_aprox = TRUNC(longitude, 2);

select * from AirBNB


-- JOIN 3 TABLES
drop table if exists joinedtable

--create table joinedtable as
--select a.name, a.neighbourhood, a.latitude_aprox, a.longitude_aprox,
--b.store_name, b.street_address, b.postcode, b.latitude, b.longitude
--
--from AIRBNB a, starbucks b
--
--where a.latitude_aprox = b.latitude and a.longitude_aprox = b.longitude;

drop table if exists joinedtable2

create table joinedtable2 as
select a.name, a.neighbourhood, a.latitude_aprox, a.longitude_aprox,
b.store_name, b.street_address, b.postcode, b.latitude, b.longitude
from AIRBNB a
LEFT JOIN starbucks b
ON a.latitude_aprox = b.latitude and a.longitude_aprox = b.longitude;

select * from joinedtable2;

-- Join with Postcodes

drop table if exists joinedtable3;

create table joinedtable3 as
select a.name, a.neighbourhood, a.latitude_aprox, a.longitude_aprox,
a.store_name, a.street_address, a.postcode, --a.latitude, a.longitude,
b.settlement, b.municipality_name

from joinedtable2 a
LEFT JOIN Postcodes b
ON a.postcode = b.postcode;

select * from joinedtable3
