import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class MapsViewPage extends StatelessWidget {
  const MapsViewPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(text: "Maps", size: 40, color: Colors.orange, fontWeight: FontWeight.bold),
    );
  }
}