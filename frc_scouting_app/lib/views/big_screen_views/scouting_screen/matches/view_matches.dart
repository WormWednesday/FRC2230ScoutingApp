import 'package:flutter/material.dart';

import 'package:frc_scouting_app/Database/scouter_info_api.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frc_scouting_app/misc/constants.dart';
import 'package:frc_scouting_app/views/big_screen_views/scouting_screen/input_scouting_info/scouting_screen.dart';

// TODO: need to post data to db when certain team wins

class ViewMatches extends StatefulWidget{
  const ViewMatches({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ViewMatchesState();
}

class _ViewMatchesState extends State<ViewMatches>{ 
  List<dynamic> matchInfo = [];
  List<dynamic> matchIds = [];
  List<bool> isOpen = [];

  
@override
  void initState(){
  super.initState(); 
  unFutureMatchInfo();
  }

  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                children: List.generate(matchInfo.length, (i) => ExpansionPanel(
                  headerBuilder: (context, isExpanded) => head(matchInfo[i].toString().split(" ").toString().split(",")),
                  body: body(matchInfo[i].toString().split(" ")),
                  backgroundColor: primaryColorDark,
                  isExpanded: isOpen[i],
                  canTapOnHeader: true
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const ScoutingScreen()
                  )), 
                icon: const Icon(Icons.add) 
                )
            ],
          ),
        )
      ),
    );
  }

   head(List<String> match) {
    Color isMatchOverColor = getIsMatchOverColor(int.parse(match[1].split(",")[0]));
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
          Text("${match[4]} - ${match[7]} - ${match[10]} -",
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w600
          )
          ),
          Builder(builder: ((context) {
            if(isMatchOverColor == Colors.green[500]){
              return Text(" ONGOING MATCH",
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.green[500]
                ),
              );
            }
            else{
              return Text(match[13],
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: getWonAllianceColor(match[13])
                ),
              );
            }
        }))
      ])
      );
  }

  body(List<String> match) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 170),
      child: Builder(
        builder: ((context) {
          if(isMatchOver(int.parse(match[1].split(",")[0]))){
            /**
             * match is over
             */
            return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => const ScoutingScreen(), // needs to go to team match detail
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
                children: List.generate(6, (index) => ElevatedButton(
                  onPressed: () => const ScoutingScreen(),
                  style: ElevatedButton.styleFrom(primary: primaryColorDark),
                  child: Text(match[11 + index * 2].split(",")[0], 
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
                children: List.generate(6, (index) => ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const ScoutingScreen()
                  )), 
                  style: ElevatedButton.styleFrom(primary: primaryColorDark),
                  child: Text(match[11 + index * 2].split(",")[0], 
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
  setState(() {
    matchInfo = data; 
    isOpen = List.generate(matchInfo.length, (i) => false);
    });
  }

void unFutureMatchIdFromRobotInfo() async{
  List<dynamic> data = await getMatchIdFromRobotInfo();
  setState(() => matchIds = data); 
}

bool isMatchOver(int id){
  int counter = 0;
  unFutureMatchIdFromRobotInfo();
  matchIds.forEach((element) {if(element == id) {counter++;}});
  if(counter < 6) return false;
  return true;
}

Color getIsMatchOverColor(int id){
  /*
  red = match over
  green = match not over  
   */
  if(isMatchOver(id)) {return Colors.red[900] as Color;}
  else {return Colors.green[500] as Color;}
}
  
  Color getWonAllianceColor(String alliance){
    if(alliance == " red") {return redTeamColor;}
    else if (alliance == " blue") {return blueTeamColor;}
    else {return secondaryColor;}
  }

  Color getAllianceColorByNumber(int alliance){
    if(alliance % 2 == 0) {return redTeamColor;}
    else {return blueTeamColor;}
  }
}

