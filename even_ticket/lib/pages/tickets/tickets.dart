import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class TicketViewPage extends StatelessWidget {
  const TicketViewPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(text: "My Tickets", size: 40, color: darkGrey, fontWeight: FontWeight.bold),
    );
  }
}