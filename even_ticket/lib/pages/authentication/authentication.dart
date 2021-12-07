// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginViewPage extends StatelessWidget {
  const LoginViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Background Colour
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Colors.green.shade900,
            Colors.green,
            Colors.green.shade200
          ])),

      // Body of Login Form
      child: Scaffold(
        body: Center(

          // Logo Image
          child: Container(
            constraints: BoxConstraints(maxWidth: 800, maxHeight: 850),
            padding: EdgeInsets.all(30),
            color: light,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Image.asset('assets/icons/biglogo.png'),
                    ),
                  ),
                ]),

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
                  labelText: "Email",
                  hintText: "example@email.com",
                )),

                // Divider
                SizedBox(
                  height: 15,
                ),

                // Password Text Field
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
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
                    Get.offAll(() => SiteLayout());
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
        ),
      ),
    );
  }
}
