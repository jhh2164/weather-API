/* SQL query that outputs the average max and min temperature (rounded to 2 decimal points) of cities that have at least 2 words in thei rname */

select 
round(avg(Maximum_Temperature),2) 'Average Maximum Temperature', --rename the column names to look nicer :)
round(avg(Minimum_Temperature),2) 'Average Minimum Temperature'
from WEATHER
where City_Name REGEXP '^[^ ]+[ ]+[^ ]'; -- use regex to get at least two words in the City_Name string

/* SQL query that outputs the number of cities where Weather_Description = 'sky is clear' */

select count(City_Name) from WEATHER
where lower(Weather_Description) = 'sky is clear'; -- manipulates string into all lowercase first, so it becomes case-insensitive

/* SQL query that outputs the max_temp for each country, grouped by city population classified as small, medium, large */

select 
c.Country 'Country',
if (c.Population < 1000000, 'Small',
	if(c.Population < 5000000, 'Medium', "Large")) 'City_Size',
w.Maximum_Temperature 'Max_Temp'
from CITY c 
join WEATHER w on c.City_Name = w.City_Name
group by c.Population;



/* some example tables I created for testing purposes, can disregard or just fyi :) */

CREATE TABLE WEATHER (
  City_Name text,
  Longitude int,
  Latitude int,
  Wind_Speed int,
  Weather_Description text,
  Maximum_Temperature int,
  Minimum_Temperature int
);

CREATE TABLE CITY (
  City_Name text,
  Population int,
  States text,
  Country text,
  Total_Land text,
  Incorporation int,
  Elevation int
);

insert into WEATHER (City_Name, Longitude, Latitude, Wind_Speed, Weather_Description, Maximum_Temperature, Minimum_Temperature) values
	('New York', -73.9867, 40.7306, 13.87, 'sky is clear', 61.0, 53.01),
	('Jersey City', -74.0777, 40.7282,2.1, 'sky Is clear', 302.15,296.48),
	('Honolulu',-157.8557,21.3045,1.58,'light rain',299.15,295.15),
	('Berlin', 13.3889,52.517,2.6,'scattered clouds',297.59 ,294.82),
	('Beijing',116.3912,39.906,5,'clear sky',305.93,301.48),
	('Sydney',151.2165, -33.8549,1.85,'broken clouds',289.82,280.93),
	('Novosibirsk',82.9235,55.0282,4,'overcast clouds',289.15,289.15),
	('Barcelona',2.1774, 41.3829,10.3,'sky is Clear',315.93,304.15),
	('Fairbanks', -147.7167,64.8378,0.57,'smoke',289.82,284.82),
	('Rio de Janeiro',-43.2094,-22.9111,2.6,'few clouds',302.15,299.15),
	('Owens Cross Roads',-86.4589,34.5881,3.1,'sky is clear', 299.82,297.04);

insert into CITY (City_Name, Population, States, Country,Total_Land,Incorporation,Elevation) values
	('New York', 8622698, 'New York','United States',302.643,1898,33),
	('Jersey City',270753, 'New Jersey', 'United States', 21.08,1820,20),
	('Honolulu',351792, 'Hawaii', 'United States', 68.42,1850,19.69),
	('Berlin', 3575000,'Germany','Germany',23,1237,112),
	('Beijing',21540000,'China','China',6490,221,143),
	('Sydney',4627000,'New South Wales','Australia',4775, 1788,80),
	('Novosibirsk',1511000,'Siberia','Russia',194.1,1893,150),
	('Barcelona',1615000,'Catalonia','Spain',39,1899,39),
	('Fairbanks',31644,'Alaska','United States', 32.53,1901,446),
	('Rio de Janeiro',6320000, 'Brazil','Brazil',485,1565,5),
	('Owens Cross Roads',1939, 'Alabama','United States',8.3,1957,581);