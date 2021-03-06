// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/widgets/auth_widgets/welcome_card.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Avoids pushing content to overload when keyboard shows up
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          children: [
          ClipPath(
              clipper: BottomShapeClipper(),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Colors.green.shade900,
                        Colors.green,
                        Colors.green.shade200
                      ])))),
                      
          // Handles the size of the LoginCard background            
          Padding(
            padding: EdgeInsets.all(10.0),
            child: WelcomeCard(),
          ),
        ]),
      ),
    );
  }
}
