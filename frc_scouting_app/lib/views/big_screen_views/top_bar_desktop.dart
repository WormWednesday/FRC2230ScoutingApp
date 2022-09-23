import 'package:flutter/material.dart';
import 'package:frc_scouting_app/misc/constants.dart';
import 'package:frc_scouting_app/views/big_screen_views/team_search_box.dart';


class TopBarDesktop extends StatelessWidget{

  const TopBarDesktop({
    required this.title,
    required this.child,
    required this.page
  });

  final String title;
  final Widget? child;
  final PageController page;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // build the screen beside the sidebar
    return Scaffold(
      body: Container(
        color: backroundColor,
        // put the top bar, devider, and child
        child: Column(
          children: [
            // in the first row there will be a search bar, a button and a Text to display what screen we are on
            Padding(
              padding: smallPadding,
              child: SizedBox(
                height: topBarHeight,
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const Alignment(-1.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            constraints: const BoxConstraints(minWidth: 100.0, maxWidth: 400.0),
                            child: TeamSearchBox(
                              page: page,
                            )
                            ),
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, top: 15.0),
                      child: SizedBox(
                        child: Align(
                          alignment: const Alignment(-0.7, 0.0),
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                              fontFamily: 'vanguardian'
                            )
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Align(
                        alignment: const Alignment(-0.8, 0.0),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          color: Colors.transparent
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
              color: Colors.grey,
            ),
            SizedBox(
              height: height - topBarHeight - 32,
              width: width,
              child: child
            )
          ]
        )
      ),
    );
  }

  
}