import 'package:flutter/material.dart';

Color light = Color(0xFFFFFFFF);
Color lightGrey = Color(0xFFd8dbd7);
Color darkGrey = Color(0xFF3d3d3d);
Color lightgreen = Colors.green.shade400;
Color mainColour = Colors.green.shade700;
Color active = Color(0xFFf51b1b);


class SideClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = new Offset(0, 0);
    Offset curveEndPoint = new Offset(size.width, 275);
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

class GlowAnimation extends StatefulWidget {
  @override
  _GlowState createState() => _GlowState();
}

class _GlowState extends State<GlowAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 5.0, end: 12.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
void dispose() {
  _animationController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: screenWidth * 0.28,
                            height: screenHeight * 0.05,
        decoration: BoxDecoration(shape: BoxShape.rectangle, boxShadow: [
          BoxShadow(
              color: lightgreen,
              blurRadius: _animation.value,
              spreadRadius: _animation.value)
        ]),
      ),
    );
  }
}




class SlidingAppBar extends StatelessWidget implements PreferredSizeWidget {
  SlidingAppBar({
    required this.child,
    required this.controller,
    required this.visible,
  });

  final PreferredSizeWidget child;
  final AnimationController controller;
  final bool visible;
  
  @override
  Size get preferredSize => child.preferredSize;
  
  @override
  Widget build(BuildContext context) {
    visible ? controller.reverse() : controller.forward();
    return SlideTransition(
      position: Tween<Offset>(begin: Offset.zero, end: Offset(0, -1)).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
      ),
      child: child,
    );
  }
}
