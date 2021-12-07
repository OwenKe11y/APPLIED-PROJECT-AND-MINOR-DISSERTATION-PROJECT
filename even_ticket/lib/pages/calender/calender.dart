import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CalenderViewPage extends StatelessWidget {
  const CalenderViewPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(text: "Calender", size: 40, color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
    );
  }
}