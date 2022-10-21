import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// [DesktopSidemenuItem] is a widget that builds a button for [DesktopSidemenu]
class DesktopSidemenuItem extends StatefulWidget {

  /// title of [DesktopSidemenuItem]
  final String title;

  /// icon of [DesktopSidemenuItem]
  final IconData icon;

  /// url route to navigate to when tapping on [DesktopSidemenuItem]
  final String route;

  /// flag that checks when [DesktopSidemenu] is toggled on open or closed
  final bool isExpanded;

  const DesktopSidemenuItem({
    required this.title,
    required this.icon,
    required this.route,
    required this.isExpanded,
    super.key
  });

  @override
  State<StatefulWidget> createState() => _DesktopSidemenuItemState();
}

class _DesktopSidemenuItemState extends State<DesktopSidemenuItem> {
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
  }

  /// select the color of [DesktopSidemenuItem] when selected, hovered or neither
  Color _setColor() {
    if(_isHovered) {
      return Theme.of(context).hoverColor.withOpacity(0.5);
    }
    return Theme.of(context).backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      /// Inkwell MUST be wrapped with a Material widget 
      /// (can also be wrapped with some other widget, but must be wrapped)
      child: InkWell(
        /// when hovered over, change is hovered to True
        onHover: (value) => setState(() {
          _isHovered = value;
        }),
        
        /// on tap change url route
        onTap: () => Navigator.popAndPushNamed(context, widget.route),
    
        /// ui of item
        child: Container(
          height: 50.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: _setColor(),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Icon(
                  widget.icon  
                ),
              ),
              if(widget.isExpanded) 
                Expanded(
                  child: Text(
                    widget.title
                  ),
                )
            ],
          ),
        )
      ),
    );
  }
}
