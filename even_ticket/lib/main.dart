// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:even_ticket/controllers/menu_controller.dart';
import 'package:even_ticket/controllers/navigation_controller.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Get.put(MenuController());
  Get.put(NavigationController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "EvenTicket",
      theme: ThemeData(
        scaffoldBackgroundColor: darkGrey,
        textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
        }),
        primaryColor: Color(0xFF64ff38),
      ),
      home: SiteLayout(),
    );
  }
}
