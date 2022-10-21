import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frc_scouting_app/Database/scouter_info_api.dart';
import 'package:frc_scouting_app/misc/constants.dart';
import 'package:frc_scouting_app/views/big_screen_views/scouting_screen/input_scouting_info/shot_counter.dart';
import 'package:frc_scouting_app/views/common_views/divider_with_text.dart';

/* TODO: 
Try https://pub.dev/packages/flutter_picker for phone 
clear validators (or make them usefull)                                     
make first screen history/adding new scouting entries, if admin you can make new scouting entry.
clean..., this section is a mess
*/

class ScoutingScreen extends StatefulWidget {
  ScoutingScreen(
      {required this.matchId,
      required this.competition,
      required this.matchType,
      required this.matchNumber,
      required this.alliance,
      required this.teamNumber});

  final String matchId;
  final String competition;
  final String matchType;
  final String matchNumber;
  final String alliance;
  final String teamNumber;

  @override
  State<StatefulWidget> createState() => _ScoutingScreenState();
}

class _ScoutingScreenState extends State<ScoutingScreen> {
  late String _startingPos;
  late String _shootingPos;
  late int _climbAttempLevel;
  late int _climbLevel;
  late String _gatherBallsPos;
  late String _fromWhereClimbed;

  bool _wasRobotOnField = true;
  bool _didHPScore = false;
  bool _didRobotWorkInAuto = true;
  bool _didRobotWorkInTeleop = true;
  bool _didRobotDefend = false;
  bool _wasStrategyDifferent = false;
  bool _didWin = false;

  int _autoHighScored = 0;
  int _autoHighMissed = 0;
  int _autoLowScored = 0;
  int _autoLowMissed = 0;
  int _teleOpHighScored = 0;
  int _teleOpHighMissed = 0;
  int _teleOpLowScored = 0;
  int _teleOpLowMissed = 0;

  final TextEditingController _scouterNameController = TextEditingController();
  final TextEditingController _climbBeforeEndSecsController =
      TextEditingController();
  final TextEditingController _defenceController = TextEditingController();
  final TextEditingController _robotCommentsController =
      TextEditingController();
  final TextEditingController _strategyController = TextEditingController();
  final TextEditingController _shootingPrepTimeController =
      TextEditingController();

  late String _scouterNameText;
  late String _climbBeforeEndSecsText;
  late int _climbBeforeEndSecsNum;
  late String _defenceText = '';
  late String _robotCommentsText = '';
  late String _strategyText = '';
  late String? _shootingPrepTimeText;
  late int _shootingPrepTimeNum;

  @override
  void initState() {
    super.initState();

    _scouterNameController.addListener(() {
      _scouterNameText = _scouterNameController.text;
      _scouterNameController.value = _scouterNameController.value.copyWith(
          text: _scouterNameText,
          selection: TextSelection(
              baseOffset: _scouterNameText.length,
              extentOffset: _scouterNameText.length),
          composing: TextRange.empty);
    });

    _climbBeforeEndSecsController.addListener(() {
      _climbBeforeEndSecsText = _climbBeforeEndSecsController.text;
      _climbBeforeEndSecsController.value = _climbBeforeEndSecsController.value
          .copyWith(
              text: _climbBeforeEndSecsText,
              selection: TextSelection(
                  baseOffset: _climbBeforeEndSecsText.length,
                  extentOffset: _climbBeforeEndSecsText.length),
              composing: TextRange.empty);
      _climbBeforeEndSecsNum = int.parse(_climbBeforeEndSecsText);
    });

    _defenceController.addListener(() {
      _defenceText = _defenceController.text;
      _defenceController.value = _defenceController.value.copyWith(
          text: _defenceText,
          selection: TextSelection(
              baseOffset: _defenceText.length,
              extentOffset: _defenceText.length),
          composing: TextRange.empty);
    });

    _robotCommentsController.addListener(() {
      _robotCommentsText = _robotCommentsController.text;
      _robotCommentsController.value = _robotCommentsController.value.copyWith(
          text: _robotCommentsText,
          selection: TextSelection(
              baseOffset: _robotCommentsText.length,
              extentOffset: _robotCommentsText.length),
          composing: TextRange.empty);
    });

    _strategyController.addListener(() {
      _strategyText = _strategyController.text;
      _strategyController.value = _strategyController.value.copyWith(
          text: _strategyText,
          selection: TextSelection(
              baseOffset: _strategyText.length,
              extentOffset: _strategyText.length),
          composing: TextRange.empty);
    });

    _shootingPrepTimeController.addListener(() {
      _shootingPrepTimeText = _shootingPrepTimeController.text;
      _shootingPrepTimeController.value = _shootingPrepTimeController.value
          .copyWith(
              text: _shootingPrepTimeText,
              selection: TextSelection(
                  baseOffset: _shootingPrepTimeText!.length,
                  extentOffset: _shootingPrepTimeText!.length),
              composing: TextRange.empty);
      _shootingPrepTimeNum = int.parse(_shootingPrepTimeText!);
    });
  }

  // TODO: add all controllers
  @override
  void dispose() {
    _scouterNameController.dispose();
    super.dispose();
  }

  _saveStartingPos(String? startingPos) {
    if (startingPos is String) {
      setState(() => _startingPos = startingPos);
    }
  }

  _saveShootingPos(String? shootingPos) {
    if (shootingPos is String) {
      setState(() => _shootingPos = shootingPos);
    }
  }

  _saveClimbAttempLevel(String? climbAttempLevel) {
    if (climbAttempLevel is String) {
      setState(() => _climbAttempLevel = int.parse(climbAttempLevel));
    }
  }

  _saveClimbLevel(String? climbLevel) {
    if (climbLevel is String) {
      setState(() => _climbLevel = int.parse(climbLevel));
    }
  }

  _saveGatherBallsPos(String? gatherBallsPos) {
    if (gatherBallsPos is String) {
      setState(() => _gatherBallsPos = gatherBallsPos);
    }
  }

  _saveFromWhereClimbed(String? fromWhereClimbed) {
    if (fromWhereClimbed is String) {
      setState(() => _fromWhereClimbed = fromWhereClimbed);
    }
  }

  _saveWasRobotOnFIeld(bool? wasRobotOnField) {
    if (wasRobotOnField is bool) {
      setState(() => _wasRobotOnField = wasRobotOnField);
    }
  }

  _saveDidRobotWorkInAuto(bool? didRobotWorkInAuto) {
    if (didRobotWorkInAuto is bool) {
      setState(() => _didRobotWorkInAuto = didRobotWorkInAuto);
    }
  }

  _saveDidRobotWorkInTeleop(bool? didRobotWorkInTeleop) {
    if (didRobotWorkInTeleop is bool) {
      setState(() => _didRobotWorkInTeleop = didRobotWorkInTeleop);
    }
  }

  _saveDidHPScore(bool? didHPScore) {
    if (didHPScore is bool) {
      setState(() => _didHPScore = didHPScore);
    }
  }

  _saveDidRobotDefend(bool? didRobotDefend) {
    if (didRobotDefend is bool) {
      setState(() => _didRobotDefend = didRobotDefend);
    }
  }

  _saveDidWin(bool? didWin) {
    if (didWin is bool) {
      setState(() => _didWin = didWin);
    }
  }

  _saveWasStrategyDifferent(bool? wasStrategyDifferent) {
    if (wasStrategyDifferent is bool) {
      setState(() => _wasStrategyDifferent = wasStrategyDifferent);
    }
  }

  _saveAutoHighScored(int? autoHighScored) {
    if (autoHighScored is int) {
      setState(() => _autoHighScored = autoHighScored);
    }
  }

  _saveAutoHighMissed(int? autoHighMissed) {
    if (autoHighMissed is int) {
      setState(() => _autoHighMissed = autoHighMissed);
    }
  }

  _saveAutoLowScored(int? autoLowScored) {
    if (autoLowScored is int) {
      setState(() => _autoLowScored = autoLowScored);
    }
  }

  _saveAutoLowMissed(int? autoLowMissed) {
    if (autoLowMissed is int) {
      setState(() => _autoLowMissed = autoLowMissed);
    }
  }

  _saveTeleOpHighScored(int? teleOpHighScored) {
    if (teleOpHighScored is int) {
      setState(() => _teleOpHighScored = teleOpHighScored);
    }
  }

  _saveTeleOpHighMissed(int? teleOpHighMissed) {
    if (teleOpHighMissed is int) {
      setState(() => _teleOpHighMissed = teleOpHighMissed);
    }
  }

  _saveTeleOpLowScored(int? teleOpLowScored) {
    if (teleOpLowScored is int) {
      setState(() => _teleOpLowScored = teleOpLowScored);
    }
  }

  _saveTeleOpLowMissed(int? teleOpLowMissed) {
    if (teleOpLowMissed is int) {
      setState(() => _teleOpLowMissed = teleOpLowMissed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backroundColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back)),
          ),
          Column(
            children: [
              DividerWithTitle(title: 'Match Details', color: secondaryColor),
              Text("""
match: ${widget.competition} - match type: ${widget.matchType} - match number: ${widget.matchNumber}
                        alliance: ${widget.alliance} - team number: ${widget.teamNumber}
""",
                  style: const TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                      fontFamily: 'vanguardian')),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Expanded(
                  child: Padding(
                    padding: smallPaddingSides,
                    child: TextFormField(
                      controller: _scouterNameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(11.0, 22.9, 22.9, 22.9),
                          hintText: 'Input Scouter Name',
                          border: OutlineInputBorder(),
                          fillColor: secondaryColor),
                    ),
                  ),
                ),
                ClipRRect(
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: secondaryColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: checkboxPadding,
                        child: Row(children: [
                          Checkbox(
                            value: _wasRobotOnField,
                            onChanged: _saveWasRobotOnFIeld,
                            activeColor: Colors.blueAccent,
                          ),
                          const Text('Was robot on field?',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey))
                        ]),
                      )),
                ),
              ]),
              DividerWithTitle(title: 'Auto', color: secondaryColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 280,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ClipRRect(
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: secondaryColor),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: Padding(
                              padding: checkboxPadding,
                              child: Row(children: [
                                Checkbox(
                                  value: _didHPScore,
                                  onChanged: _saveDidHPScore,
                                  activeColor: Colors.blueAccent,
                                ),
                                const Text('Did HP score?',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.grey))
                              ]),
                            )),
                      ),
                    ),
                  ),
                  Image.asset('lib/assets/scouting_map.png'),
                  Column(
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxWidth: 300.0),
                        child: Padding(
                            padding: smallPaddingSides,
                            child: DropdownButtonFormField(
                                //alignment: Alignment.topLeft,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: secondaryColor),
                                hint: const Text('Choose Starting Position'),
                                items: startingPosMenuItems,
                                onChanged: _saveStartingPos,
                                validator: (String? value) => (value == null)
                                    ? 'Must select position sending data'
                                    : null)),
                      ),
                      const SizedBox(
                        height: 220,
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: secondaryColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: smallPadding,
                          child: Row(children: [
                            Checkbox(
                              value: _didRobotWorkInAuto,
                              onChanged: _saveDidRobotWorkInAuto,
                              activeColor: Colors.blueAccent,
                            ),
                            const Text('Did robot work in auto?',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey))
                          ]),
                        )),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ShotCounter(
                  title: 'Upper Scored',
                  count: _autoHighScored,
                  onChange: _saveAutoHighScored,
                ),
                ShotCounter(
                  title: 'Upper Missed',
                  count: _autoHighMissed,
                  onChange: _saveAutoHighMissed,
                ),
                Container(
                  height: 70,
                  width: 2,
                  color: secondaryColor,
                ),
                ShotCounter(
                  title: 'Lower Scored',
                  count: _autoLowScored,
                  onChange: _saveAutoLowScored,
                ),
                ShotCounter(
                  title: 'Lower Missed',
                  count: _autoLowMissed,
                  onChange: _saveAutoLowMissed,
                )
              ]),
              DividerWithTitle(title: 'Teleop', color: secondaryColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: secondaryColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: smallPadding,
                          child: Row(children: [
                            Checkbox(
                              value: _didRobotWorkInTeleop,
                              onChanged: _saveDidRobotWorkInTeleop,
                              activeColor: Colors.blueAccent,
                            ),
                            const Text('Did robot work in teleOp?',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey))
                          ]),
                        )),
                  )
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ShotCounter(
                  title: 'Upper Scored',
                  count: _teleOpHighScored,
                  onChange: _saveTeleOpHighScored,
                ),
                ShotCounter(
                  title: 'Upper Missed',
                  count: _teleOpHighMissed,
                  onChange: _saveTeleOpHighMissed,
                ),
                Container(
                  height: 70,
                  width: 2,
                  color: secondaryColor,
                ),
                ShotCounter(
                  title: 'Lower Scored',
                  count: _teleOpLowScored,
                  onChange: _saveTeleOpLowScored,
                ),
                ShotCounter(
                  title: 'Lower Missed',
                  count: _teleOpLowMissed,
                  onChange: _saveTeleOpLowMissed,
                )
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 400.0),
                    child: Padding(
                      padding: smallPaddingSides,
                      child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: secondaryColor),
                          hint:
                              const Text('Where did robot gather most balls?'),
                          items: gatherBallsPosMenuItems,
                          onChanged: _saveGatherBallsPos,
                          validator: (String? value) => (value == null)
                              ? 'Must select match type before sending data'
                              : null),
                    ),
                  )
                ],
              ),
              Image.asset('lib/assets/shooting_pos.png'),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 400.0),
                  child: Padding(
                    padding: smallPaddingSides,
                    child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: secondaryColor),
                        hint: const Text('Where did robot shot the most?'),
                        items: shootingPosMenuItems,
                        onChanged: _saveShootingPos,
                        validator: (String? value) => (value == null)
                            ? 'Must select match type before sending data'
                            : null),
                  ),
                )
              ]),
              DividerWithTitle(title: 'Climb', color: secondaryColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 400.0),
                    child: Padding(
                      padding: smallPadding,
                      child: TextFormField(
                        controller: _climbBeforeEndSecsController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(11.0, 22.9, 22.9, 22.9),
                            hintText:
                                'Time (in seconds) robot started to climbe before end',
                            border: OutlineInputBorder(),
                            fillColor: secondaryColor),
                      ),
                    ),
                  )
                ],
              ),
              Image.asset('lib/assets/climb_from.png'),
              Container(
                constraints: const BoxConstraints(maxWidth: 400.0),
                child: Padding(
                  padding: smallPadding,
                  child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: secondaryColor),
                      hint:
                          const Text('From where did robot attempt to climb?'),
                      items: fromWhereClimbedMenuItems,
                      onChanged: _saveFromWhereClimbed,
                      validator: (String? value) => (value == null)
                          ? 'Must select match type before sending data'
                          : null),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 400.0),
                    child: Padding(
                      padding: smallPaddingSides,
                      child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: secondaryColor),
                          hint: const Text(
                              'To what level did robot attempt to climb?'),
                          items: attemptedClimbLevelMenuItems,
                          onChanged: _saveClimbAttempLevel,
                          validator: (String? value) => (value == null)
                              ? 'Must select match type before sending data'
                              : null),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 400.0),
                    child: Padding(
                      padding: smallPaddingSides,
                      child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: secondaryColor),
                          hint: const Text('Level robot climbed'),
                          items: climbLevelMenuItems,
                          onChanged: _saveClimbLevel,
                          validator: (String? value) => (value == null)
                              ? 'Must select match type before sending data'
                              : null),
                    ),
                  ),
                ],
              ),
              DividerWithTitle(title: 'Conclusions', color: secondaryColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: smallPaddingSides,
                    child: Container(
                        constraints: const BoxConstraints(maxWidth: 300.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: secondaryColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: checkboxPadding,
                          child: Row(children: [
                            Checkbox(
                              value: _didRobotDefend,
                              onChanged: _saveDidRobotDefend,
                              activeColor: Colors.blueAccent,
                            ),
                            const Text('Did robot defend?',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey))
                          ]),
                        )),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 300.0),
                    child: Padding(
                      padding: smallPaddingSides,
                      child: TextFormField(
                        controller: _shootingPrepTimeController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(11.0, 12.5, 12.9, 22.5),
                            hintText: 'Averege shooting prep time',
                            border: OutlineInputBorder(),
                            fillColor: secondaryColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: smallPaddingSides,
                    child: Container(
                        constraints: const BoxConstraints(maxWidth: 300.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: secondaryColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: checkboxPadding,
                          child: Row(children: [
                            Checkbox(
                              value: _wasStrategyDifferent,
                              onChanged: _saveWasStrategyDifferent,
                              activeColor: Colors.blueAccent,
                            ),
                            const SizedBox(
                              width: 200,
                              child: Text(
                                  """Was the robots strategy different then theyre other game?""",
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            )
                          ]),
                        )),
                  ),
                  Padding(
                    padding: smallPaddingSides,
                    child: Container(
                        constraints: const BoxConstraints(maxWidth: 218.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: secondaryColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: checkboxPadding,
                          child: Row(children: [
                            Checkbox(
                              value: _didWin,
                              onChanged: _saveDidWin,
                              activeColor: Colors.blueAccent,
                            ),
                            const Text('Did robot won?',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey))
                          ]),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: smallPadding,
                child: TextFormField(
                  minLines: 1,
                  maxLines: 5,
                  controller: _defenceController,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(11.0, 22.9, 22.9, 22.9),
                      hintText: 'Defence Comments',
                      border: OutlineInputBorder(),
                      fillColor: secondaryColor),
                ),
              ),
              Padding(
                padding: smallPadding,
                child: TextFormField(
                  minLines: 1,
                  maxLines: 5,
                  controller: _robotCommentsController,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(11.0, 22.9, 22.9, 22.9),
                      hintText: 'Robot Comments',
                      border: OutlineInputBorder(),
                      fillColor: secondaryColor),
                ),
              ),
              Padding(
                padding: smallPadding,
                child: TextFormField(
                  minLines: 1,
                  maxLines: 5,
                  controller: _strategyController,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(11.0, 22.9, 22.9, 22.9),
                      hintText: 'Strategy Comments',
                      border: OutlineInputBorder(),
                      fillColor: secondaryColor),
                ),
              ),
              ElevatedButton(
                onPressed: () => insertInfo(
                  widget.teamNumber,
                  widget.matchId,
                  _didWin,
                  _autoHighScored,
                  _autoHighMissed,
                  _autoLowScored,
                  _autoLowMissed,
                  _teleOpHighScored,
                  _teleOpHighMissed,
                  _teleOpLowScored,
                  _teleOpLowMissed,
                  _shootingPos,
                  _shootingPrepTimeNum,
                  _climbBeforeEndSecsNum,
                  _climbAttempLevel,
                  _climbLevel,
                  _fromWhereClimbed,
                  widget.alliance,
                  _startingPos,
                  _gatherBallsPos,
                  _wasRobotOnField,
                  _didRobotWorkInAuto,
                  _didRobotWorkInTeleop,
                  _didHPScore,
                  _didRobotDefend,
                  _wasStrategyDifferent,
                  _defenceText,
                  _robotCommentsText,
                  _strategyText,
                  _scouterNameText,
                ),
                child: const Text('SAVE'),
              )
            ],
          ),
        ],
      )),
    );
  }
}
