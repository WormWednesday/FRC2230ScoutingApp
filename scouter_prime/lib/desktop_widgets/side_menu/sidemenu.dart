import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoute_prime/desktop_widgets/side_menu/sidemenu_item.dart';

/// Menu thats used by the user for navigating from one screen to another (or [routes] if you want to be exact)
class DesktopSidemenu extends StatefulWidget {
  /// check if [DesktopSidemenu] is toggled on open or compact
  bool toggleOpen = false;

  @override
  State<StatefulWidget> createState() => _DesktopSidemenuState();
}

class _DesktopSidemenuState extends State<DesktopSidemenu> {

  @override
  void initState() {
    super.initState();
  }

  /// match width to [DesktopSidemenu]s toggled mode
  double getCurrWidth(toggleOpen) {
    if(toggleOpen) {
      return 70.w;
    }
    else{
      return 12.w;
    }
  }

  @override
  Widget build(BuildContext context) {
    Icon? menuIcon;

    return AnimatedContainer(
      //TODO: add stuff like decoration or headers

      duration: const Duration(milliseconds: 50),
      width: getCurrWidth(widget.toggleOpen),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Theme.of(context).backgroundColor,
            width: double.infinity,
            height: double.infinity,
          ),
          /// column with all the widgets of the list
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Material(
                  color: Theme.of(context).backgroundColor,
                  child: IconButton(
                    onPressed: () => setState(() => widget.toggleOpen = !widget.toggleOpen), 
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 8.w,
                    ),
                ),
              ),
              DesktopSidemenuItem(
                title: "title", 
                icon: Icons.settings, 
                route: "/",
                isExpanded: widget.toggleOpen,
              ),
              DesktopSidemenuItem(
                title: "title", 
                icon: Icons.settings, 
                route: "/",
                isExpanded: widget.toggleOpen,
              ),
              DesktopSidemenuItem(
                title: "title", 
                icon: Icons.settings, 
                route: "/",
                isExpanded: widget.toggleOpen,
              ),
            ]
          )
        ]
      ),
    );
  }
}
