// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/user.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:even_ticket/widgets/categoryList.dart';
import 'package:even_ticket/widgets/custom_assets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import '../../app_state.dart';
import '../../data/catagory.dart';
import '../../services/http_methods.dart';
import '../../utils/application_navigator.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

import '../home_widgets/catagory_widget.dart';

class EventGenCard extends StatefulWidget {
  const EventGenCard({Key? key}) : super(key: key);

  @override
  State<EventGenCard> createState() => _EventGenCardState();
}

class _EventGenCardState extends State<EventGenCard> {
  //final _formKey = GlobalKey<FormState>();

  var imageFile;
  List<int> categoryIdArray = [];
  List<File> imageFileList = [];

  final titleController = TextEditingController();
  static final descriptionController = TextEditingController();
  static final priceController = TextEditingController();
  static final locationController = TextEditingController();
  static final timeController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  static final punchLine1Controller = TextEditingController();
  static final punchline2Controller = TextEditingController();

  Widget _title() {
    return (titleController.text.isEmpty)
        ? CustomText(
            text: "Insert a Title",
            size: 30,
            color: lightGrey,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center)
        : CustomText(
            text: titleController.text,
            size: 30,
            color: darkGrey,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center);
  }

  /// Get from gallery
  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from gallery
  _getFromGalleryMulti() async {
    List<XFile>? pickedFile = await ImagePicker().pickMultiImage(
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      setState(() {
        for (XFile file in pickedFile) {
          imageFileList.add(File(file.path));
        }
      });
    }
  }

  Widget _imageSection() {
    return (imageFile == null)
        ? Image.asset(
            'assets/icons/background.jpg',
            height: 100,
            fit: BoxFit.fitWidth,
          )
        : Image.file(
            imageFile,
            height: 100,
            fit: BoxFit.fitWidth,
          );
  }

  Widget _imageSectionMulti() {
    return (imageFileList.isEmpty)
        ? CustomText(
            text: "Image Gallary Empty",
            size: 20,
            color: lightGrey,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center)
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var image in imageFileList)
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 32),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.file(image,
                          width: 180, height: 180, fit: BoxFit.cover),
                    ),
                  )
              ],
            ),
          );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  int _currentValue = 1;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: screenHeight * 0.43,
          width: screenWidth,
          child: Card(
              margin: EdgeInsets.symmetric(vertical: 25),
              elevation: 4,
              color: light,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: _imageSection()),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _title(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      FittedBox(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: darkGrey,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            CustomText(
                                              color: darkGrey,
                                              text: locationController.text,
                                              size: 16,
                                              fontWeight: FontWeight.w300,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ),
                                      FittedBox(
                                        child: Row(
                                          children: [
                                            Icon(Icons.attach_money_sharp,
                                                color: darkGrey),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            CustomText(
                                              color: darkGrey,
                                              text: priceController.text,
                                              size: 16,
                                              fontWeight: FontWeight.w300,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ),
                                      FittedBox(
                                        child: Row(
                                          children: [
                                            Icon(
                                                Icons
                                                    .access_time_filled_outlined,
                                                color: darkGrey),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            CustomText(
                                              color: darkGrey,
                                              text:
                                                  "${selectedTime.hour}:${selectedTime.minute}",
                                              size: 16,
                                              fontWeight: FontWeight.w300,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      )
                                    ])),
                          ],
                        ),
                      )
                    ],
                  ))),
        ),
        SizedBox(
          height: screenHeight * 0.45,
          width: screenWidth,
          child: SingleChildScrollView(
            child: Card(
              elevation: 10,
              color: light,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                      child: Column(
                        children: [
                          // Divider
                          SizedBox(
                            height: screenHeight * 0.04,
                          ),

                          // Subtitle of Container
                          Row(
                            children: [
                              CustomText(
                                text: "Create an Event",
                                size: 20,
                                color: darkGrey,
                                fontWeight: FontWeight.w700,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),

                          SizedBox(
                            height: screenHeight * 0.04,
                          ),

                          Row(
                            children: const [
                              CustomText(
                                text: "Event Picture",
                                size: 14,
                                color: Color.fromARGB(255, 117, 112, 112),
                                fontWeight: FontWeight.w100,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),

                          // Divider
                          SizedBox(
                            height: 15,
                          ),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: mainColour,
                              onPrimary: light,
                              minimumSize: Size(double.infinity, 50),
                            ),
                            onPressed: () {
                              _getFromGallery();
                            },
                            child: Text("PICK FROM CAMERA"),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          // Event title Field
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLength: 15,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a title';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Title",
                            ),
                            controller: titleController,
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          // Description Text Field
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a description';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Description",
                            ),
                            controller: descriptionController,
                          ),

                          // Ticket Price Text Field
                          TextFormField(
                            keyboardType: TextInputType.number,
                            maxLines: null,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a price for a ticket';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Ticket Price",
                            ),
                            controller: priceController,
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          Row(
                            children: const [
                              CustomText(
                                text: "Number of Tickets ",
                                size: 16,
                                color: Color.fromARGB(255, 117, 112, 112),
                                fontWeight: FontWeight.w100,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: NumberPicker(
                              textStyle: TextStyle(fontSize: 20),
                              selectedTextStyle:
                                  TextStyle(fontSize: 40, color: mainColour),
                              value: _currentValue,
                              axis: Axis.horizontal,
                              minValue: 1,
                              maxValue: 100,
                              onChanged: (value) =>
                                  setState(() => _currentValue = value),
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          // Password Text Field
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Location",
                            ),
                            controller: locationController,
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          TextField(
                            maxLines: null,
                            decoration: InputDecoration(
                              labelText: "Punch line",
                            ),
                            controller: punchLine1Controller,
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          TextField(
                            decoration: InputDecoration(
                              labelText: "Secondary Punch Line (optional)",
                            ),
                            controller: punchline2Controller,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: const [
                              CustomText(
                                text: "Event Date",
                                size: 16,
                                color: Color.fromARGB(255, 117, 112, 112),
                                fontWeight: FontWeight.w100,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              CustomText(
                                  text:
                                      "${selectedDate.toLocal()}".split(' ')[0],
                                  size: 16,
                                  color: darkGrey,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.center),
                              SizedBox(
                                width: screenWidth * 0.40,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: mainColour,
                                  onPrimary: mainColour,
                                ),
                                onPressed: () => _selectDate(context),
                                child: CustomText(
                                  text: 'Select Date',
                                  size: 16,
                                  color: light,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          Row(
                            children: const [
                              CustomText(
                                text: "Event Time",
                                size: 16,
                                color: Color.fromARGB(255, 117, 112, 112),
                                fontWeight: FontWeight.w100,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              CustomText(
                                  text:
                                      "${selectedTime.hour}:${selectedTime.minute}",
                                  size: 16,
                                  color: darkGrey,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.center),
                              SizedBox(
                                width: screenWidth * 0.5,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: mainColour,
                                  onPrimary: mainColour,
                                ),
                                onPressed: () => _selectTime(context),
                                child: CustomText(
                                  text: 'Select Time',
                                  size: 16,
                                  color: light,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: const [
                              CustomText(
                                text: "Event Tags",
                                size: 16,
                                color: Color.fromARGB(255, 117, 112, 112),
                                fontWeight: FontWeight.w100,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ChangeNotifierProvider<AppState>(
                            create: (_) => AppState(),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Consumer<AppState>(
                                    builder: (context, appstate, _) =>
                                        SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          for (final category
                                              in catagoriesSelect)
                                            CategoryWidgetGen(
                                                category: category)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: mainColour,
                              onPrimary: light,
                              minimumSize: Size(double.infinity, 50),
                            ),
                            onPressed: () {
                              _getFromGalleryMulti();
                            },
                            child: Text("PICK MULTIPLE IMAGES"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: const [
                              CustomText(
                                text: "Event Gallery",
                                size: 14,
                                color: Color.fromARGB(255, 117, 112, 112),
                                fontWeight: FontWeight.w100,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _imageSectionMulti(),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          // Divider
                          SizedBox(
                            height: 15,
                          ),

                          // Login Button - Global navigation to the main page
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: mainColour,
                              onPrimary: light,
                              minimumSize: Size(double.infinity, 50),
                            ),
                            onPressed: () => {
                              print(getCataList()),
                              createEvent(
                                  titleController.text,
                                  descriptionController.text,
                                  priceController.text,
                                  locationController.text,
                                  selectedTime.toString(),
                                  punchLine1Controller.text,
                                  punchline2Controller.text,
                                  selectedDate,
                                  imageFile,
                                  getCataList(),
                                  imageFileList,
                                  currentUser.email,
                                  _currentValue),
                              localNavController.goBack(),
                              localNavController.navigateTo(homePageRoute),
                              menuController.changeActiveItemTo(homePageRoute)
                            },
                            child: CustomText(
                              text: 'Create Event',
                              size: 16,
                              color: light,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
