<?php

function sendJsonResponse($response)
{
    header('Content-Type: application/json');
    echo json_encode($response);
}


if(!isset($_POST)) {
    $response = array('status' => 'failed :(', 'data' => null);
    sendJsonResponse($response);
    die();
}


$serverName = 'localhost';
$username = 'root';
$password = '';
$dbName = '2230_scouting_data';

$conn = new mysqli($serverName, $username, $password, $dbName);
if($conn->connect_error){
    die('Connection failed: ' . $conn->connect_error);
}

$competition = $_POST['competition'];
$matchNumber = $_POST['match_number'];
$matchType = $_POST['match_type'];
$wonAlliance = $_POST['won_alliance'];
$r1Robot = $_POST['r1_robot'];
$r2Robot = $_POST['r2_robot'];
$r3Robot = $_POST['r3_robot'];
$b1Robot = $_POST['b1_robot'];
$b2Robot = $_POST['b2_robot'];
$b3Robot = $_POST['b3_robot'];



$sqlinsert = "INSERT INTO `match_info`(
    `id`, 
    `competition`, 
    `match_number`, 
    `match_type`, 
    `wonAlliance`, 
    `r1_robot`, 
    `r2_robot`, 
    `r3_robot`, 
    `b1_robot`, 
    `b2_robot`, 
    `b3_robot`, 
    `created_at`
    ) VALUES (
    DEFAULT,
    '$competition'
    '$matchNumber'
    '$matchType'
    '$wonAlliance'
    '$r1Robot'
    '$r2Robot'
    '$r3Robot'
    '$b1Robot'
    '$b2Robot'
    '$b3Robot'
    DEFAULT
  )";
echo($sqlinsert); 

if($conn->query($sqlinsert) === TRUE) {
    $response = array('status' => 'success :)', 'data' => null);
    //echo($response);
    sendJsonResponse($response);

}
else {
    $response = array('status' => 'failed :(', 'data' => null);
    echo($response);
    sendJsonResponse($response);
}
?>
