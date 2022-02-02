// ignore_for_file: unused_import, prefer_const_constructors

import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/catagory.dart';
import 'package:even_ticket/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final Catagory category;

  const CategoryWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0x99FFFFFF), width: 3),
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            category.icon,
            color: Colors.white,
            size: 40,
          ),
          CustomText(
              text: category.name,
              size: 16,
              color: light,
              fontWeight: FontWeight.bold)
        ],
      ),
    );
  }
}
