import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:frc_scouting_app/views/big_screen_views/desktop_menu.dart';
import 'package:frc_scouting_app/views/big_screen_views/scouting_screen/input_scouting_info/scouting_screen.dart';
import 'package:frc_scouting_app/views/big_screen_views/teams_info/quick_team_data.dart';
import 'package:frc_scouting_app/views/big_screen_views/top_bar_desktop.dart';
import 'package:frc_scouting_app/views/common_views/responsive_layout.dart';
import 'package:frc_scouting_app/views/small_screen_views/phone_menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _App();
}

class _App extends State<App> {
  String title = "";

  Widget build(BuildContext context) {
    final PageController page = PageController();
    return ScreenUtilInit(
        builder: ((context, child) => MaterialApp(
            title: '2230 scouting',
            darkTheme: ThemeData.dark(),
            home: ResponsiveLayout(
                desktopChild: TopBarDesktop(
                  page: page,
                  title: title,
                  child: DesktopMenu(
                    page: page,
                  ),
                ),
                mobileChild: PhoneMenu(
                  page: page,
                )))));
  }
}
