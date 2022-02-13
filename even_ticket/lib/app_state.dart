import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier{


  int selectedCatagoryID = 0;

  void updateCatagoryID(int selectedCatagoryID){
    this.selectedCatagoryID = selectedCatagoryID;
    notifyListeners();
  }
}