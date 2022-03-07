// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/controllers/navigation_controller.dart';
import 'package:even_ticket/data/event.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/pages/authentication/register_page.dart';
import 'package:even_ticket/pages/home/home.dart';
import 'package:even_ticket/payments/stripe_main.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/services/google_signin_api.dart';
import 'package:even_ticket/utils/application_navigator.dart';
import 'package:even_ticket/widgets/home_widgets/event_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

import '../custom_assets/custom_text.dart';

class PaymentCard extends StatefulWidget {
  final Events events;

  const PaymentCard({Key? key, required this.events}) : super(key: key);

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  final _paymentItems = <PaymentItem>[];
  int _currentValue = 1;
  double _ticketPrice = 10.00;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.39,
            width: screenWidth,
            child: Provider<Events>.value(
              value: widget.events,
              child: Stack(
                children: [EventWidget(events: widget.events)],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.14,
            width: screenWidth,
            child: Card(
              elevation: 10,
              color: light,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Container(
                        width: screenWidth * 0.445,
                        height: screenHeight * 0.15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                                text: "Standard Ticket",
                                size: 20,
                                color: darkGrey,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.center),
                            CustomText(
                                text: "€" +
                                    (_ticketPrice).toString() +
                                    " x " +
                                    (_currentValue).toString() +
                                    " = " +
                                    "€" +
                                    (_ticketPrice * _currentValue).toString(),
                                size: 16,
                                color: lightGrey,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.center),
                          ],
                        )),
                    Container(
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.15,
                      child: Row(
                        children: [
                          VerticalDivider(
                            thickness: 1,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: SizedBox(
                              width: 75,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: NumberPicker(
                                  textStyle: TextStyle(fontSize: 30),
                                  selectedTextStyle:
                                      TextStyle(fontSize: 40, color: darkgreen),
                                  value: _currentValue,
                                  minValue: 1,
                                  maxValue: 20,
                                  onChanged: (value) =>
                                      setState(() => _currentValue = value),
                                ),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.35,
            width: screenWidth,
            child: Card(
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
                            height: 30,
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
                            icon: FaIcon(FontAwesomeIcons.creditCard,
                                color: light),
                            label: CustomText(
                              text: ' Pay with card',
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
                                      text: "Alternatively",
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
                              primary: Colors.amber,
                              onPrimary: Colors.black,
                              minimumSize: Size(double.infinity, 50),
                            ),
                            onPressed: () =>
                                loginNavController.navigateTo(registerRoute),
                            icon:
                                FaIcon(FontAwesomeIcons.bitcoin, color: light),
                            label: CustomText(
                              text: ' Pay with Crypto',
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
                          GooglePayButton(
                            paymentConfigurationAsset: 'gpay.json',
                            paymentItems: _paymentItems,
                            width: 200,
                            height: 50,
                            style: GooglePayButtonStyle.black,
                            type: GooglePayButtonType.pay,
                            margin: const EdgeInsets.only(top: 15.0),
                            onPaymentResult: (data) {
                              print(data);
                            },
                            loadingIndicator: const Center(
                              child: CircularProgressIndicator(),
                            ),
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
          ),
        ],
      ),
    );
  }
}
