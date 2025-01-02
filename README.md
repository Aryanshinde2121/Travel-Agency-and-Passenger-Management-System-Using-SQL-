# Travel-Agency-and-Passenger-Management-System-Using-SQL-
SQL (MySQL)


Title:
Travel Agency and Passenger Management System

About:
This SQL project demonstrates a structured database implementation using MySQL for managing travel agencies and their associated passengers. The schema includes the creation of tables, relationships, and sample data for the effective organization of travel-related information.

Key Features:
1. Database Initialization:
•	- Creates a database named 'project2' and switches to it.
2. Table Structures:
•	- TravelAgency:
  - Attributes: AgencyID, AgencyName, Location, ContactNumber, Email, EstablishedYear, ServicesOffered.
  - Primary key: AgencyID.
•	- Passenger:
  - Attributes: PassengerID, FullName, Age, AgencyID.
  - Relationships: Foreign key (AgencyID) links passengers to their respective travel agencies.
3. Sample Data:
•	- Populates 'TravelAgency' with details of travel agencies (e.g., agency name, location, contact, services offered).
•	- Populates 'Passenger' with information about passengers, including their association with travel agencies.
4. Data Relationships:
•	- Implements referential integrity with a foreign key linking passengers to travel agencies, ensuring meaningful data connections.

Conclusion:
The project provides a foundational database system for managing travel agency operations and their clients. It effectively utilizes normalization principles, maintaining clear relationships between entities and ensuring data integrity. The structure can be expanded to include additional tables or features such as booking management, payments, and travel itineraries for more comprehensive functionality.
