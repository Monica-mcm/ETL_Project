drop table if exists starbucks

create table starbucks(
	id INT primary key,
	store_name text,
	street_address text,
	city text,
	state_name text,
	country_name text,
	postcode int,
	longitude int,
	latitude int
)



