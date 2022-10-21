import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frc_scouting_app/Database/scouter_info_api.dart';
import 'package:frc_scouting_app/misc/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frc_scouting_app/views/big_screen_views/teams_info/team_data_class.dart';
import 'package:frc_scouting_app/views/common_views/divider_with_text.dart';

// Note: from here i start using responsive UI, and preferebly will use in all widgets

class QuickTeamData extends StatefulWidget {
  QuickTeamData({required this.teamNum});
  String teamNum;

  @override
  State<StatefulWidget> createState() => _QuickTeamDataState();
}

class _QuickTeamDataState extends State<QuickTeamData> {
  List<dynamic> robotInfo = [];

  @override
  void initState() {
    super.initState();
    unFutureGetRobotInfoWhereTeamNum(widget.teamNum);
    //print(robotInfo);
  }

  @override
  Widget build(BuildContext context) {
    String teamNum = widget.teamNum;
    
    return teamSelected(teamNum);
  }

  Widget teamSelected(String teamNum) {
    print(teamNum);

    return Container(
      color: backroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// # team name, num and last match num
          topBarTeamData(teamNum),
          DividerWithTitle(title: "Quick Data", color: secondaryColor)
          /// # quick data
          //quickData()
          /// # graphs and connected data
          
        ],
      ),
    );
  }
  
  topBarTeamData(String teamNum) {
    return Container(
      child: Text(teamNum,
        style: const TextStyle(
            fontSize: 28.0,
            color: Colors.white,
            fontFamily: 'vanguardian'))
    );
  }
  
  void unFutureGetRobotInfoWhereTeamNum(String teamNum) async{
    List<dynamic> data = await getRobotInfoWhereTeamNum(teamNum);
    // print(data);
    if (!mounted) return;
    setState(() => robotInfo = filterDataFromTeamInfo(data));
  }
  
  List<dynamic> filterDataFromTeamInfo(List<dynamic> data) {
    // print(jsonDecode(data.toString()));
    // List listData = jsonDecode(data.toString());
    List<dynamic> shownData = TeamData(teamDataJson: data).getTeamDataWhereMatchId(0);
    // print(shownData);
    return data;
  }
}
