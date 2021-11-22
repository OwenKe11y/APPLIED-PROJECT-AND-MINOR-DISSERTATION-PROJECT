import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/icons/background.jpg",
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      height: 300,
                      width: 300,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 25,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextField(
                            autocorrect: false,
                            autofocus: false,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Username',
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: EdgeInsets.all(10.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 25,
                            ),
                            child: TextField(
                              autocorrect: false,
                              autofocus: false,
                              obscureText: false,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: EdgeInsets.all(10.0),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(padding: EdgeInsets.all(20)),
                              Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          MaterialButton(
                            onPressed: () {},
                            minWidth: 250,
                            splashColor: Colors.green,
                            color: Colors.red,
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
