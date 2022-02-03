// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/services/google_signin_api.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../custom_text.dart';

class WelcomeCard extends StatelessWidget {
  static final nameController = TextEditingController();
  static final emailController = TextEditingController();
  static final pass1Controller = TextEditingController();
  static final pass2Controller = TextEditingController();

  const WelcomeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: light,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Divider
                  SizedBox(
                    height: 15,
                  ),

                  // Login Button - Global navigation to the main page
                  InkWell(
                    onTap: () {
                      //Get.offAll(SiteLayout());

                      createUser(nameController.text, emailController.text,
                          pass1Controller.text, pass2Controller.text);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: darkgreen,
                      ),
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: CustomText(
                          text: "Sign up with Email",
                          size: 16,
                          color: light,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Divider
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    icon: Icon(const IconData(0x41, fontFamily: 'Roboto'),
                        size: 48.0, color: Colors.red),
                    label: Text('Sign Up with Google'),
                    onPressed: signIn,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    await GoogleSignInApi.login();
  }
}
