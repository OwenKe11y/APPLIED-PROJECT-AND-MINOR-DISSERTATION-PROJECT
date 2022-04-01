import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'user_camera_view.dart';
import 'painters/face_detector_painter.dart';

class UserFaceDetectorView extends StatefulWidget {
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
    return UserCameraView(
      onImage: (inputImage) {
        processImage(inputImage);
      },
      initialDirection: CameraLensDirection.back,
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    if (isBusy) return;
    isBusy = true;
    final faces = await faceDetector.processImage(inputImage);
    print('Found ${faces.length} faces');
    if (faces.length == 1) {
      print("Detected 1 face, photo okay to use");
    } else if (faces.length > 1) {
      print("Detected too many faces, try again");
    } else {
      print("Couldn't detect a face, try again");
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
}
