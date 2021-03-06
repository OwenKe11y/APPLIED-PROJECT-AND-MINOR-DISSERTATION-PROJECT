// main.dart
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/event.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/pages/purchase/purchase_page.dart';
import 'package:even_ticket/payments/loading_button.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:even_ticket/widgets/custom_assets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:even_ticket/data/user.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../widgets/event_widgets/event_widget.dart';
// payment_screen.dart

class PaymentScreen extends StatefulWidget {
  final Events events;

  const PaymentScreen({Key? key, required this.events}) : super(key: key);
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  CardDetails _card = CardDetails();
  bool? _saveCard = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    //final event = Provider.of<Events>(context);
    return Provider<Events>.value(
      value: widget.events,
      child: WillPopScope(
        onWillPop: () async {
          final result = await showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text("Notice"),
              content: Text("Cancel Payment and return to Payment Options?"),
              actions: <Widget>[
                TextButton(
                    onPressed: () => {
                          mainColour = Colors.green.shade700,
                          Get.offAll(() => PurchasePage(
                                events: widget.events,
                              ))
                        },
                    child: Text("Yes")),
                TextButton(
                    onPressed: () => {Navigator.pop(context)},
                    child: Text("No")),
              ],
            ),
          );
          return result;
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
              onPressed: () => Get.offAll(() => SiteLayout()),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  child: Provider<Events>.value(
                    value: widget.events,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                              text: "Enter card details to purchase " +
                                  widget.events.title +
                                  " ticket",
                              size: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Number'),
                          onChanged: (number) {
                            setState(() {
                              _card = _card.copyWith(number: number);
                            });
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        width: 80,
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Exp. Year'),
                          onChanged: (number) {
                            setState(() {
                              _card = _card.copyWith(
                                  expirationYear: int.tryParse(number));
                            });
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        width: 80,
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Exp. Month'),
                          onChanged: (number) {
                            setState(() {
                              _card = _card.copyWith(
                                  expirationMonth: int.tryParse(number));
                            });
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        width: 80,
                        child: TextField(
                          decoration: InputDecoration(hintText: 'CVC'),
                          onChanged: (number) {
                            setState(() {
                              _card = _card.copyWith(cvc: number);
                            });
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                CheckboxListTile(
                  value: _saveCard,
                  onChanged: (value) {
                    setState(() {
                      _saveCard = value;
                    });
                  },
                  title: Text('Save card during payment'),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: LoadingButton(
                    onPressed: () => ProccessCardDetails(),
                    text: 'Pay',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> ProccessCardDetails() async {
    await Stripe.instance.dangerouslyUpdateCardDetails(_card);

    try {
      // 1. Gather customer billing information (ex. email)

      final billingDetails = BillingDetails(
        email: currentUser.email,
        name: currentUser.name,
        address: Address(
          city: 'Houston',
          country: 'US',
          line1: '1459  Circle Drive',
          line2: '',
          state: 'Texas',
          postalCode: '77063',
        ),
      ); // mocked data for tests

      // 2. Create payment method
      final paymentMethod = await Stripe.instance
          .createPaymentMethod(PaymentMethodParams.card(
            billingDetails: billingDetails,
          ))
          .then((value) => {print(value)});
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
      rethrow;
    }

    updateTicketOwner(
        widget.events.title, currentUser.name, widget.events.organiserEmail);

    Get.offAll(() => SiteLayout());
  }
}
