// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/pages/settings/scanner_settings_page.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/style.dart';

class ScannerCard extends StatefulWidget {
  const ScannerCard(
      {Key? key,
      required this.onImage,
      this.initialDirection = CameraLensDirection.back})
      : super(key: key);

  final Function(InputImage inputImage) onImage;
  final CameraLensDirection initialDirection;

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<ScannerCard> {
  File? _image;
  ImagePicker? _imagePicker;
  double zoomLevel = 0.0, minZoomLevel = 0.0, maxZoomLevel = 0.0;

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
    return WillPopScope(
      onWillPop: () async {
        return localNavController.goBack();
      },
      child: SafeArea(
          child: Column(children: [
        Card(
            margin: EdgeInsets.symmetric(vertical: 25),
            elevation: 4,
            color: light,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Column(
              children: [
                _image != null
                    ? Container(
                        height: 400,
                        width: 400,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.file(_image!),
                          ],
                        ),
                      )
                    : Icon(
                        Icons.image,
                        size: 200,
                      ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: mainColour,
                      onPrimary: light,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text('From Gallery'),
                    onPressed: () => _getImage(ImageSource.gallery),
                  ),
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
                    onPressed: () => _getImage(ImageSource.camera),
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
                          ? () =>
                              {
                                UserProfilePic.imageFile = _image, 
                                localNavController.navigateTo(settingsPageRoute)
                                }
                          : null),
                ),
              ],
            )),
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

class UserProfilePic {
    static File? imageFile;
}
