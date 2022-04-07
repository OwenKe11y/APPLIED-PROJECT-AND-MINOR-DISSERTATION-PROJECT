// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:even_ticket/app_state.dart';
import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/data/event.dart';
import 'package:even_ticket/data/user.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/widgets/custom_assets/custom_text.dart';
import 'package:even_ticket/widgets/scanner_widgets/scanner_organisers_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../constants/style.dart';
import '../../main.dart';

class CameraView extends StatefulWidget {
  const CameraView(
      {Key? key,
      required this.onImage,
      this.initialDirection = CameraLensDirection.back})
      : super(key: key);

  final Function(InputImage inputImage) onImage;
  final CameraLensDirection initialDirection;

  @override
  _ScannerCameraViewState createState() => _ScannerCameraViewState();
}

class _ScannerCameraViewState extends State<CameraView> {
  File? _image;
  ImagePicker? _imagePicker;
  double zoomLevel = 0.0, minZoomLevel = 0.0, maxZoomLevel = 0.0;
  String? _selectedLocation;
  

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Events event;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return localNavController.goBack();
      },
      child: SafeArea(
          child: Column(children: [
        
        Card(
          margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          elevation: 4,
          color: light,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24))),
          child: Column(
            children: [
              
              _image != null
                  ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                    child: SizedBox(
                        height: 400,
                        width: 400,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.file(_image!),
                          ],
                        ),
                      ),
                  )
                  : Icon(
                      Icons.image,
                      size: 400,
                    ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: mainColour,
                    onPrimary: light,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Take a picture'),
                  onPressed: _selectedLocation == null
                  ? null
                  : () => {_getImage(ImageSource.camera)}
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: mainColour,
                      onPrimary: light,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text('Confirm'),
                    onPressed: ButtonState.buttonActive
                        ? () => {
                              ButtonState.buttonActive = false,
                              localNavController.navigateTo(homePageRoute)
                            }
                        : null),
              ),
            ],
          ),
        ),
        const Spacer(),
        Card(
          color: mainColour,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ChangeNotifierProvider<AppState>(
                create: (_) => AppState(),
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight* 0.01, horizontal: screenWidth * 0.1),
                        child: Consumer<AppState>(
                          builder: (context, appstate, _) => Column(
                            children: [
                              DropdownButton<String>(
                                isExpanded: true,
                                style: TextStyle(
                                  color: light
                                ),
                                dropdownColor: mainColour,
                                 hint: CustomText(text: "Select an event to scan for", size: 16, color: light, fontWeight: FontWeight.w600, textAlign: TextAlign.center),
                                value: _selectedLocation,
                                items: <String>[
                                  for (event in events.where((element) =>
                                      element.organiserEmail ==
                                      currentUser.email))
                                    event.title
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedLocation = newValue;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ])),
    );
  }

  Future _getImage(ImageSource source) async {
    final pickedFile = await _imagePicker?.getImage(source: source);
    if (pickedFile != null) {
      //_startLiveFeed();
      _processPickedFile(pickedFile);
    } else {
      print('No image selected.');
    }
    setState(() {});
  }

  Future _processPickedFile(PickedFile pickedFile) async {
    setState(() {
      _image = File(pickedFile.path);
    });
    final inputImage = InputImage.fromFilePath(pickedFile.path);
    widget.onImage(inputImage);
  }
}
