import 'dart:convert';

import 'package:http/http.dart' as http;

void insertInfo(
  teamNum,
  matchID,
  didWin,
  autoUpScored,
  autoUpMissed,
  autoLowScored,
  autoLowMissed,
  teleopUpScored,
  teleopUpMissed,
  teleopLowScored,
  teleopLowMissed,
  whereShotMostShots,
  shootingPrepTime,
  timeClimbingBeforeEnd,
  climbAttempLevel,
  climbLevel,
  fromWhereClimbed,
  alliance,
  startingPos,
  whereGatheredMostBalls,
  wasRobotOnField,
  didRobotWorkInAuto,
  didRobotWorkInTP,
  didHpScore,
  didRobotDefend,
  wasStrategyDifferent,
  defenseComments,
  robotComments,
  strategyComments,
  scouterName,
) async {
  try {
    final response = await http.post(
        Uri.parse("http://localhost/2230_scouting/insert_robot_info.php"),
        body: {
          "id": "",
          "match_id": "$matchID",
          "team_number": "$teamNum",
          "did_win": "$didWin",
          "alliance": "$alliance",
          "auto_up_scored": "$autoUpScored",
          "auto_up_missed": "$autoUpMissed",
          "auto_low_scored": "$autoLowScored",
          "auto_low_missed": "$autoLowMissed",
          "teleop_up_scored": "$teleopUpScored",
          "teleop_up_missed": "$teleopUpMissed",
          "teleop_low_scored": "$teleopLowScored",
          "teleop_low_missed": "$teleopLowMissed",
          "where_shot_most_shots": "$whereShotMostShots",
          "shooting_prep_time": "$shootingPrepTime",
          "time_climbing_before_end": "$timeClimbingBeforeEnd",
          "climb_attemp_level": "$climbAttempLevel",
          "climb_level": "$climbLevel",
          "from_where_climbed": "$fromWhereClimbed",
          "starting_position": "$startingPos",
          "where_gathered_most_balls":
              "$whereGatheredMostBalls", // TODO: change this type of saving into a more efficient one, e.g. 1 = ground, 2 = HP...
          "was_robot_on_field": "$wasRobotOnField",
          "did_robot_work_in_auto": "$didRobotWorkInAuto",
          "did_robot_work_in_teleop": "$didRobotWorkInTP",
          "did_hp_score": "$didHpScore",
          "did_robot_defend": "$didRobotDefend",
          "was_strategy_different": "$wasStrategyDifferent",
          "defense_comments": "$defenseComments",
          "robot_comments": "$robotComments",
          "strategy_comments": "$strategyComments",
          "scouter_name": "$scouterName",
          "created_at": ""
        });
    print("${response.body.toString()}");
  } catch (err) {
    print('$err lol');
  }

  // List<dynamic> whatAllianceWon = await getWonAllianceFromMatchInfo(matchID);
  // print("$whatAllianceWon");
  // if(whatAllianceWon.toString().contains("OM")) {
  //   updateAllianceWonFromMatchInfo(matchID);
  // }
}

void insertMatchInfo(String competition, String match_number, String match_type,
    List<String> teams) async {
  try {
    final response = await http.post(
        Uri.parse("http://localhost/2230_scouting/insert_match_data.php"),
        body: {
          "id": "",
          "competition": competition,
          "match_number": match_number,
          "match_type": match_type,
          "won_alliance": "OM",
          "r1_robot": teams[0],
          "r2_robot": teams[1],
          "r3_robot": teams[2],
          "b1_robot": teams[3],
          "b2_robot": teams[4],
          "b3_robot": teams[5],
          "created_at": ""
        });
    print("${response.body.toString()}");
  } catch (err) {
    print('$err lol');
  }
}

Future<List<dynamic>> getMatchInfo() async {
  var jsonData = [];

  try {
    final response = await http
        .get(Uri.parse("http://127.0.0.1/2230_scouting/get_match_info.php"));
    jsonData = jsonDecode(response.body) as List;
  } catch (err) {
    print('$err lol');
  }

  return jsonData;
}

Future<List<dynamic>> getMatchIdFromRobotInfo() async {
  var jsonData = [];

  try {
    final response = await http.get(Uri.parse(
        "http://127.0.0.1/2230_scouting/get_match_id_from_robot_info.php"));
    jsonData = jsonDecode(response.body) as List;
  } catch (err) {
    print('$err lol');
  }

  return jsonData;
}

Future<List<dynamic>> getWonAllianceFromMatchInfo(String id) async {
  var jsonData = [];

  try {
    final response = await http.get(Uri.parse(
        "http://127.0.0.1/2230_scouting/get_won_alliance_from_match_info.php?id=$id"));
    jsonData = jsonDecode(response.body) as List;
  } catch (err) {
    print('$err lol');
  }

  return jsonData;
} 

// Future<List<dynamic>> updateAllianceWonFromMatchInfo(String id) async{
//   try{
//     final response = await http.post("")
//   }

// }

Future<List<dynamic>> getRobotInfoWhereId(String id) async {
  var jsonData = [];

  try {
    final response = await http.get(Uri.parse(
        "http://127.0.0.1/2230_scouting/get_won_alliance_from_match_info.php?id=$id"));
    jsonData = jsonDecode(response.body) as List;
  } catch (err) {
    print('$err lol');
  }

  return jsonData;
} 


Future<List<dynamic>> getRobotInfoWhereTeamNum(String teamNum) async {
  var jsonData = [];

  try {
    final response = await http.get(Uri.parse(
        "http://127.0.0.1/2230_scouting/get_robot_info_where_team_number.php?teamNum=$teamNum"));
    jsonData = jsonDecode(response.body) as List;
  } catch (err) {
    print('$err lol');
  }

  return jsonData;
} 








