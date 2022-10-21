import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoute_prime/desktop_widgets/side_menu/screen_with_sidemenu.dart';

import 'package:scoute_prime/variables/constants.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  /// The root [Widget] of the app.
  @override
  Widget build(BuildContext context) {
    
    return ScreenUtilInit( 
      /// ScreenUtilInit is a plugin that lets the program adapt ui displays and fonts to the screen size.
      /// You can read more about it here: https://pub.dev/packages/flutter_scrflutter_screenutileenutil

      builder: ((context, child) => MaterialApp(
        /// MaterialApp is a convenience widget that wraps a number of widgets that are commonly required for Material Design applications.
      
        /// header of the tab in the browser.
        title: '2230 scouting',
    
        theme: ThemeData(
          /// Defines a theme data, we can use the theme data to set app-wide colors, fonts, widgets
          /// that can be used throught the app.

          // colors // 
          primaryColor: ConstColors.PRIMARY_COLOR,

          backgroundColor: ConstColors.BACKGROUND_COLOR,

          hoverColor: ConstColors.HOVER_COLOR,
        ),

        color: Theme.of(context).backgroundColor,
    
        /// Start the app with the "/" named route. In our case the app starts with LoginScreen.
        initialRoute: '/',
        routes: {
          /// each route builds its accompanying widget.
          '/': (context) => DesktopSidemenuScreenBuilder(
            screen: Expanded(
              child: Container(
                width: 100.w,
                height: MediaQuery.of(context).size.height,
                color: Theme.of(context).backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
            ),
          )
          ///'/login': ((context) => const LoginScreen()),
        },
      ))
    );
  }
}
