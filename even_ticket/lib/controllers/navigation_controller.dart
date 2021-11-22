import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// Class that handles Navigation around the app
class NavigationController extends GetxController{

  static NavigationController instance = Get.find();
  // Need a key to assign to a particular navigator so the app knows what screen we want to change to
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  // Allows user to change screens
  Future<dynamic> navigateTo(String routeName){
    return navigationKey.currentState!.pushNamed(routeName);
  }

  // Allows user to go back
  goBack() => navigationKey.currentState!.pop();
}