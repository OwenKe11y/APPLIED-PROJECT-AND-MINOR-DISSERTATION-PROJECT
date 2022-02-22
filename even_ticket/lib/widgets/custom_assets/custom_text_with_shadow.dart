// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:even_ticket/constants/style.dart';
import 'package:flutter/material.dart';

class CustomTextWithShadows extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;

  const CustomTextWithShadows(
      {Key? key,
      required this.text,
      required this.size,
      required this.color,
      required this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 2.0,
            color: darkGrey,
          ),
        ],
      ),
    );
  }
}
