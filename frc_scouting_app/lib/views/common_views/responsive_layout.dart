import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget{

  const ResponsiveLayout({
    required this.mobileChild,
    required this.desktopChild
  });

  final Widget mobileChild;
  final Widget desktopChild;
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth < 600){
          return mobileChild;
        }
        else {
          return desktopChild;
        }
      }
    );
  }

}