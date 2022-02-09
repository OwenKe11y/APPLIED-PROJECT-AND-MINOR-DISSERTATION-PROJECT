// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/controllers/navigation_controller.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/pages/authentication/register_page.dart';
import 'package:even_ticket/pages/home/home.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/services/google_signin_api.dart';
import 'package:even_ticket/utils/local_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
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
                            navigationController.navigateTo(registerRoute),
                        icon: FaIcon(FontAwesomeIcons.mailBulk, color: light),
                        label: CustomText(
                          text: ' Sign Up using email',
                          size: 16,
                          color: light,
                          fontWeight: FontWeight.bold,
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
                        ),
                        onPressed: () => signIn(context),
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

  Future signIn(BuildContext context) async {
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
      Get.offAll(() => SiteLayout());
    }
  }
}
