import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier {
  int selectedCatagoryID = 0;
  List cataList = [];

  void displayCatagoryID(int selectedCatagoryID){
    this.selectedCatagoryID = selectedCatagoryID;
    notifyListeners();
  }

  void updateCatagoryID(int selectedCatagoryID) {
    this.selectedCatagoryID = selectedCatagoryID;
    if (cataList.contains(selectedCatagoryID)) {
    } else {
      cataList.add(selectedCatagoryID);
    }
    
    notifyListeners();
  }

  void deleteCatagoryID(int selectedCatagoryID) {
    this.selectedCatagoryID = selectedCatagoryID;
    cataList.remove(selectedCatagoryID);
    print(cataList);
    notifyListeners();
  }
}
