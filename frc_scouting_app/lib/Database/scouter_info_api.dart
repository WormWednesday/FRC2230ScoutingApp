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
  ) async{
    try{
      final response = await http.post(Uri.parse("http://127.0.0.1/2230_scouting/insert_robot_info.php"), body: {
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
        "where_gathered_most_balls": "$whereGatheredMostBalls",
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
    // ignore: avoid_print
    } catch(err) {print('$err lol');}
    
    List<dynamic> whatAllianceWon = await getWonAllianceFromMatchInfo(matchID);
    print("$whatAllianceWon");
    if(whatAllianceWon.toString().contains("OM")) {
      updateAllianceWonFromMatchInfo(matchID);
    }
}

Future<List<dynamic>> getMatchInfo() async{
  var jsonData = [];

  try{
    final response = await http.get(Uri.parse("http://127.0.0.1/2230_scouting/get_match_info.php"));
    jsonData = jsonDecode(response.body) as List;
  } catch(err) {print('$err lol');}

  return jsonData;
} 

Future<List<dynamic>> getMatchIdFromRobotInfo() async{
  var jsonData = [];

  try{
    final response = await http.get(Uri.parse("http://127.0.0.1/2230_scouting/get_match_id_from_robot_info.php"));
    jsonData = jsonDecode(response.body) as List;
  } catch(err) {print('$err lol');}

  return jsonData;
} 

Future<List<dynamic>> getWonAllianceFromMatchInfo(String id) async{
  var jsonData = [];

  try{
    final response = await http.get(Uri.parse("http://127.0.0.1/2230_scouting/get_won_alliance_from_match_info.php?id=$id"));
    jsonData = jsonDecode(response.body) as List;
  } catch(err) {print('$err lol');}

  return jsonData;
} 

Future<List<dynamic>> updateAllianceWonFromMatchInfo(String id) async{
  try{
    final response = await http.post("")
  }

}








