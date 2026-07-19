<?php
$servername = "localhost";
$username = "student1";
$password = "pass";
$dbname = "CSD430";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO abram_movies_data (Title, Year, Studio, Director, Genre) VALUES
('Reservoir Dogs', 1992, 'Miramax', 'Quentin Tarantino', 'Crime'),
('Pulp Fiction', 1994, 'Miramax', 'Quentin Tarantino', 'Crime'),
('Jackie Brown', 1997, 'Miramax Films', 'Quentin Tarantino', 'Crime'),
('Kill Bill: Volume 1', 2003, 'Miramax Films', 'Quentin Tarantino', 'Crime'),
('Kill Bill: Volume 2', 2004, 'Miramax Films', 'Quentin Tarantino', 'Crime'),
('Death Proof', 2007, 'The Weinstein Company', 'Quentin Tarantino', 'Crime'),
('Inglourious Basterds', 2009, 'The Weinstein Company / Universal Pictures', 'Quentin Tarantino', 'Crime'),
('Django Unchained', 2012, 'The Weinstein Company / Sony Pictures Releasing', 'Quentin Tarantino', 'Crime'),
('The Hateful Eight', 2015, 'The Weinstein Company', 'Quentin Tarantino', 'Crime'),
('Once Upon a Time... in Hollywood', 2019, 'Sony Pictures Releasing', 'Quentin Tarantino', 'Crime')";

if ($conn->query($sql) === TRUE) {
    echo "Records populated successfully.";
} else {
    echo "Error: " . $conn->error;
}
$conn->close();
?>