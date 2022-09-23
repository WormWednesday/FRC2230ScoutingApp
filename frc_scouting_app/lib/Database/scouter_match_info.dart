// // To parse this JSON data, do
// //
// //     final scouterMatchInfo = scouterMatchInfoFromJson(jsonString);

// import 'dart:convert';

// <ScouterMatchInfo> scouterMatchInfoFromJson(String str) => List<ScouterMatchInfo>.from(json.decode(str).map((x) => ScouterMatchInfo.fromJson(x)));

// String scouterMatchInfoToJson(List<ScouterMatchInfo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ScouterMatchInfo {
//     ScouterMatchInfo({
//         required this.id,
//         required this.teamNumber,
//         required this.teamName,
//         required this.autoUpShoot,
//         required this.autoUpScored,
//         required this.autoLowShoot,
//         required this.autoLowScored,
//         required this.teleopUpShoot,
//         required this.teleopUpScored,
//         required this.teleopLowShoot,
//         required this.teleopLowScored,
//         required this.whereShotMostShots,
//         required this.shootingPrepTime,
//         required this.timeClimbingBeforeEnd,
//         required this.climbAttempLevel,
//         required this.climbLevel,
//         required this.fromWhereClimbed,
//         required this.startingPos,
//         required this.whereGatheredMostBalls,
//         required this.wasRobotOnField,
//         required this.didRobotWorkInAuto,
//         required this.didRobotWorkInTp,
//         required this.didHpScore,
//         required this.didDefend,
//         required this.defenseComments,
//         required this.robotComments,
//         required this.competition,
//         required this.matchType,
//         required this.matchNumber,
//         required this.scouterName,
//         required this.createdAt,
//     });

//     String id;
//     String teamNumber;
//     String teamName;
//     String autoUpShoot;
//     String autoUpScored;
//     String autoLowShoot;
//     String autoLowScored;
//     String teleopUpShoot;
//     String teleopUpScored;
//     String teleopLowShoot;
//     String teleopLowScored;
//     String whereShotMostShots;
//     String shootingPrepTime;
//     String timeClimbingBeforeEnd;
//     String climbAttempLevel;
//     String climbLevel;
//     String fromWhereClimbed;
//     String startingPos;
//     String whereGatheredMostBalls;
//     String wasRobotOnField;
//     String didRobotWorkInAuto;
//     String didRobotWorkInTp;
//     String didHpScore;
//     String didDefend;
//     String defenseComments;
//     String robotComments;
//     String competition;
//     String matchType;
//     String matchNumber;
//     String scouterName;
//     DateTime createdAt;

//     factory ScouterMatchInfo.fromJson(Map<String, dynamic> json) => ScouterMatchInfo(
//         id: json["id"],
//         teamNumber: json["teamNumber"],
//         teamName: json["TeamName"],
//         autoUpShoot: json["autoUpShoot"],
//         autoUpScored: json["autoUpScored"],
//         autoLowShoot: json["autoLowShoot"],
//         autoLowScored: json["autoLowScored"],
//         teleopUpShoot: json["teleopUpShoot"],
//         teleopUpScored: json["teleopUpScored"],
//         teleopLowShoot: json["teleopLowShoot"],
//         teleopLowScored: json["teleopLowScored"],
//         whereShotMostShots: json["whereShotMostShots"],
//         shootingPrepTime: json["shootingPrepTime"],
//         timeClimbingBeforeEnd: json["timeClimbingBeforeEnd"],
//         climbAttempLevel: json["climbAttempLevel"],
//         climbLevel: json["climbLevel"],
//         fromWhereClimbed: json["fromWhereClimbed"],
//         startingPos: json["startingPos"],
//         whereGatheredMostBalls: json["whereGatheredMostBalls"],
//         wasRobotOnField: json["wasRobotOnField"],
//         didRobotWorkInAuto: json["didRobotWorkInAuto"],
//         didRobotWorkInTp: json["didRobotWorkInTP"],
//         didHpScore: json["didHpScore"],
//         didDefend: json["didDefend"],
//         defenseComments: json["defenseComments"],
//         robotComments: json["robotComments"],
//         competition: json["competition"],
//         matchType: json["matchType"],
//         matchNumber: json["matchNumber"],
//         scouterName: json["scouterName"],
//         createdAt: DateTime.parse(json["createdAt"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "teamNumber": teamNumber,
//         "TeamName": teamName,
//         "autoUpShoot": autoUpShoot,
//         "autoUpScored": autoUpScored,
//         "autoLowShoot": autoLowShoot,
//         "autoLowScored": autoLowScored,
//         "teleopUpShoot": teleopUpShoot,
//         "teleopUpScored": teleopUpScored,
//         "teleopLowShoot": teleopLowShoot,
//         "teleopLowScored": teleopLowScored,
//         "whereShotMostShots": whereShotMostShots,
//         "shootingPrepTime": shootingPrepTime,
//         "timeClimbingBeforeEnd": timeClimbingBeforeEnd,
//         "climbAttempLevel": climbAttempLevel,
//         "climbLevel": climbLevel,
//         "fromWhereClimbed": fromWhereClimbed,
//         "startingPos": startingPos,
//         "whereGatheredMostBalls": whereGatheredMostBalls,
//         "wasRobotOnField": wasRobotOnField,
//         "didRobotWorkInAuto": didRobotWorkInAuto,
//         "didRobotWorkInTP": didRobotWorkInTp,
//         "didHpScore": didHpScore,
//         "didDefend": didDefend,
//         "defenseComments": defenseComments,
//         "robotComments": robotComments,
//         "competition": competition,
//         "matchType": matchType,
//         "matchNumber": matchNumber,
//         "scouterName": scouterName,
//         "createdAt": createdAt.toIso8601String(),
//     };
// }
