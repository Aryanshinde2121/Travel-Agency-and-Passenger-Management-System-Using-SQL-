create database project2;
use project2;



-- Create the TravelAgency table
CREATE TABLE TravelAgency (
    AgencyID INT PRIMARY KEY AUTO_INCREMENT,
    AgencyName VARCHAR(100) NOT NULL,
    Location VARCHAR(150),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    EstablishedYear INT,
    ServicesOffered TEXT
);

-- Create the Passenger table
CREATE TABLE Passenger (
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    AgencyID INT,
    FOREIGN KEY (AgencyID) REFERENCES TravelAgency(AgencyID) 
);


INSERT INTO TravelAgency (AgencyName, Location, ContactNumber, Email, EstablishedYear, ServicesOffered) VALUES
('Travel Globe', 'New York, USA', '1234567890', 'info@travelglobe.com', 2001, 'Flights, Hotels, Tours'),
('Wanderlust Adventures', 'London, UK', '9876543210', 'contact@wanderlust.com', 1998, 'Cruises, Car Rentals, Flights'),
('Sunny Travels', 'Sydney, Australia', '1112223334', 'support@sunnytravels.au', 2005, 'Hotels, Flights, Holiday Packages'),
('Oceanic Voyages', 'Miami, USA', '4445556667', 'info@oceanicvoyages.com', 2010, 'Cruises, Yacht Rentals'),
('Global Trekkers', 'Toronto, Canada', '7778889990', 'hello@globaltrekkers.ca', 1995, 'Adventure Tours, Flights'),
('Sky High Travel', 'Dubai, UAE', '1122334455', 'contact@skyhigh.ae', 2015, 'Luxury Travel, Private Jets'),
('Happy Trails', 'Cape Town, South Africa', '5566778899', 'trails@happytrails.co.za', 2008, 'Safaris, Nature Tours'),
('Urban Nomads', 'Berlin, Germany', '6677889900', 'info@urbannomads.de', 2012, 'Backpacking, Youth Hostels'),
('Jetsetters Inc.', 'Los Angeles, USA', '7788990011', 'jetsetters@travel.com', 1997, 'Flights, VIP Tours'),
('Mountain Movers', 'Kathmandu, Nepal', '8899001122', 'contact@mountainmovers.np', 2018, 'Trekking, Expeditions'),
('Travel Buzz', 'Madrid, Spain', '9900112233', 'info@travelbuzz.es', 2019, 'Flights, Cruises, Tours'),
('Dream Destinations', 'Rome, Italy', '6677884455', 'dreams@travelrome.it', 2003, 'Luxury Tours, Cultural Trips'),
('World Wanderer', 'Tokyo, Japan', '7788556699', 'info@worldwanderer.jp', 2017, 'Cultural Experiences, City Tours'),
('Pathfinders', 'Mexico City, Mexico', '8800997766', 'path@finders.mx', 2009, 'All-Inclusive Vacations'),
('Vivid Voyages', 'Paris, France', '9991112233', 'contact@vividvoyages.fr', 2020, 'Romantic Tours, City Breaks'),
('Skyline Travels', 'Hong Kong, China', '4455667788', 'info@skyline.hk', 2013, 'Business Travel, Flights'),
('Safari Seekers', 'Nairobi, Kenya', '5544332211', 'seekers@safari.ke', 2006, 'Wildlife Safaris, Eco Tours'),
('Zen Travels', 'Bangkok, Thailand', '6677889900', 'zen@travelbangkok.th', 2011, 'Wellness Retreats, Beach Vacations'),
('Voyage Masters', 'Singapore, Singapore', '2233445566', 'contact@voyagemasters.sg', 1999, 'Luxury Cruises, Island Hopping'),
('Nomadic Horizons', 'Reykjavik, Iceland', '9988776655', 'horizons@nomadic.is', 2004, 'Northern Lights, Adventure Travel');


INSERT INTO Passenger (FullName, Age, AgencyID) VALUES
('John Doe', 34, 1),
('Jane Smith', 28, 2),
('Michael Brown', 45, 3),
('Emily Davis', 22, 4),
('Chris Wilson', 31, 5),
('Anna Johnson', 29, 6),
('David Garcia', 40, 7),
('Laura Martinez', 33, 8),
('James White', 36, 9),
('Mia Thomas', 27, 10),
('Daniel Lee', 38, 1),
('Sophia Harris', 24, 2),
('Ethan Lewis', 26, 3),
('Olivia Walker', 30, 4),
('Benjamin Hall', 32, 5),
('Ella Allen', 21, 6),
('Alexander Scott', 37, 7),
('Grace Young', 23, 8),
('Matthew Adams', 35, 9),
('Amelia Baker', 25, 10);


#QUERIES:

# Retrieve all records :

-- Retrieve all records from TravelAgency
SELECT * FROM TravelAgency;

-- Retrieve all records from Passenger
SELECT * FROM Passenger;

# Retrieve specific columns:

-- Retrieve only AgencyName and Location from TravelAgency
SELECT AgencyName, Location FROM TravelAgency;

-- Retrieve FullName and Age from Passenger
SELECT FullName, Age FROM Passenger;

 # Filter records using conditions:

-- Find travel agencies established after 2000
SELECT * FROM TravelAgency WHERE EstablishedYear > 2000;

-- Find passengers who are older than 30
SELECT * FROM Passenger WHERE Age > 30;

 # Use LIKE for pattern matching:

-- Find travel agencies with 'Travel' in their name
SELECT * FROM TravelAgency WHERE AgencyName LIKE '%Travel%';

-- Find passengers whose names start with 'J'
SELECT * FROM Passenger WHERE FullName LIKE 'J%';

 #Sort records:

-- Sort travel agencies by EstablishedYear in ascending order
SELECT * FROM TravelAgency ORDER BY EstablishedYear ASC;

-- Sort passengers by Age in descending order
SELECT * FROM Passenger ORDER BY Age DESC;

 #Aggregate functions:

-- Count the total number of travel agencies
SELECT COUNT(*) AS TotalAgencies FROM TravelAgency;

-- Find the average age of passengers
SELECT AVG(Age) AS AverageAge FROM Passenger;

-- Find the oldest passenger's age
SELECT MAX(Age) AS OldestPassenger FROM Passenger;

-- Find the youngest passenger's age
SELECT MIN(Age) AS YoungestPassenger FROM Passenger;

# Group by and having:

-- Count the number of agencies by location
SELECT Location, COUNT(*) AS AgencyCount 
FROM TravelAgency 
GROUP BY Location;

-- Find locations with more than 1 travel agency
SELECT Location, COUNT(*) AS AgencyCount 
FROM TravelAgency 
GROUP BY Location 
HAVING COUNT(*) > 1;

 #Join queries;

-- Retrieve passenger details along with their associated travel agency
SELECT 
    Passenger.FullName, Passenger.Age, TravelAgency.AgencyName 
FROM 
    Passenger
JOIN 
    TravelAgency ON Passenger.AgencyID = TravelAgency.AgencyID;

-- Find passengers associated with travel agencies in 'USA'
SELECT 
    Passenger.FullName, TravelAgency.AgencyName, TravelAgency.Location 
FROM 
    Passenger
JOIN 
    TravelAgency ON Passenger.AgencyID = TravelAgency.AgencyID
WHERE 
    TravelAgency.Location LIKE '%USA%';
    
# Insert new records:

-- Insert a new travel agency
INSERT INTO TravelAgency (AgencyName, Location, ContactNumber, Email, EstablishedYear, ServicesOffered)
VALUES ('Adventure Explorers', 'Seattle, USA', '1239876543', 'info@adventureexplorers.com', 2022, 'Hiking, Camping');

select * from travelagency;

-- Insert a new passenger
INSERT INTO Passenger (FullName, Age, AgencyID)
VALUES ('Alice Cooper', 27, 1);

select * from passenger;

 #Update records:

-- Update the ContactNumber of a travel agency
UPDATE TravelAgency 
SET ContactNumber = '9998887776' 
WHERE AgencyID = 1;

-- Update the Age of a passenger
UPDATE Passenger 
SET Age = 29 
WHERE PassengerID = 1;

# Delete records:

-- Delete a travel agency by ID
DELETE FROM TravelAgency WHERE AgencyID = 50;

-- Delete a passenger by ID
DELETE FROM Passenger WHERE PassengerID = 20;

 # Use DISTINCT:

-- Get unique locations from TravelAgency
SELECT DISTINCT Location FROM TravelAgency;

-- Get unique passenger ages
SELECT DISTINCT Age FROM Passenger;


# Find records with null values :

-- Find passengers without an associated travel agency
SELECT * FROM Passenger WHERE AgencyID IS NULL;

-- Find travel agencies without a contact number
SELECT * FROM TravelAgency WHERE ContactNumber IS NULL;


 # Subqueries:

-- Find the names of passengers associated with the oldest travel agency
SELECT FullName 
FROM Passenger 
WHERE AgencyID = (SELECT AgencyID FROM TravelAgency ORDER BY EstablishedYear ASC LIMIT 1);

-- Find travel agencies with more passengers than the average passenger count per agency
SELECT * 
FROM TravelAgency 
WHERE AgencyID IN (
    SELECT AgencyID 
    FROM Passenger 
    GROUP BY AgencyID 
    HAVING COUNT(*) > (SELECT AVG(PassengerCount) 
                       FROM (SELECT COUNT(*) AS PassengerCount 
                             FROM Passenger 
                             GROUP BY AgencyID) AS Temp)
);

# Use LIMIT for pagination:

-- Get the first 5 travel agencies
SELECT * FROM TravelAgency LIMIT 5;

-- Get the next 5 passengers (pagination)
SELECT * FROM Passenger LIMIT 5 OFFSET 5;

#JOINS:

# Inner Join:

-- Get passenger details and their associated travel agency
SELECT 
    Passenger.FullName AS PassengerName,
    Passenger.Age,
    TravelAgency.AgencyName AS TravelAgencyName,
    TravelAgency.Location
FROM 
    Passenger
INNER JOIN 
    TravelAgency ON Passenger.AgencyID = TravelAgency.AgencyID;


# Left Join:

-- Get all passengers and their associated travel agency (if any)
SELECT 
    Passenger.FullName AS PassengerName,
    Passenger.Age,
    TravelAgency.AgencyName AS TravelAgencyName,
    TravelAgency.Location
FROM 
    Passenger
LEFT JOIN 
    TravelAgency ON Passenger.AgencyID = TravelAgency.AgencyID;


# Right Join:

-- Get all travel agencies and their associated passengers (if any)
SELECT 
    TravelAgency.AgencyName AS TravelAgencyName,
    TravelAgency.Location,
    Passenger.FullName AS PassengerName,
    Passenger.Age
FROM 
    Passenger
RIGHT JOIN 
    TravelAgency ON Passenger.AgencyID = TravelAgency.AgencyID;



# Self Join :

-- Find travel agencies in the same location
SELECT 
    A.AgencyName AS Agency1,
    B.AgencyName AS Agency2,
    A.Location
FROM 
    TravelAgency A
INNER JOIN 
    TravelAgency B ON A.Location = B.Location AND A.AgencyID <> B.AgencyID;


# ALTER QUERIES :

# Add a New Column

-- Add a column for the website URL to the TravelAgency table
ALTER TABLE TravelAgency ADD Website VARCHAR(255);

-- Add a column for PassportNumber to the Passenger table
ALTER TABLE Passenger ADD PassportNumber VARCHAR(50);

#Modify an Existing Column:

-- Change the data type of ContactNumber in TravelAgency to BIGINT
ALTER TABLE TravelAgency MODIFY ContactNumber BIGINT;

-- Change the data type of Age in Passenger to TINYINT
ALTER TABLE Passenger MODIFY Age TINYINT;

# Rename a Column:

-- Rename the column 'Email' to 'ContactEmail' in TravelAgency
ALTER TABLE TravelAgency CHANGE Email ContactEmail VARCHAR(100);

-- Rename the column 'FullName' to 'PassengerName' in Passenger
ALTER TABLE Passenger CHANGE FullName PassengerName VARCHAR(100);

# Rename the Table:

-- Rename the TravelAgency table to Agency
ALTER TABLE TravelAgency RENAME TO Agency;

-- Rename the Passenger table to Travelers
ALTER TABLE Passenger RENAME TO Travelers;

# Drop a Column:

-- Remove the ServicesOffered column from TravelAgency
ALTER TABLE TravelAgency DROP COLUMN ServicesOffered;

-- Remove the PassportNumber column from Passenger
ALTER TABLE Passenger DROP COLUMN PassportNumber;

#Add a Foreign Key:

-- Add a foreign key constraint to Passenger table if not already present
ALTER TABLE Passenger 
ADD CONSTRAINT fk_Agency 
FOREIGN KEY (AgencyID) REFERENCES TravelAgency(AgencyID);


# Add a Unique Constraint:

-- Ensure that AgencyName in TravelAgency is unique
ALTER TABLE TravelAgency ADD CONSTRAINT uq_AgencyName UNIQUE (AgencyName);

-- Ensure that PassportNumber in Passenger is unique
ALTER TABLE Passenger ADD CONSTRAINT uq_PassportNumber UNIQUE (PassportNumber);

 # Add a Primary Key:

-- Add a primary key to TravelAgency (if not already defined)
ALTER TABLE TravelAgency ADD CONSTRAINT pk_Agency PRIMARY KEY (AgencyID);

-- Add a primary key to Passenger (if not already defined)
ALTER TABLE Passenger ADD CONSTRAINT pk_Passenger PRIMARY KEY (PassengerID);

# Remove a Foreign Key:

-- Drop the foreign key from Passenger
ALTER TABLE Passenger DROP FOREIGN KEY fk_Agency;



# Add a Default Value:

-- Add a default value to EstablishedYear in TravelAgency
ALTER TABLE TravelAgency ALTER COLUMN EstablishedYear SET DEFAULT 2000;

-- Add a default value to Age in Passenger
ALTER TABLE Passenger ALTER COLUMN Age SET DEFAULT 18;

# Add or Remove an Index:

-- Add an index on Location in TravelAgency
ALTER TABLE TravelAgency ADD INDEX idx_Location (Location);

-- Remove the index from Location in TravelAgency
ALTER TABLE TravelAgency DROP INDEX idx_Location;

-- Add an index on Age in Passenger
ALTER TABLE Passenger ADD INDEX idx_Age (Age);

# Change Column Order:

-- Move the EstablishedYear column in TravelAgency to appear after Location
ALTER TABLE TravelAgency MODIFY EstablishedYear INT AFTER Location;

-- Move the Age column in Passenger to appear after FullName
ALTER TABLE Passenger MODIFY Age TINYINT AFTER FullName;























