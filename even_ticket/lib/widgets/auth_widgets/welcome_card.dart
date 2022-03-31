// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/controllers/navigation_controller.dart';
import 'package:even_ticket/data/user.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/pages/authentication/register_page.dart';
import 'package:even_ticket/pages/home/home.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/services/google_signin_api.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:even_ticket/utils/application_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../custom_assets/custom_text.dart';

class WelcomeCard extends StatefulWidget {
  const WelcomeCard({Key? key}) : super(key: key);

  @override
  State<WelcomeCard> createState() => _WelcomeCardState();
}

class _WelcomeCardState extends State<WelcomeCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
        ),
        Card(
          elevation: 10,
          color: light,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: darkgreen,
                          onPrimary: Colors.black,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () =>
                            loginNavController.navigateTo(loginRoute),
                        icon: FaIcon(FontAwesomeIcons.doorOpen, color: light),
                        label: CustomText(
                          text: ' Log in',
                          size: 16,
                          color: light,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                      ),

                      //Divider
                      SizedBox(
                        height: 15,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Divider(
                            endIndent: 20,
                            thickness: 1,
                            color: darkgreen,
                          )),
                          Align(
                              alignment: AlignmentDirectional.center,
                              child: CustomText(
                                  text: "Don't have an account?",
                                  size: 16,
                                  color: darkgreen,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.center)),
                          Expanded(
                              child: Divider(
                            indent: 20,
                            thickness: 1,
                            color: darkgreen,
                          )),
                        ],
                      ),
                      // Admin Credentials text, right now this is just to fill up space

                      //Divider
                      SizedBox(
                        height: 15,
                      ),

                      // Login Button - Global navigation to the main page
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: darkgreen,
                          onPrimary: Colors.black,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () =>
                            loginNavController.navigateTo(registerRoute),
                        icon: FaIcon(FontAwesomeIcons.mailBulk, color: light),
                        label: CustomText(
                          text: ' Sign Up using email',
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
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: lightGrey,
                          onPrimary: Colors.black,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          color: active,
                        ),
                        label: CustomText(
                          text: ' Sign Up using Google',
                          size: 16,
                          color: light,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () => signIn(),
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
      ],
    );
  }

  Future signIn() async {
    final user = await GoogleSignInApi.login();

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign in Failed'),
        ),
      );
    } else {
      debugPrint(user.email);
      debugPrint(user.displayName);
      getUser(user.email).then((value) => {
            if (value != "OK")
              {
                createUser(user.displayName.toString(), user.email, "google",
                        false, "none")
                    .then((value) => {
                          getUser(user.email).then((value) => {
                                Get.offAll(() => SiteLayout(),
                                    arguments: menuController
                                        .changeActiveItemTo(homePageRoute))
                              })
                        }),
              }
            else
              {
                Get.offAll(() => SiteLayout(),
                    arguments: menuController.changeActiveItemTo(homePageRoute))
              }
          });
    }
  }
}
