// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/controllers/menu_controller.dart';
import 'package:even_ticket/controllers/navigation_controller.dart';
import 'package:even_ticket/payments/stripe_main.dart';
import 'package:even_ticket/utils/application_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras = [];

// Main method, use GetX for the Controllers and run the App
Future<void> main() async {
  Stripe.publishableKey =
      'pk_test_51KRLjFLq7ImpQvpE7CUgEqLJvymGSBcQ2wwDPBPuTj1F0yzVmwLJriYN4N01RVVk0kgkKRMlULc4q1zW7v2OwP6z00F8oy9qt4';
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(MenuController());
  Get.put(LocalNavController());
  Get.put(LoginNavController());
  //cameras = await availableCameras();
  runApp(RootRestorationScope(restorationId: 'root', child: MyApp()));
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
      // Gets login page navigator
      home: AppStart(),
    );
  }
}

class AppStart extends StatelessWidget {
  const AppStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return loginNavController.goBack();
      },
      child: loginNavigator(),
    ); //
  }
}
