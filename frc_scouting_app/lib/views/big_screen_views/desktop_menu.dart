// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:frc_scouting_app/misc/constants.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:frc_scouting_app/views/big_screen_views/scouting_screen/input_scouting_info/scouting_screen.dart';
import 'package:frc_scouting_app/views/big_screen_views/scouting_screen/matches/view_matches.dart';
import 'package:frc_scouting_app/views/big_screen_views/teams_info/quick_data.dart';


class DesktopMenu extends StatelessWidget{
  
    DesktopMenu({
    //   required this.teamName
      required this.page
    });
    final PageController page;

    // final String teamNum;
    // final String teamName;

  @override
  Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
      return Container(
        constraints: BoxConstraints(maxWidth: width - 100),
        color: primaryColorDark,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: primaryColorDark,
            body: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              SideMenu(
                controller: page,
                style: SideMenuStyle(
                  backgroundColor: primaryColorDark,
                  displayMode: SideMenuDisplayMode.open,
                  hoverColor: Colors.blue[100],
                  selectedColor: Colors.lightBlue,
                  selectedTitleTextStyle: const TextStyle(color: Colors.white),
                  selectedIconColor: Colors.white,
                  // unselectedIconColor: Colors.blueGrey,
                  // unselectedTitleTextStyle: const TextStyle(
                  //   color: Colors.blueGrey
                  // )
                  // decoration: const BoxDecoration(
                  //   borderRadius: BorderRadius.all(Radius.circular(10)),
                  // ),
                ),
                title: const SizedBox(height: 10),
                  // Column(
                  //   children: [
                  //     Padding(
                  //       padding: smallPadding,
                  //       child: ConstrainedBox(
                  //         constraints: const BoxConstraints(
                  //           maxHeight: 150,
                  //           maxWidth: 150,
                  //         ),
                  //         child: Image.asset(
                  //           'lib/assets/logo.png',
                  //         ),
                  //       )
                  //     ),
                  //     const Divider(
                  //       indent: 8.0,
                  //       endIndent: 8.0,
                  //     ),
                  //   ],
                  // ),
                items: [
                  SideMenuItem(
                    priority: 0,
                    title: 'Teams Info',
                    onTap: () {
                      page.jumpToPage(0);
                    },
                    icon: const Icon(Icons.home),
                  ),
                  SideMenuItem(
                    priority: 1,
                    title: 'Match',
                    onTap: () {
                      page.jumpToPage(1);
                    },
                    icon: const Icon(Icons.home),
                  ),
                  SideMenuItem(
                    priority: 2,
                    title: 'Picklist',
                    onTap: () {
                      page.jumpToPage(2);
                    },
                    icon: const Icon(Icons.file_copy_rounded),
                  ),
                  SideMenuItem(
                    priority: 3,
                    title: 'Scouting',
                    onTap: () {
                      page.jumpToPage(3);
                    },
                    icon: const Icon(Icons.download),
                  ),
                  SideMenuItem(
                    priority: 4,
                    title: 'Settings',
                    onTap: () {
                      page.jumpToPage(4);
                    },
                    icon: const Icon(Icons.settings),
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  controller: page,
                  children: [
                    QuickData(
                      // teamName: teamName,
                      // teamNum: teamNum,
                    ),
                    Container(
                      color: Colors.white,
                      child: const Center(
                        child: Text(
                          'Easter Egg',
                          style: TextStyle(fontSize: 35),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: const Center(
                        child: Text(
                          'Files',
                          style: TextStyle(fontSize: 35),
                        ),
                      ),
                    ),
                    ViewMatches(), //ScoutingScreen(),
                    Container(
                      color: Colors.white,
                      child: const Center(
                        child: Text(
                          'Settings',
                          style: TextStyle(fontSize: 35),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
              ),
            )
          )
      );
  }
}
