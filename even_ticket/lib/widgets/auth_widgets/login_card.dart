// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/user.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:even_ticket/widgets/custom_assets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/http_methods.dart';
import '../../utils/application_navigator.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  static final emailController = TextEditingController();
  static final pass1Controller = TextEditingController();
  bool _isLoading = false;

  // This function will be triggered when the button is pressed
  void _startLoading() async {
    setState(() {
      _isLoading = true;
    });

    await loginUser(emailController.text, pass1Controller.text)
        .then((value) => {
              if (value == 'PASS')
                {
                  getUser(emailController.text).then((value) => {
                        if (value == 'OK')
                          {
                            Get.offAll(() => SiteLayout(),
                                arguments: menuController
                                    .changeActiveItemTo(homePageRoute))
                          }
                        else
                          {
                            {throw Exception("Failed Login Dart")}
                          }
                      }),
                }
              else
                {throw Exception("Failed Login Dart")}
            });

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Card(
      elevation: 10,
      color: light,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            ClipRRect(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Divider
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),

                  // Subtitle of Container
                  Row(
                    children: [
                      CustomText(
                        text: "Log in using the form below",
                        size: 20,
                        color: darkGrey,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  // Divider
                  SizedBox(
                    height: 15,
                  ),

                  // Email Text Field
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "example@email.com",
                    ),
                    controller: emailController,
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  // Password Text Field
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                    controller: pass1Controller,
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: mainColour,
                        onPrimary: Colors.black,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      icon: _isLoading
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(light))
                          : FaIcon(
                              FontAwesomeIcons.doorOpen,
                              color: light,
                            ),
                      label: CustomText(
                        text: _isLoading ? ' Loading' : ' Login',
                        size: 16,
                        color: light,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () => 
                      _isLoading ? null : _startLoading()),

                  // Divider
                  SizedBox(
                    height: 15,
                  ),

                  // Admin Credentials text, right now this is just to fill up space
                  RichText(
                      textDirection: TextDirection.ltr,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(color: mainColour)),
                      ])),

                  SizedBox(
                    height: 15,
                  ),

                  // Login Button - Global navigation to the main page
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: mainColour,
                      onPrimary: Colors.black,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () => {
                      loginNavController.goBack(),
                      loginNavController.navigateTo(registerRoute),
                    },
                    child: CustomText(
                      text: 'Register',
                      size: 16,
                      color: light,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
