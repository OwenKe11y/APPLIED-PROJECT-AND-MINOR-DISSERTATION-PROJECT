// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/data/event.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/pages/home/event_details.dart';
import 'package:even_ticket/widgets/purchase_widgets/payment_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../constants/style.dart';
import '../../widgets/custom_assets/custom_text.dart';

class PurchasePage extends StatelessWidget {
  final Events events;
  const PurchasePage({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => EventDetail(events: events));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColour,
          title: CustomText(
            text: "Payment",
            size: 20,
            color: light,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () => Get.offAll(EventDetail(events: events)),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.help_rounded),
              onPressed: () async {
                final result = await showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text("How do I pay?"),
                    content: Text(
                        "Select how many tickets you would like to buy and purchase with one of the various payment methods"),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () => {Navigator.pop(context)},
                          child: Text("OK")),
                    ],
                  ),
                );
                return result;
              },
            )
          ],
        ),
        // Avoids pushing content to overload when keyboard shows up
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Stack(children: [
            ClipPath(
              clipper: BottomShapeClipper(),
              child: Image(
                  image: MemoryImage(events.displayImage),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  height: screenWidth,
                  width: screenWidth * 2,
                  color: Color(0x99000000),
                  colorBlendMode: BlendMode.darken),
            ),

            // Handles the size of the LoginCard background
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.02,
                  vertical: screenHeight * 0.01),
              child: PaymentCard(
                events: events,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
