import 'package:even_ticket/widgets/scanner_widgets/scanner_card.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class ScannerViewPage extends StatelessWidget {
  const ScannerViewPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(child: ScannerCard(onImage: (InputImage inputImage) {  },));
  }
}