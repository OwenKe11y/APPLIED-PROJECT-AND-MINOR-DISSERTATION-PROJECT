import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class LoginViewPage extends StatelessWidget {
  const LoginViewPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      child: CustomText(text: "Login", size: 40, color: darkGrey, fontWeight: FontWeight.bold),
    );
  }
}