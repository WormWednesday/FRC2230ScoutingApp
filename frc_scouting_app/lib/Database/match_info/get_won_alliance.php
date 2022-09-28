<?php
$serverName = 'localhost';
$username = 'root';
$password = '';
$dbName = '2230_scouting_data';

$conn = new mysqli($serverName, $username, $password, $dbName);
if($conn->connect_error){
    die('Connection failed: ' . $conn->connect_error);
}

$id = $_GET['id'];

$sql = "SELECT what_alliance_won FROM match_info WHERE id = '$id'";
$result = $conn->query($sql);
$response = array();
if($result->num_rows > 0){
    while($row = $result->fetch_assoc()){
        array_push($response, $row);
    }
}

$conn->close();
header('Content-Type: application/json');
echo json_encode($response);
?>