// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/user.dart';
import 'package:even_ticket/main.dart';
import 'package:even_ticket/services/http_methods.dart';
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
  const SiteLayout({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 0.5;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    // Always render the top bar regardless of page size
    return Scaffold(
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
                      child: currentUser.isOrganiser
                          ? setColour(Colors.purple.shade700, screenHeight)
                          : setColour(Colors.green.shade700, screenHeight))),
          WillPop()
        ]));
  }
}

Widget? setColour(Color newColour, double height) {
  mainColour = newColour;

  return currentUser.isOrganiser
      ? Container(
          height: height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.purple.shade900,
                Colors.purple,
                Colors.purple.shade200
              ])),
        )
      : Container(
          height: height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.green.shade900,
                Colors.green,
                Colors.green.shade200
              ])),
        );
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
            content:
                Text("Would you like to log out and return to the login page?"),
            actions: <Widget>[
              TextButton(
                  onPressed: () => {
                    mainColour = Colors.green.shade700,
                    Get.offAll(() => AppStart())
                    },
                  child: Text("Yes")),
              TextButton(
                  onPressed: () => {Navigator.pop(context)}, child: Text("No")),
            ],
          ),
        );
        return result;
      },
      child: localNavigator(),
    );
  }
}

Future<void> eventLoad() async {
  await getEvents();
}
