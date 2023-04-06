-- Create the polling_system database
CREATE DATABASE polling_system;
GO

-- Use the polling_system database
USE polling_system;
GO

-- Create the voters table
CREATE TABLE voters (
    voter_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    has_voted INT NOT NULL
);

-- Create the admins table
CREATE TABLE admins (
    admin_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL
);

-- Create the polling_officers table
CREATE TABLE polling_officers (
    officer_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL
);

-- Create the candidates table
CREATE TABLE candidates (
    candidate_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    votes INT NOT NULL DEFAULT 0
);

BEGIN TRANSACTION;

-- Insert sample data into the voters table
INSERT INTO voters (username, password, has_voted) VALUES 
    ('Voter1', 'password', 0),
    ('Voter2', 'password', 0),
    ('Voter3', 'password', 1),
    ('Voter4', 'password', 0),
    ('Voter5', 'password', 0);

-- Insert sample data into the admins table
INSERT INTO admins (username, password) VALUES 
    ('Admin1', 'password'),
    ('Admin2', 'password'),
    ('Admin3', 'password');

-- Insert sample data into the polling_officers table
INSERT INTO polling_officers (username, password) VALUES 
    ('Officer1', 'password'),
    ('Officer2', 'password'),
    ('Officer3', 'password');

-- Insert sample data into the candidates table
INSERT INTO candidates (name, votes) VALUES 
    ('Candidate 1', 10),
    ('Candidate 2', 5),
    ('Candidate 3', 8),
    ('Candidate 4', 2);

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- Register a new voter
INSERT INTO voters (username, password, has_voted)
VALUES ('NewVoter', 'password', 0);

-- Update a voter's password
SAVE TRANSACTION VoterPassword;
UPDATE voters
SET password = 'newpassword'
WHERE username = 'NewVoter';

-- Update a polling officer's password
SAVE TRANSACTION OfficerPassword;
UPDATE polling_officers
SET password = 'newpassword'
WHERE username = 'Officer1';

-- Delete a voter from the voters table
SAVE TRANSACTION DeleteVoter;
DELETE FROM voters
WHERE username = 'Voter3';

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- Fetch the top 2 candidates with the highest votes
SELECT TOP 2 name, votes
FROM candidates
ORDER BY votes DESC;

-- Fetch the candidate with the least votes
SELECT TOP 1 name, votes
FROM candidates
ORDER BY votes ASC;

-- Fetch the candidates with voting record for each candidate
SELECT name, votes
FROM candidates;

-- Fetch the winner's name
SELECT TOP 1 name
FROM candidates
ORDER BY votes DESC;

COMMIT TRANSACTION;

BEGIN TRANSACTION;

-- Delete all records from the candidates table
DELETE FROM candidates;

COMMIT TRANSACTION;
