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


$serverName = '127.0.0.1';
$username = 'root';
$password = '';
$dbName = 'scouting_app_db';

$conn = new mysqli($serverName, $username, $password, $dbName);
if($conn->connect_error){
    die('Connection failed: ' . $conn->connect_error);
}

if(isset($teamNumber) ) {
    
$teamNumber = $_POST['teamNumber'];
$teamName = $_POST['teamName'];
$autoUpShoot = $_POST['autoUpShoot'];
$autoUpScored = $_POST['autoUpScored'];
$autoLowShoot = $_POST['autoLowShoot'];
$autoLowScored = $_POST['autoLowScored'];
$teleopUpShoot = $_POST['teleopUpShoot'];
$teleopUpScored = $_POST['teleopUpScored'];
$teleopLowShoot = $_POST['teleopLowShoot'];
$teleopLowScored = $_POST['teleopLowScored'];
$whereShotMostShots = $_POST['whereShotMostShots'];
$shootingPrepTime = $_POST['shootingPrepTime'];
$timeClimbingBeforeEnd = $_POST['timeClimbingBeforeEnd'];
$climbAttempLevel = $_POST['climbAttempLevel'];
$climbLevel = $_POST['climbLevel'];
$fromWhereClimbed = $_POST['fromWhereClimbed'];
$startingPos = $_POST['startingPos'];
$whereGatheredMostBalls = $_POST['whereGatheredMostBalls'];
$wasRobotOnField = $_POST['wasRobotOnField'];
$didRobotWorkInAuto = $_POST['didRobotWorkInAuto'];
$didRobotWorkInTP = $_POST['didRobotWorkInTP'];
$didHpScore = $_POST['didHpScore'];
$didDefend = $_POST['didDefend'];
$defenseComments = $_POST['defenseComments'];
$robotComments = $_POST['robotComments'];
$competition = $_POST['competition'];
$matchType = $_POST['matchType'];
$matchNumber = $_POST['matchNumber'];
$scouterName = $_POST['scouterName'];
}

$sqlinsert = "INSERT INTO 'scouting_match_info'(
    'teamNumber', 
    'teamName', 
    'autoUpShoot', 
    'autoUpScored', 
    'autoLowShoot', 
    'autoLowScored', 
    'teleopUpShoot', 
    'teleopUpScored',
    'teleopLowShoot',
    'teleopLowScored',
    'whereShotMostShots',
    'shootingPrepTime',
    'timeClimbingBeforeEnd',
    'climbAttempLevel',
    'climbLevel',
    'fromWhereClimbed',
    'startingPos',
    'whereGatheredMostBalls',
    'wasRobotOnField',
    'didRobotWorkInAuto',
    'didRobotWork',
    'didHpScore',
    'didDefend',
    'defenseComments',
    'robotComments',
    'competition',
    'matchType',
    'matchNumber',
    'scouterName'
    ) VALUES (
        'teamNumber', 
    '$teamName', 
    '$autoUpShoot', 
    '$autoUpScored', 
    '$autoLowShoot', 
    '$autoLowScored', 
    '$teleopUpShoot', 
    '$teleopUpScored',
    '$teleopLowShoot',
    '$teleopLowScored',
    '$whereShotMostShots',
    '$shootingPrepTime',
    '$timeClimbingBeforeEnd',
    '$climbAttempLevel',
    '$climbLevel',
    '$fromWhereClimbed',
    '$startingPos',
    '$whereGatheredMostBalls',
    '$wasRobotOnField',
    '$didRobotWorkInAuto',
    '$didRobotWork',
    '$didHpScore',
    '$didDefend',
    '$defenseComments',
    '$robotComments',
    '$competition',
    '$matchType',
    '$matchNumber',
    '$scouterName'
    )";
if($conn->query($sqlinsert) === TRUE) {
    $response = array('status' => 'success :)', 'data' => null);
    sendJsonResponse($response);
}
else {
    $response = array('status' => 'failed :(', 'data' => null);
    sendJsonResponse($response);
}
?>