// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/user.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:even_ticket/widgets/custom_assets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/http_methods.dart';
import '../../utils/application_navigator.dart';

class LoginCard extends StatelessWidget {
  static final nameController = TextEditingController();
  static final emailController = TextEditingController();
  static final pass1Controller = TextEditingController();
  static final pass2Controller = TextEditingController();

  const LoginCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Card(
      elevation: 10,
      color: light,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
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

                  // Divider
                  SizedBox(
                    height: 15,
                  ),

                  // "Remember me" check box and text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      CustomText(
                        text: "Remember me",
                        size: 16,
                        color: darkGrey,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),

                  // Divider
                  SizedBox(
                    height: 15,
                  ),
                  // Forget Password Text
                  // Admin Credentials text, right now this is just to fill up space
                  RichText(
                      textDirection: TextDirection.ltr,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Forget password?",
                            style: TextStyle(color: mainColour)),
                      ])),

                  SizedBox(
                    height: 15,
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: mainColour,
                      onPrimary: Colors.black,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () =>
                        loginUser(emailController.text, pass1Controller.text)
                            .then((value) => {
                                  if (value == 'PASS')
                                    {
                                      getUser(emailController.text)
                                          .then((value) => {
                                                if (value == 'OK')
                                                  {
                                                   
                                                    Get.offAll(
                                                        () => SiteLayout(),
                                                        arguments: menuController
                                                            .changeActiveItemTo(
                                                                homePageRoute))
                                                  }
                                                else
                                                  {
                                                    {
                                                      throw Exception(
                                                          "Failed Login Dart")
                                                    }
                                                  }
                                              }),
                                    }
                                  else
                                    {throw Exception("Failed Login Dart")}
                                }),
                    child: CustomText(
                      text: 'Log in',
                      size: 16,
                      color: light,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                  ),

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
