// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/main.dart';
import 'package:even_ticket/utils/application_navigator.dart';
import 'package:even_ticket/utils/responsiveness.dart';
import 'package:even_ticket/widgets/screen_sizes/large_screen.dart';
import 'package:even_ticket/widgets/screen_sizes/medium_screen.dart';
import 'package:even_ticket/widgets/side_menu/side_menu.dart';
import 'package:even_ticket/widgets/custom_assets/top_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          // Change the body of the page depending on the screen size
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
            WillPop()
          ])),
    );
  }
}

class WillPop extends StatelessWidget {
  const WillPop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final result = await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text("Exit Application?"),
            content: Text("Would you like to log out and return to the login page?"),
            actions: <Widget>[
              TextButton(
                onPressed: () => {
                  Get.offAll(() => AppStart())
                },
              child: Text("Yes")),
              TextButton(
                onPressed: () => {
                  Navigator.pop(context)
                },
              child: Text("No")),
            ],
          ),
        );
        return result;
      },
      child: localNavigator(),
      
    );
    
  }
}


