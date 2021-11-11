import 'package:flutter/material.dart';

class MediumScreen extends StatelessWidget {
  const MediumScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Expanded(
              child: Container(
            color: Colors.green[500],
          )),
          Expanded(
              flex: 5,
              child: Container(
                color: Colors.yellow[400],
              ))
        ],
      );
  }
}