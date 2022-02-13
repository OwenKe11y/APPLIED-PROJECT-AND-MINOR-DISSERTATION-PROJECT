// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/utils/local_navigator.dart';
import 'package:even_ticket/utils/responsiveness.dart';
import 'package:even_ticket/utils/splash_navigator.dart';
import 'package:even_ticket/widgets/screen_sizes/large_screen.dart';
import 'package:even_ticket/widgets/screen_sizes/medium_screen.dart';
import 'package:even_ticket/widgets/side_menu/side_menu.dart';
import 'package:even_ticket/widgets/top_nav.dart';
import 'package:flutter/material.dart';

// Class for determining responsive page layout, out putting the correct screen depending on the size
class SiteLayout extends StatelessWidget {
  const SiteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    // Always render the top bar regardless of page size
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Scaffold(
          
          key: scaffoldKey,
          extendBodyBehindAppBar: true,
          appBar: topNavBar(context, scaffoldKey),
          drawer: Drawer(
            child: SideMenu(),
          ),
          // Chnage the body of the page depending on the screen size
          body: Stack(children: [
            ResponsiveWidget(
                largeScreen: LargeScreen(),
                mediumScreen: MediumScreen(),
                smallScreen:
                    // This container renders page background colour, !!DO NOT FORGET THIS!!
                    ClipPath(
                  clipper: BottomShapeClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                  
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                          Colors.green.shade900,
                          Colors.green,
                          Colors.green.shade200
                        ])),
                   
                  ),
                )),
                 Container(
             
              child: localNavigator(),
            )
          ])),
    );
  }
}

class WelcomeLayout extends StatelessWidget {
  const WelcomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    // Always render the top bar regardless of page size
    return Scaffold(
        key: scaffoldKey,
        // Chnage the body of the page depending on the screen size
        body: ResponsiveWidget(
            largeScreen: LargeScreen(),
            mediumScreen: MediumScreen(),
            smallScreen:
                // This container renders page background colour, !!DO NOT FORGET THIS!!
                ClipPath(
              child: Container(
                child: splashNavigator(),
              ),
            )));
  }
}

class BottomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = Offset(0, size.height * 0.85);
    Offset curveEndPoint = Offset(size.width, size.height * 0.85);

    path.lineTo(curveStartPoint.dx, curveStartPoint.dy);
    path.quadraticBezierTo(
        size.width / 2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
