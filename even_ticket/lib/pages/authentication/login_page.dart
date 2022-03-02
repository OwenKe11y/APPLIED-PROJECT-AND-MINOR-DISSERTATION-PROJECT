// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:even_ticket/widgets/auth_widgets/login_card.dart';
import 'package:even_ticket/widgets/custom_assets/custom_text.dart';
import 'package:even_ticket/widgets/auth_widgets/register_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  static final nameController = TextEditingController();
  static final emailController = TextEditingController();
  static final pass1Controller = TextEditingController();
  static final pass2Controller = TextEditingController();

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
           backgroundColor: darkgreen,
           title: CustomText(text: "Login", size: 20, color: light, fontWeight: FontWeight.bold, textAlign: TextAlign.center,),
           leading: IconButton(icon:Icon(Icons.chevron_left),onPressed:() => loginNavController.goBack(),)
        ),

        // Avoids pushing content to overload when keyboard shows up
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          ClipPath(
              clipper: SideClipper(),
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

          // Handles the size of the LoginCard background
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.07),
            child: LoginCard(),
          )
        ]),
      );
  }
}


