// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/controllers/menu_controller.dart';
import 'package:even_ticket/controllers/navigation_controller.dart';
import 'package:even_ticket/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'services/http_methods.dart';

// Main method, use GetX for the Controllers and run the App
Future<void> main() async {
  Get.put(MenuController());
  Get.put(NavigationController());
  await getEvents();
  runApp(MyApp());
}

// Class for top of hierarchy settings such as theme colour and Webpage name
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "EvenTicket",
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
        }),
        primaryColor: Color(0xFF64ff38),
      ),
      // Gets the responsive layout from layout.dart depending on the screen size
      home: SiteLayout(),
    );
  }
}
