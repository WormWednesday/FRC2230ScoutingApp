import 'package:flutter/material.dart';

// widget colors //
const primaryColorLight = Color(0xff3d5a80);

const primaryColorDark = Color(0xff2b2d42);
const secondaryColor = Color.fromARGB(127, 219, 226, 239);

const backroundColor = Color(0xff334d70);

const Color redTeamColor = Colors.red;
const Color blueTeamColor = Colors.blue;

// widget numbers //
const topBarHeight = 55.0;

// ui //
const smallPaddingN = 8.0;
const smallPadding = EdgeInsets.all(smallPaddingN);
const smallPaddingSides = EdgeInsets.only(left: smallPaddingN, right: smallPaddingN);

const checkboxPadding = EdgeInsets.all(11);

// scouting screen // 
const competitionsMenuItems = [
  DropdownMenuItem(value: 'comp 1', child: Text('comp 1')),
  DropdownMenuItem(value: 'comp 2', child: Text('comp 2')),
];

const matchTypeMenuItems = [
  DropdownMenuItem(value: 'Practice', child: Text('Practice')),
  DropdownMenuItem(value: 'Pre Pick', child: Text('Pre Pick')),
  DropdownMenuItem(value: 'Quarter Finals', child: Text('Quarter Finals')),
  DropdownMenuItem(value: 'Semi Finals', child: Text('Semi Finals')),
  DropdownMenuItem(value: 'Finals', child: Text('Finals'))
];

const allianceMenuItems = [
  DropdownMenuItem(value: 'blue', child: Text('blue')),
  DropdownMenuItem(value: 'red', child: Text('red')),
];

const startingPosMenuItems = [
  DropdownMenuItem(value: '1', child: Text('1')),
  DropdownMenuItem(value: '2', child: Text('2')),
  DropdownMenuItem(value: '3', child: Text('3')),
  DropdownMenuItem(value: '4', child: Text('4'))
];

const gatherBallsPosMenuItems = [
  DropdownMenuItem(value: 'HP', child: Text('HP')),
  DropdownMenuItem(value: 'Ground', child: Text('Ground')),
  DropdownMenuItem(value: 'Both', child: Text('Both')),
  DropdownMenuItem(value: "Didn't gather", child: Text("Didn't gather"))
];

const shootingPosMenuItems = [
  DropdownMenuItem(value: 'A', child: Text('A')),
  DropdownMenuItem(value: 'B', child: Text('B')),
  DropdownMenuItem(value: 'C', child: Text('C')),
  DropdownMenuItem(value: 'D', child: Text('D'))
];

const attemptedClimbLevelMenuItems = [
  DropdownMenuItem(value: '0', child: Text("Didn't try")),
  DropdownMenuItem(value: '1', child: Text('1')),
  DropdownMenuItem(value: '2', child: Text('2')),
  DropdownMenuItem(value: '3', child: Text('3')),
  DropdownMenuItem(value: '4', child: Text('4'))
];

const climbLevelMenuItems = [
  DropdownMenuItem(value: '0', child: Text('0')),
  DropdownMenuItem(value: '1', child: Text('1')),
  DropdownMenuItem(value: '2', child: Text('2')),
  DropdownMenuItem(value: '3', child: Text('3')),
  DropdownMenuItem(value: '4', child: Text('4'))
];

const fromWhereClimbedMenuItems = [
  DropdownMenuItem(value: 'A', child: Text('A')),
  DropdownMenuItem(value: 'B', child: Text('B')),
  DropdownMenuItem(value: '', child: Text("Didn't try"))
];



