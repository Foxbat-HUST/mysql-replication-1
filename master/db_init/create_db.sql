CREATE DATABASE IF NOT EXISTS replication;
USE replication;
DROP TABLE IF EXISTS Persons;
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
