// ignore_for_file: prefer_const_constructors
import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:even_ticket/utils/application_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../custom_assets/custom_text.dart';

class RegisterCard extends StatefulWidget {
  const RegisterCard({Key? key}) : super(key: key);

  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
  Key key = UniqueKey();

  @override
  void initState() {
    super.initState();

    if (mounted) {
      setState(() {
        //this is really dumb, but it works -OK
        nameController.clear();
        emailController.clear();
        pass1Controller.clear();
        pass2Controller.clear();
      });
    }
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pass1Controller = TextEditingController();
  final pass2Controller = TextEditingController();
  bool isOrganiser = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: light,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Divider
                  SizedBox(
                    height: 30,
                  ),

                  // Subtitle of Container
                  Row(
                    children: [
                      CustomText(
                        text: "Sign up using the form below",
                        size: 20,
                        color: darkGrey,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),

                  // Divider
                  SizedBox(
                    height: 15,
                  ),

                  // Email Text Field
                  TextField(
                    key: Key('name'),
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
                    key: Key('Email'),
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
                      Checkbox(
                          activeColor: mainColour,
                          value: isOrganiser,
                          onChanged: (bool? value) {
                            setState(() {
                              isOrganiser = value!;
                            });
                          }),
                      CustomText(
                        text: "Are you an Organiser?",
                        size: 16,
                        color: darkGrey,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),

                  //Divider
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
                      createUser(nameController.text, emailController.text,
                          pass1Controller.text, isOrganiser, "none"),
                      loginNavController.navigateTo(loginRoute)
                    },
                    child: CustomText(
                      text: 'Register',
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
                            text: "Already have an account? ",
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
                    onPressed: () async {
                      if (nameController.text.isNotEmpty) {
                        final result = await showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text("Unsaved Changes"),
                            content: Text(
                                "Leaving the page will erase all inputted data, Continue?"),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () => {
                                        Navigator.pop(context),
                                        loginNavController.goBack(),
                                        loginNavController
                                            .navigateTo(loginRoute)
                                      },
                                  child: Text("Leave")),
                              TextButton(
                                  onPressed: () => {Navigator.pop(context)},
                                  child: Text("Cancel")),
                            ],
                          ),
                        );
                        return result;
                      } else {
                        loginNavController.goBack();
                        loginNavController.navigateTo(loginRoute);
                      }
                    },
                    child: CustomText(
                      text: 'Log in',
                      size: 16,
                      color: light,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 15,
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
