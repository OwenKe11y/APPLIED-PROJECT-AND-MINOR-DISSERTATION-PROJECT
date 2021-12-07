import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/utils/responsiveness.dart';
import 'package:even_ticket/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Column(
     children: [
       Obx(()=> Row(
         children: [
         Container(
           margin: EdgeInsets.only(top: 
           ResponsiveWidget.isSmallScreen(context) ? 56 : 6
           ),
           child: CustomText(text: menuController.activeItem.value, size: 24, color: lightGrey, fontWeight: FontWeight.bold),
         ),
         ]
       ))
     ],
    );
  }
}

