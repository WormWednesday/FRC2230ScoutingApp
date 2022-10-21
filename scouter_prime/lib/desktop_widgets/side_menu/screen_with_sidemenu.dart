import 'package:flutter/material.dart';
import 'package:scoute_prime/desktop_widgets/side_menu/sidemenu.dart';

/// This widget is used to build a screen with [DesktopSidemenu] and a given [Widget]
class DesktopSidemenuScreenBuilder extends StatelessWidget {

  /// the [Widget] that will be viewed beside the [DesktopSidemenu]
  final Widget screen;

  const DesktopSidemenuScreenBuilder({
    required this.screen
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DesktopSidemenu(),
        screen
      ]
    );
  }
}
