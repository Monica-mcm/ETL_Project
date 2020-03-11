Project ETL
I.	Sources of data for extraction:
The identified data sources are:
-	Air B&B Mexico City: Contains the information of all Air B&B locations in Mexico City registered until October 2019.
o	Variables:
-	id
-	name
-	host_id
-	host_name
-	neighbourhood_group
-	neighbourhood
-	latitude
-	longitude
-	room_type
-	price
-	minimum_nights
-	number_of_reviews
-	last_review
-	reviews_per_month
-	calculated_host_listings_count
-	availability_365

-	Starbucks Locations Worldwide: This dataset includes a record for every Starbucks or subsidiary store location currently in operation until February 2017.
o	Variables:
-	Brand
-	Store Number
-	Store Name
-	Ownership Type
-	Street Address
-	City
-	State/Province
-	Country
-	Postcode
-	Phone Number
-	Timezone
-	Longitude
-	Latitude

-	Postal Codes: Provides the existing postal code for each settlement and municipality in Mexico (Country).
o	Variables
-	Código Postal
-	Estado
-	Municipio
-	Ciudad
-	Tipo de Aseentamiento
-	Asentamiento
-	Clave de oficina

II.	Type of transformation needed for this data (cleaning, joining, filtering, aggregating, etc).
-	Cleaning:
o	Postal Codes: 
-	Change name columns to English

-	Filtering:
o	Postal Codes: 
-	Drop Settlement Type and Office Code
-	Filter only Mexico City Postal Codes
o	AirB&B:
-	Keep name, neighbourhood, latitude, longitude, room_type and price.  
o	Starbucks:
-	Keep store name, street address, state/province, country, postcode, longitude, latitude.
-	Filter only country = MX for Mexico
-	Filter only state/province = DIF for Mexico City Starbucks locations
-	Transform:
o	Starbucks:
-	Rename the variables without spaces so SQL alchemy run smoothly
o	All tables:
-	Create an index variable as id for each table



III.	Load the information into an integrated (joined) database from Starbucks, Air B&B and Postal Codes:

-	Generate tables into database:
o	Create Starbucks, AirB&B and Postal Codes table in a database in pgAdmin application.

-	Join the three tables
o	Use AirB&B table (with name, neighbourhood, latitude, longitude as variables) as the pivot to join the information from Starbucks shops (with store name, street address and post code). The joining variable is based on the location (longitude and latitude).
o	Take output from previous step and join the settlement and municipality name from postal codes data from postal codes database.
o	Now a new table with the information of Starbuck close to the Air B&B available locations is done
o	The table is exported to CSV file
o	Some locations have more than one Starbucks shop available, in which case the Air B&B is repeated in the table with different Starbucks locations. Some locations do not have any Starbucks close, in which case the information of Starbucks locations is empty.
o	All records of Air B&B are maintained.

-	Bring the tables to Pandas
o	Use pandas SQL connection to populate each table (Starbucks, AirB&B and Post Codes) into SQL database. 
o	Confirm that all tables are contained in database.
o	Fill tables (Starbucks, AirB&B and Post Codes) with the values from dataframes generated in pandas.
o	Run a query to confirm that data has been added to each of the three tables.

