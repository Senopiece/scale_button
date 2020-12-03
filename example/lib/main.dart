import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:scale_button/scale_button.dart';

void main() {
  runApp(MaterialApp(
    home: ExampleScreen(),
  ));
}

class ExampleScreen extends StatefulWidget {
  @override
  _ExampleScreenState createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Scale Button Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleButton(
              child: Text(
                "Basic",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 14.0,
            ),
            ScaleButton(
              reverse: true,
              child: Text(
                "Basic (reverse)",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 36.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleButton(
                  buttonDecoration: ButtonDecoration(
                    height: 100.0,
                    width: 150.0,
                    boxDecoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  bound: 0.5,
                  duration: Duration(milliseconds: 1500),
                  child: Text(
                    "Custom Button",
                    style: TextStyle(color: Colors.white, fontSize: 11.0),
                  ),
                ),
                ScaleButton(
                  buttonDecoration: ButtonDecoration(
                      height: 100.0,
                      width: 150.0,
                      boxDecoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        shape: BoxShape.circle,
                      )),
                  child: Text(
                    "Custom Button",
                    style: TextStyle(color: Colors.white, fontSize: 11.0),
                  ),
                  bound: 0.8,
                  reverse: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
