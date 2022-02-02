// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_text.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 10),
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
                        "Login",
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
                          text: "Welcome Back to the admin panel",
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
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Full Name",
                    ),
                    controller: nameController,
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

                  // Email Text Field
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Repeat Password",
                    ),
                    controller: pass2Controller,
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

                  // Forget Password Text
                  CustomText(
                      text: "Forget Password?",
                      size: 16,
                      color: darkgreen,
                      fontWeight: FontWeight.bold),

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
                          text: "Login",
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
                      text: TextSpan(children: [
                    TextSpan(text: "Don't have admin credentials? "),
                    TextSpan(
                        text: "Request credentials here! ",
                        style: TextStyle(color: darkgreen)),
                  ]))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
