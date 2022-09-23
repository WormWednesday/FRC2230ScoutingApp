import 'package:flutter/material.dart';
import 'package:frc_scouting_app/misc/constants.dart';




class QuickData extends StatelessWidget{

//   QuickData({
//     required this.teamNum,
//     required this.teamName
// });

//   final String teamNum;
//   final String teamName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backroundColor,
      child: GridView.count(
        shrinkWrap: true,
        primary: false,
        padding: smallPadding,
        crossAxisSpacing: 8,
        crossAxisCount: 2,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 50, maxHeight: 20),
            color: primaryColorDark,
          ),
        ],
      ),
    );
  }
}