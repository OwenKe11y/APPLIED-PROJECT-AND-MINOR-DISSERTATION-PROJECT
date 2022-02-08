// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/pages/authentication/register_page.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:even_ticket/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  // Divider
                  SizedBox(
                    height: 30,
                  ),

                  // Title of Container being Login
                  Row(
                    children: [
                      Text(
                        "Log in ",
                        style: GoogleFonts.roboto(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),

                  // Divider
                  SizedBox(
                    height: 30,
                  ),

                  // Subtitle of Container
                  Row(
                    children: [
                      CustomText(
                          text: "Log in using the form below",
                          size: 16,
                          color: darkGrey,
                          fontWeight: FontWeight.normal)
                    ],
                  ),

                  // Divider
                  SizedBox(
                    height: 15,
                  ),

                  // Email Text Field
                  TextField(
                    textAlign: TextAlign.center,
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
                    textAlign: TextAlign.center,
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
                          fontWeight: FontWeight.bold)
                    ],
                  ),

                  // Divider
                  SizedBox(
                    height: 15,
                  ),
                  // Forget Password Text
                  // Admin Credentials text, right now this is just to fill up space
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Forget password?",
                            style: TextStyle(color: darkgreen)),
                      ])),

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
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: CustomText(
                          text: "Log in",
                          size: 16,
                          color: light,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Divider
                  SizedBox(
                    height: 15,
                  ),

                  // Admin Credentials text, right now this is just to fill up space
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(color: darkgreen)),
                      ])),

                  SizedBox(
                    height: 15,
                  ),

                  // Login Button - Global navigation to the main page
                  InkWell(
                    onTap: () {
                      navigationController.goBack();
                      navigationController.navigateTo(registerRoute);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: darkgreen,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: CustomText(
                          text: "Register",
                          size: 16,
                          color: light,
                          fontWeight: FontWeight.bold),
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
