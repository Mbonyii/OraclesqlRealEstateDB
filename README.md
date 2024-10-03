# Real Estate Management Database

## Overview

The Real Estate Management Database is a SQL-based system designed to efficiently manage real estate properties, agents, clients, and their interactions. It provides a structure to track property listings, assign agents to properties, and record property transactions with clients. By establishing relationships between these entities, the system simplifies property management, enabling seamless data retrieval and maintenance.

## Database Schema

The database consists of several core tables that store essential data about properties, agents, and clients. Additionally, junction tables establish the many-to-many relationships between properties and agents, as well as between properties and clients.

### Core Tables

1. **PROPERTY**: This table stores key details about each property in the system, including the title, listing number, and the date the property was listed. Each property has a unique identifier (property_id), ensuring that every record is distinct. 

2. **AGENT**: This table stores information about the real estate agents managing the properties. Each agent is identified by a unique agent_id, and their name and birth date are recorded to facilitate agent tracking.

3. **CLIENT**: This table captures data about clients who are interested in renting or purchasing properties. Every client is assigned a unique client_id. Additional information such as the client’s name, email, and registration date helps to identify and communicate with clients.

![Reference](/SqlImage/image1.png)

### Junction Tables

1. **PROPERTY_AGENT**: This table establishes a many-to-many relationship between properties and agents. Each property can be managed by multiple agents, and an agent can manage several properties. The table links properties and agents through their respective unique identifiers (property_id and agent_id). 

2. **PROPERTY_CLIENT**: This table tracks transactions between clients and properties. It records when a client rents or purchases a property and includes the property_id, client_id, and transaction date. This setup allows multiple clients to engage with different properties over time, and each transaction is uniquely identified by a combination of these attributes.
![Reference](/SqlImage/Image2.png)


You can place the **ER Diagram** paragraph right after the **Database Schema** section, just before the **Key Features** section. This will provide a natural flow, where readers first get an overview of the schema and then see how the entities are related visually before moving on to the specific features of the database.

Here’s how you can integrate it:

---

## ER Diagram

The **Entity-Relationship (ER) Diagram** visually represents the structure and relationships between the key entities in the database: **PROPERTY**, **AGENT**, and **CLIENT**. The diagram illustrates the many-to-many relationships between properties and agents, as well as properties and clients, which are managed through the **PROPERTY_AGENT** and **PROPERTY_CLIENT** junction tables. These relationships are established using foreign keys, ensuring data consistency and referential integrity. The diagram serves as a blueprint for understanding how these entities interact and ensures that data flows efficiently within the real estate management system.

---

By adding it here, the paragraph complements the database schema and provides context for readers to better grasp the relationships in the system.

![Reference](/SqlImage/er.png)

## Key Features

### Many-to-Many Relationships

The system supports many-to-many relationships between properties and agents as well as properties and clients. These relationships are managed through the junction tables, ensuring that properties can have multiple agents or clients, and agents can handle multiple properties. This flexible structure accommodates the complexities of real estate management.

### Transaction Tracking

The database keeps detailed records of property transactions, allowing the system to track when a client rents or buys a property. The transaction date is recorded alongside the client and property details, making it easy to monitor historical transactions and generate reports.

### Data Integrity

Referential integrity is maintained throughout the system using foreign key constraints. These constraints ensure that any data entered into the junction tables is valid, meaning that agents, clients, and properties must exist in their respective tables before they can be linked in a transaction or relationship. This reduces the likelihood of errors or inconsistencies in the data.

## Demonstrated SQL Operations

The system demonstrates various SQL operations, including:

- **Inserting Data**: The system allows for the insertion of new properties, agents, and clients, as well as records linking agents to properties and clients to transactions.
  
- **Updating Data**: Property details, such as the title or listing status, can be updated as needed. This ensures that the system stays current with property renovations or changes in the market.

- **Deleting Records**: Transaction records can be deleted, for example, when a rental agreement ends, or a purchase is finalized. This keeps the database clean and relevant.

- **Joining Data**: Through SQL joins, users can retrieve comprehensive information, such as which properties are managed by a specific agent, or which clients have transacted with a particular property.

- **Subqueries**: Subqueries are used to filter or find specific data, such as properties that are still available and have not been transacted.

![Reference](/SqlImage/Image3.png)
![Reference](/SqlImage/Image4.png)
![Reference](/SqlImage/Update&Delete%20image.png)
![Reference](/SqlImage/Image5.png)


### Transaction Management

The system supports transaction handling with SQL commands like `BEGIN` and `COMMIT`. This ensures that operations involving multiple data changes, such as inserting a new property and linking it to an agent, are processed safely and efficiently. The use of transactions ensures data integrity by preventing partial updates if an error occurs during an operation.


### Data Control Language (DCL)

The project also demonstrates how to control access to the database using DCL commands. For example, it shows how to grant read-only access to certain tables, allowing users to query property information without being able to modify the data.

## Technical Notes

- The system uses a consistent date format (`YYYY-MM-DD`) for recording dates, such as property listings and transaction dates.
- Foreign keys are implemented to ensure referential integrity between related tables. This prevents invalid data from being inserted, such as linking a non-existent agent or client to a property.
- Transactions are handled using `BEGIN` and `COMMIT` statements to ensure that multiple data changes are treated as a single operation. This guarantees that either all changes are applied, or none are, in the case of an error.

 ## **Here is the DCL** & **TCL** Sql queries
![Reference](/SqlImage/Image6.png)




## Conclusion

The Real Estate Management Database provides a robust framework for managing real estate data, including properties, agents, and clients. With its many-to-many relationships, transaction tracking, and data integrity features, this system is both flexible and reliable, supporting a wide range of real estate management activities."# OraclesqlRealEstateDB" 
