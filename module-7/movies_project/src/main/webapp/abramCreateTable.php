<?php
$servername = "localhost";
$username = "student1";
$password = "pass";
$dbname = "CSD430";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// SQL to create the table
$sql = "CREATE TABLE IF NOT EXISTS abram_movies_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Year INT,
    Studio VARCHAR(100),
    Director VARCHAR(100),
    Genre VARCHAR(50)
)";

if ($conn->query($sql) === TRUE) {
    echo "Table abram_movies_data is ready.";
} else {
    echo "Error: " . $conn->error;
}
$conn->close();
?>