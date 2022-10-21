import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frc_scouting_app/Database/scouter_info_api.dart';
import 'package:frc_scouting_app/misc/teams_list.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:frc_scouting_app/misc/constants.dart';

class CreateMatch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateMatchState();
}

class _CreateMatchState extends State<CreateMatch> {
  late String _competition;
  late String _matchNumber;
  late String _matchType;

  List<String> _teams = List.generate(6, (index) => '');

  final TextEditingController _matchNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _matchNumberController.addListener(() {
      _matchNumber = _matchNumberController.text;
      _matchNumberController.value = _matchNumberController.value.copyWith(
          text: _matchNumber,
          selection: TextSelection(
              baseOffset: _matchNumber.length,
              extentOffset: _matchNumber.length),
          composing: TextRange.empty);
    });
  }

  _saveComp(String? comp) {
    if (comp is String) {
      setState(() => _competition = comp);
    }
  }

  //dropDownMenu only accepts funcs with 1 String param, so for every team there is a func
  _saveMatchType(String? matchType) {
    if (matchType is String) {
      setState(() => _matchType = matchType);
    }
  }

  void _saveRTeam0(String? team) {
    if (team is String) {
      setState(() => _teams[0] = team);
    }
  }

  void _saveRTeam1(String? team) {
    if (team is String) {
      setState(() => _teams[1] = team);
    }
  }

  void _saveRTeam2(String? team) {
    if (team is String) {
      setState(() => _teams[2] = team);
    }
  }

  void _saveBTeam0(String? team) {
    if (team is String) {
      setState(() => _teams[3] = team);
    }
  }

  void _saveBTeam1(String? team) {
    if (team is String) {
      setState(() => _teams[4] = team);
    }
  }

  void _saveBTeam2(String? team) {
    if (team is String) {
      setState(() => _teams[5] = team);
    }
  }

  Color getAllianceColorByNumber(int alliance) {
    if (alliance % 2 == 0) {
      return redTeamColor;
    } else {
      return blueTeamColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.center,
              child: Text("Create new match",
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontFamily: 'vanguardian')),
            ),
          ),
          Row(children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 400.0),
              child: Padding(
                padding: smallPaddingSides,
                child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: secondaryColor),
                    hint: const Text('Choose competition'),
                    items: competitionsMenuItems,
                    onChanged: _saveComp,
                    validator: (String? value) => (value == null)
                        ? 'Must select competition before sending data'
                        : null),
              ),
            ),
            Expanded(
              child: Padding(
                padding: smallPaddingSides,
                child: TextFormField(
                  controller: _matchNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(11.0, 22.9, 22.9, 22.9),
                      hintText: 'Input Match Number',
                      border: OutlineInputBorder(),
                      fillColor: secondaryColor),
                ),
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
                    hint: const Text('Choose match type'),
                    items: matchTypeMenuItems,
                    onChanged: _saveMatchType,
                    validator: (String? value) => (value == null)
                        ? 'Must select match type sending data'
                        : null),
              ),
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Padding(
                padding: smallPadding,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Red Team",
                      style: TextStyle(
                          fontSize: 32.0,
                          color: redTeamColor,
                          fontFamily: 'vanguardian')),
                ),
              ),
              SizedBox(
                width: 1,
              ),
              Padding(
                padding: smallPadding,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Blue team",
                      style: TextStyle(
                          fontSize: 32.0,
                          color: blueTeamColor,
                          fontFamily: 'vanguardian')),
                ),
              ),
            ],
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                childAspectRatio: 11,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  teamSelector(onChanged: _saveRTeam0),
                  teamSelector(onChanged: _saveBTeam0),
                  teamSelector(onChanged: _saveRTeam1),
                  teamSelector(onChanged: _saveBTeam1),
                  teamSelector(onChanged: _saveRTeam2),
                  teamSelector(onChanged: _saveBTeam2),
                ]),
          ),
          ElevatedButton(
              onPressed: () => insertMatchInfo(
                  _competition, _matchNumber, _matchType, _teams),
              child: const Text('SAVE'))
        ],
      ),
    );
  }

  teamSelector({required void Function(String?) onChanged}) {
    //double width = MediaQuery.of(context).size.width;
    return Container(
      //constraints: BoxConstraints(maxWidth: width, maxHeight: width / 11),
      child: Padding(
        padding: smallPaddingSides,
        child: DropdownButtonFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), fillColor: secondaryColor),
            hint: const Text('Choose team'),
            items: teamsDropDownItems,
            onChanged: onChanged,
            validator: (String? value) => (value == null)
                ? 'Must select team before sending data'
                : null),
      ),
    );
  }
}
