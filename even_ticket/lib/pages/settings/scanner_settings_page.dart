// ignore_for_file: prefer_const_constructors
import 'package:camera/camera.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/widgets/custom_assets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import '../../widgets/scanner_widgets/scanner_card.dart';


class ButtonState {
  static bool buttonActive = false;
}

class UserFaceDetectorView extends StatefulWidget {
  
  const UserFaceDetectorView({Key? key}) : super(key: key);

  @override
  _FaceDetectorViewState createState() => _FaceDetectorViewState();
}

class _FaceDetectorViewState extends State<UserFaceDetectorView> {
  FaceDetector faceDetector = GoogleMlKit.vision.faceDetector();
  bool isBusy = false;
  CustomPaint? customPaint;
  

  @override
  void dispose() {
    faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: ScannerCard(
            onImage: (inputImage) {
              processImage(inputImage);
            },
            
            initialDirection: CameraLensDirection.back,
          ),
        ),
      ],
    );
  }
  

  Future<void> processImage(InputImage inputImage) async {
    if (isBusy) return;
    isBusy = true;
    final faces = await faceDetector.processImage(inputImage);
    print('Found ${faces.length} faces');

    if(faces.length == 1){
      ButtonState.buttonActive = true;
    }
    if (faces.length > 1) {
      _showMyDialog(true);
       ButtonState.buttonActive = false;

    } else if(faces.length == 0){
     _showMyDialog(false);
      ButtonState.buttonActive = false;
  
    }
    // print(inputImage.inputImageData?.size);
    // if (inputImage.inputImageData?.size != null &&
    //     inputImage.inputImageData?.imageRotation != null) {
    //   final painter = FaceDetectorPainter(
    //       faces,
    //       inputImage.inputImageData!.size,
    //       inputImage.inputImageData!.imageRotation);
    //   customPaint = CustomPaint(painter: painter);
    // } else {
    //   customPaint = null;
    // }
    isBusy = false;
    if (mounted) {
      setState(() {});
    }

   
  }

  Future<void> _showMyDialog(bool faceDetected) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              faceDetected
              ? Text('Detected more than one face, please try again.')
              : Text('No face detected, please try again.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

}

