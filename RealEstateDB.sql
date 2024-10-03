-- PROPERTY table: Stores information about properties
CREATE TABLE PROPERTY (
    property_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    listing_number VARCHAR(13) UNIQUE,
    listing_date DATE
);

-- AGENT table: Stores information about real estate agents
CREATE TABLE AGENT (
    agent_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE
);

-- CLIENT table: Stores information about clients who can rent or buy properties
CREATE TABLE CLIENT (
    client_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    registration_date DATE
);

-- PROPERTY_AGENT table: Junction table for many-to-many relationship between PROPERTY and AGENT
-- This allows a property to be managed by multiple agents and an agent to manage multiple properties
CREATE TABLE PROPERTY_AGENT (
    property_id INT,
    agent_id INT,
    PRIMARY KEY (property_id, agent_id),
    FOREIGN KEY (property_id) REFERENCES PROPERTY(property_id),
    FOREIGN KEY (agent_id) REFERENCES AGENT(agent_id)
);

-- PROPERTY_CLIENT table: Junction table for many-to-many relationship between PROPERTY and CLIENT
-- This tracks which properties are rented or bought by which clients and when
CREATE TABLE PROPERTY_CLIENT (
    property_id INT,
    client_id INT,
    transaction_date DATE,
    PRIMARY KEY (property_id, client_id, transaction_date),
    FOREIGN KEY (property_id) REFERENCES PROPERTY(property_id),
    FOREIGN KEY (client_id) REFERENCES CLIENT(client_id)
);


-- Insert data into PROPERTY table with TO_DATE for date formatting
INSERT INTO PROPERTY (property_id, title, listing_number, listing_date)
VALUES (1, 'Luxury Apartment', 'LN12345678901', TO_DATE('2024-01-15', 'YYYY-MM-DD'));

INSERT INTO PROPERTY (property_id, title, listing_number, listing_date)
VALUES (2, 'Beachfront Villa', 'LN12345678902', TO_DATE('2024-02-22', 'YYYY-MM-DD'));

INSERT INTO PROPERTY (property_id, title, listing_number, listing_date)
VALUES (3, 'Downtown Office', 'LN12345678903', TO_DATE('2024-03-10', 'YYYY-MM-DD'));

-- Insert data into AGENT table
INSERT INTO AGENT (agent_id, name, birth_date)
VALUES (1, 'John Doe', TO_DATE('1985-08-24', 'YYYY-MM-DD'));

INSERT INTO AGENT (agent_id, name, birth_date)
VALUES (2, 'Jane Smith', TO_DATE('1990-12-05', 'YYYY-MM-DD'));

INSERT INTO AGENT (agent_id, name, birth_date)
VALUES (3, 'Emily Johnson', TO_DATE('1993-03-18', 'YYYY-MM-DD'));

-- Insert data into CLIENT table with TO_DATE for date formatting
INSERT INTO CLIENT (client_id, name, email, registration_date)
VALUES (1, 'Alice Brown', 'alice.brown@email.com', TO_DATE('2023-06-01', 'YYYY-MM-DD'));

INSERT INTO CLIENT (client_id, name, email, registration_date)
VALUES (2, 'Bob White', 'bob.white@email.com', TO_DATE('2023-07-15', 'YYYY-MM-DD'));

INSERT INTO CLIENT (client_id, name, email, registration_date)
VALUES (3, 'Charlie Green', 'charlie.green@email.com', TO_DATE('2023-08-30', 'YYYY-MM-DD'));



-- Insert data into PROPERTY_AGENT table (Property-Agents relationships)
INSERT INTO PROPERTY_AGENT (property_id, agent_id)
VALUES (1, 1); -- Luxury Apartment managed by John Doe

INSERT INTO PROPERTY_AGENT (property_id, agent_id)
VALUES (2, 2); -- Beachfront Villa managed by Jane Smith

INSERT INTO PROPERTY_AGENT (property_id, agent_id)
VALUES (3, 3); -- Downtown Office managed by Emily Johnson

INSERT INTO PROPERTY_AGENT (property_id, agent_id)
VALUES (1, 2); -- Luxury Apartment also managed by Jane Smith

INSERT INTO PROPERTY_AGENT (property_id, agent_id)
VALUES (2, 1); -- Beachfront Villa also managed by John Doe


-- Insert data into PROPERTY_CLIENT table with TO_DATE for date formatting (Property-Clients relationships)
INSERT INTO PROPERTY_CLIENT (property_id, client_id, transaction_date)
VALUES (1, 1, TO_DATE('2024-04-01', 'YYYY-MM-DD')); -- Alice Brown rented Luxury Apartment

INSERT INTO PROPERTY_CLIENT (property_id, client_id, transaction_date)
VALUES (2, 2, TO_DATE('2024-05-15', 'YYYY-MM-DD')); -- Bob White bought Beachfront Villa

INSERT INTO PROPERTY_CLIENT (property_id, client_id, transaction_date)
VALUES (3, 3, TO_DATE('2024-06-20', 'YYYY-MM-DD')); -- Charlie Green rented Downtown Office





-- Update data
-- Modifying the title of a property
UPDATE PROPERTY 
SET title = 'Downtown Apartment (Renovated)' 
WHERE property_id = 1;



-- Delete data
-- Removing a property transaction record
DELETE FROM PROPERTY_CLIENT 
WHERE property_id = 1 AND client_id = 1;


-- Select data with join
-- This query retrieves property titles, agent names, client names, and transaction dates
SELECT p.title, a.name AS agent_name, c.name AS client_name, pc.transaction_date
FROM PROPERTY p
JOIN PROPERTY_AGENT pa ON p.property_id = pa.property_id
JOIN AGENT a ON pa.agent_id = a.agent_id
LEFT JOIN PROPERTY_CLIENT pc ON p.property_id = pc.property_id
LEFT JOIN CLIENT c ON pc.client_id = c.client_id;




-- Subquery example
-- This query finds all properties that are currently listed (not yet transacted)
SELECT title
FROM PROPERTY
WHERE property_id NOT IN (
    SELECT property_id
    FROM PROPERTY_CLIENT
);



-- DCL: Grant select permission on PROPERTY table to a user
GRANT SELECT ON PROPERTY TO C##NAGZ;



-- TCL: Start a transaction, insert a new property, and commit

BEGIN
    INSERT INTO PROPERTY (property_id, title, listing_number, listing_date) 
    VALUES (4, 'Mountain Cabin', 'LIST1122334455', TO_DATE('2023-05-05', 'YYYY-MM-DD'));
    COMMIT;
END;

