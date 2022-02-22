import 'package:flutter/material.dart';

Color light = Color(0xFFFFFFFF);
Color lightGrey = Color(0xFFd8dbd7);
Color darkGrey = Color(0xFF3d3d3d);
Color lightgreen = Colors.green.shade400;
Color darkgreen = Colors.green.shade700;
Color active = Color(0xFFf51b1b);

class SideClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = new Offset(0, 0);
    Offset curveEndPoint = new Offset(size.width, size.height * 0.99);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.95,
        curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BottomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = Offset(0, size.height * 0.85);
    Offset curveEndPoint = Offset(size.width, size.height * 0.85);

    path.lineTo(curveStartPoint.dx, curveStartPoint.dy);
    path.quadraticBezierTo(
        size.width / 2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

