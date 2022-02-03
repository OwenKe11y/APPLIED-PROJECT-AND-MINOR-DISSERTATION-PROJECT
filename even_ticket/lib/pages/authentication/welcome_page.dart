// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/pages/authentication/register_page.dart';
import 'package:even_ticket/widgets/auth_widgets/welcome_card.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        
        child: Stack(
          
          children: [
          ClipPath(
              clipper: LoginClipper(),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
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
          Padding(
            padding: EdgeInsets.all(22.0),
            child: WelcomeCard(),
          ),
        ]),
      ),
    );
  }
}
