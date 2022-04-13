// ignore_for_file: prefer_const_constructors
import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:even_ticket/utils/application_navigator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../custom_assets/custom_text.dart';

class RegisterCard extends StatefulWidget {
  const RegisterCard({Key? key}) : super(key: key);

  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
  bool _isLoading = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pass1Controller = TextEditingController();
  final pass2Controller = TextEditingController();
  bool isOrganiser = false;
  final _formKey = GlobalKey<FormState>();

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

  void _startLoading() async {
    setState(() {
      _isLoading = true;
    });
    await createUser(nameController.text, emailController.text,
        pass1Controller.text, isOrganiser, "none");
    loginNavController.navigateTo(loginRoute);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: light,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // Divider
                    SizedBox(
                      height: 15,
                    ),
                    // Name Text Field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Username",
                        hintText: "Username",
                      ),
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),

                    // Divider
                    SizedBox(
                      height: 15,
                    ),

                    // Email Text Field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "example@email.com",
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    // Password Text Field
                     TextFormField(
                            obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                      ),
                      controller: pass1Controller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),

                   
                     // Password Text Field
                     TextFormField(
                     obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Repeat Password",
                      ),
                      controller: pass2Controller,
                      validator: (value) {
                        if(pass1Controller.text != pass2Controller.text){
                            return 'Passwords do not match';
                          }
                        if (value == null || value.isEmpty ) {
                          
                          return 'Please enter some text';
                        }
                        return null;
                      },
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

                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: mainColour,
                          onPrimary: Colors.black,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        icon: _isLoading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(light))
                            : FaIcon(
                                FontAwesomeIcons.userAlt,
                                color: light,
                              ),
                        label: CustomText(
                          text: _isLoading ? ' Loading' : ' Register',
                          size: 16,
                          color: light,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _isLoading ? null : _startLoading();
                          }
                        }),

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
      ),
    );
  }
}
