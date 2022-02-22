import 'package:even_ticket/utils/application_navigator.dart';
import 'package:flutter/material.dart';

// Class for rendering the pages in a Small Screen layout
class SmallScreen extends StatelessWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Only returns the localNavigator, you'd think this class would be redundant since layout.dart does the same thing... 
    // Do not delete this class, it is essential
    return localNavigator();
  }
}
