import 'package:flutter/material.dart';

import 'package:frc_scouting_app/views/big_screen_views/desktop_menu.dart';
import 'package:frc_scouting_app/views/big_screen_views/scouting_screen/input_scouting_info/scouting_screen.dart';
import 'package:frc_scouting_app/views/big_screen_views/teams_info/quick_data.dart';
import 'package:frc_scouting_app/views/big_screen_views/top_bar_desktop.dart';
import 'package:frc_scouting_app/views/common_views/responsive_layout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App());
}

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final PageController page = PageController();
    return MaterialApp(
      title: '2230 scouting',
      darkTheme: ThemeData.dark(),
      home: ResponsiveLayout(
        desktopChild: TopBarDesktop(
          page: page,
          title: 'test',
          child: DesktopMenu(
            page: page,
          ),
        ),
        mobileChild: QuickData()
      )
    );
  }

}