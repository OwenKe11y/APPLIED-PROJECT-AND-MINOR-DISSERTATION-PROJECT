int selectedCatagoryID = 0;
List cataList = [];

void displayCatagoryID(int selectedCatagoryID) {
  selectedCatagoryID = selectedCatagoryID;
}

void updateCatagoryID(int selectedCatagoryID) {
  selectedCatagoryID = selectedCatagoryID;
  if (cataList.contains(selectedCatagoryID)) {
  } else {
    cataList.add(selectedCatagoryID);
  }
}

void deleteCatagoryID(int selectedCatagoryID) {
  cataList.remove(selectedCatagoryID);
  print(cataList);
}

List getCataList() {
  return cataList;
}
