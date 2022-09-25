import 'dart:convert';

import 'package:http/http.dart' as http;

void insertInfo(
  teamNum, 
  matchID,
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
  didHPScore, 
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
        "did_hp_score": "$didHPScore",
        "did_robot_defend": "$didRobotDefend",
        "defense_comments": "$defenseComments",
        "robot_comments": "$robotComments",
        "strategy_comments": "$strategyComments",
        "scouter_name": "$scouterName",
        "created_at": ""
      });
    // ignore: avoid_print
    } catch(err) {print('$err lol');}
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





