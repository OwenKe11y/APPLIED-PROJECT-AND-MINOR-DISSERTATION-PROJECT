// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:even_ticket/widgets/custom_assets/custom_text.dart';
import 'package:even_ticket/widgets/auth_widgets/register_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatelessWidget {
  static final nameController = TextEditingController();
  static final emailController = TextEditingController();
  static final pass1Controller = TextEditingController();
  static final pass2Controller = TextEditingController();

  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkgreen,
        title: CustomText(text: "Register", size: 20, color: light, fontWeight: FontWeight.bold, textAlign: TextAlign.center,), 
      ),

      // Avoids pushing content to overload when keyboard shows up
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(children: [
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
            child: RegisterCard(),
          )
        ]),
      ),
    );
  }
}
