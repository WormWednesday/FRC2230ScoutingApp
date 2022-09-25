import 'package:flutter/material.dart';

import 'package:frc_scouting_app/Database/scouter_info_api.dart';
import 'package:frc_scouting_app/views/big_screen_views/teams_info/quick_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frc_scouting_app/misc/constants.dart';
import 'package:frc_scouting_app/views/big_screen_views/scouting_screen/input_scouting_info/scouting_screen.dart';

// TODO: need to post data to db when certain team wins

enum MatchInfoSortedIndexes {id, competition, number, type, wonAlliance, r1, r2, r3, b1, b2, b3}
class ViewMatches extends StatefulWidget{
final Color OMcolor = Colors.green[500] as Color; // Ongoing Match
final Color EMcolor = Colors.red[900] as Color; // End Match

  @override
  State<StatefulWidget> createState() => _ViewMatchesState();
}

class _ViewMatchesState extends State<ViewMatches>{ 
  List<dynamic> matchInfo = [];
  List<dynamic> matchesIds = [];
  List<bool> isOpen = [];

  
@override
  void initState(){
  super.initState(); 
  unFutureMatchInfo();
  unFutureMatchIdFromRobotInfo();
  }

  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print('burgur');
    List<String> ids = matchesIds.toString().substring(1, matchesIds.toString().length - 1).replaceAll(RegExp(r'{match_id: '), '').replaceAll('}', ' ').replaceAll(' ', '').split(','); // FormatException happenns here bcs line converts empty list to int list OR its empty, in that case make a defualt case
    print(ids);

    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(maxHeight: height, maxWidth: width),
        color: backroundColor,
        child: Padding(
          padding: smallPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExpansionPanelList(
                expandedHeaderPadding: smallPadding,
                expansionCallback: (i, state) => setState(() => isOpen[i] = !state),
                children: List.generate(matchInfo.length, (i) {
                  final List<String> matchInfoItemInList = matchInfo[i].toString().substring(1, matchInfo[i].toString().length - 1).replaceAll(RegExp(r' '), '').split(",");
                  final List<String> matchInfoSorted = List.generate(matchInfoItemInList.length, ((i) => matchInfoItemInList[i].split(":")[1]));

                  return ExpansionPanel(
                    headerBuilder: (context, isExpanded) => head(
                      id: matchInfoSorted[MatchInfoSortedIndexes.id.index],
                      competition: matchInfoSorted[MatchInfoSortedIndexes.competition.index],
                      matchNumber: matchInfoSorted[MatchInfoSortedIndexes.number.index],
                      matchType: matchInfoSorted[MatchInfoSortedIndexes.type.index],
                      wonAlliance: matchInfoSorted[MatchInfoSortedIndexes.wonAlliance.index]
                    ),
                    body: body(
                      idsList: ids,
                      teamNumbers: [matchInfoSorted[MatchInfoSortedIndexes.r1.index], matchInfoSorted[MatchInfoSortedIndexes.b1.index], matchInfoSorted[MatchInfoSortedIndexes.r2.index], matchInfoSorted[MatchInfoSortedIndexes.b2.index], matchInfoSorted[MatchInfoSortedIndexes.r3.index], matchInfoSorted[MatchInfoSortedIndexes.b3.index]],
                      matchId: matchInfoSorted[MatchInfoSortedIndexes.id.index],
                      competition: matchInfoSorted[MatchInfoSortedIndexes.competition.index],
                      matchNumber: matchInfoSorted[MatchInfoSortedIndexes.number.index],
                      matchType: matchInfoSorted[MatchInfoSortedIndexes.type.index],
                      wonAlliance: matchInfoSorted[MatchInfoSortedIndexes.wonAlliance.index]
                    ),
                    backgroundColor: primaryColorDark,
                    isExpanded: isOpen[i],
                    canTapOnHeader: true
                  );}
                ),
              ),
              IconButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => QuickData()
                  )), 
                icon: const Icon(Icons.add) 
                )
            ],
          ),
        )
      ),
    );
  }

   head({
    required String id, 
    required String competition, 
    required String matchNumber, 
    required String matchType, 
    required String wonAlliance}) {
    Color isMatchOverColor = getIsMatchOverColor(wonAlliance);
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: smallPaddingSides,
            child: Container(
            constraints: const BoxConstraints(maxWidth: 10, maxHeight: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isMatchOverColor
              ),
            ),
          ),
          Text("$competition - $matchType - $matchNumber - ",
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w600
          )
          ),
          Builder(builder: ((context) {
            if(wonAlliance == "red" || wonAlliance == "blue"){ // if not red or blue, wonAlliance will most likely be OM(ongoing match), if its not OM most likely there's an error
              return Text(wonAlliance,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: getWonAllianceColor(wonAlliance)
                ),
              );
            }
            else{
              return Text("ONGOING MATCH",
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: widget.OMcolor
                ),
              );
            }
        }))
      ])
      );
  }

  body({
    required List<String> idsList, 
    required List<String> teamNumbers, // list format needs to be [r1, b1, r2, b2....]
    required String matchId, 
    required String competition, 
    required String matchNumber, 
    required String matchType, 
    required String wonAlliance
    }) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 170),
      child: Builder(
        builder: ((context) {
          if(isMatchOver(matchId, idsList)){
            /**
             * match is over
             */
            return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => QuickData(), // TODO: needs to go to team match detail
                style: ElevatedButton.styleFrom(primary: primaryColorDark),
                child: const SizedBox(
                  width: 500,
                  height: 50,
                  child: Align(
                    child: Text("view match",
                    ),
                  )
                )
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 15,
                children: List.generate(teamNumbers.length, (index) => ElevatedButton(
                  onPressed: () => QuickData(),
                  style: ElevatedButton.styleFrom(primary: primaryColorDark),
                  child: Text(teamNumbers[index], 
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: getAllianceColorByNumber(index)
                    )),
                )), 
                )
            ],
          );}
          else{
            /**
             * ongoing match
             */
            return Container(
              constraints: const BoxConstraints(maxHeight: 170),
              color: primaryColorDark,
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 15,
                children: List.generate(teamNumbers.length, (index) => ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ScoutingScreen(
                    matchId: matchId,
                    competition: competition,
                    matchType: matchType,
                    matchNumber: matchNumber,
                    alliance: getAllianceNameByNumber(index),
                    teamNumber: teamNumbers[index],
                  )
                  )), 
                  style: ElevatedButton.styleFrom(primary: primaryColorDark),
                  child: Text(teamNumbers[index], 
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: getAllianceColorByNumber(index)
                    )),
                )), 
                )
            );
          }
        }
      ))
    );
  }

  void unFutureMatchInfo() async{
  List<dynamic> data = await getMatchInfo();
  if (!mounted) return;
  setState(() {
    matchInfo = data; 
    isOpen = List.generate(matchInfo.length, (i) => false);
    });
  }

  void unFutureMatchIdFromRobotInfo() async{
    List<dynamic> data = await getMatchIdFromRobotInfo();
    if (!mounted) return;
    setState(() => matchesIds = data); 
  }

  bool isMatchOver(String id, List<String> ids){
    int counter = 0;

    for(int i = 0; i < ids.length; i++){
      if(id == ids[i]) {counter++;}
      if(counter >= 6) {return true;}
    }
    
    return false;
  }

  Color getIsMatchOverColor(String wonAlliance){
    /*
    red = match over
    green = match not over  
    */
    if(wonAlliance == "red" || wonAlliance == "blue") {return widget.EMcolor;}
    else {return widget.OMcolor;}
  }
  
  Color getWonAllianceColor(String alliance){
    if(alliance == "red") {return redTeamColor;}
    else if (alliance == "blue") {return blueTeamColor;}
    else {return widget.OMcolor;}
  }

  Color getAllianceColorByNumber(int alliance){
    if(alliance % 2 == 0) {return redTeamColor;}
    else {return blueTeamColor;}
  }

  String getAllianceNameByNumber(int alliance){
      if(alliance % 2 == 0) {return "red";}
      else {return "blue";}
    }

}

