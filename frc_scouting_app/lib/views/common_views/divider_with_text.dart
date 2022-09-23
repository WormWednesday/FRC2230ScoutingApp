import "package:flutter/material.dart";
import 'package:frc_scouting_app/misc/constants.dart';

class DividerWithTitle extends StatelessWidget {

  DividerWithTitle({
    required this.title,
    required this.color
    });

  final String title;
  final Color color;

  Expanded get leftLine => leftDividerLine();
  Expanded get rightLine => rightDividerLine();
  @override
  Widget build(final BuildContext context) {
    return Row(
      children: <Widget>[
        leftLine,
        Text(title, style: const TextStyle(color: secondaryColor)),
        rightLine,
      ],
    );
  }

  Expanded leftDividerLine() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 25.0, right: 10.0),
        child: Divider(
          thickness: 1,
          color: color,
          height: 40,
        ),
      ),
    );
  }

  Expanded rightDividerLine() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 10.0, right: 25.0),
        child: Divider(
          thickness: 1,
          color: color,
          height: 40,
        ),
      ),
    );
  }
}
