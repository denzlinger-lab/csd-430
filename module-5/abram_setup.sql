-- Create the database
CREATE DATABASE IF NOT EXISTS CSD430;
USE CSD430;

-- Drop the table if it exists to ensure a clean slate
DROP TABLE IF EXISTS abram_movies_data;

-- Create the table structure
CREATE TABLE abram_movies_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Year INT,
    Studio VARCHAR(100),
    Director VARCHAR(100),
    Genre VARCHAR(50)
);

-- Insert the 10 records
INSERT INTO abram_movies_data (Title, Year, Studio, Director, Genre) VALUES
('Reservoir Dogs', 1992, 'Miramax', 'Quentin Tarantino', 'Crime'),
('Pulp Fiction', 1994, 'Miramax', 'Quentin Tarantino', 'Crime'),
('Jackie Brown', 1997, 'Miramax Films', 'Quentin Tarantino', 'Crime'),
('Kill Bill: Volume 1', 2003, 'Miramax Films', 'Quentin Tarantino', 'Crime'),
('Kill Bill: Volume 2', 2004, 'Miramax Films', 'Quentin Tarantino', 'Crime'),
('Death Proof', 2007, 'The Weinstein Company', 'Quentin Tarantino', 'Crime'),
('Inglourious Basterds', 2009, 'The Weinstein Company / Universal Pictures', 'Quentin Tarantino', 'Crime'),
('Django Unchained', 2012, 'The Weinstein Company / Sony Pictures Releasing', 'Quentin Tarantino', 'Crime'),
('The Hateful Eight', 2015, 'The Weinstein Company', 'Quentin Tarantino', 'Crime'),
('Once Upon a Time... in Hollywood', 2019, 'Sony Pictures Releasing', 'Quentin Tarantino', 'Crime');