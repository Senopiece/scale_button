import 'package:flutter/material.dart';

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
              boxDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(24.0)),
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
              boxDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(24.0)),
            ),
            SizedBox(
              height: 36.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleButton(
                  height: 100.0,
                  width: 150.0,
                  boxDecoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  bound: 0.5,
                  duration: Duration(milliseconds: 1500),
                  child: Text(
                    "Custom Button",
                    style: TextStyle(color: Colors.white, fontSize: 11.0),
                  ),
                ),
                ScaleButton(
                  onTap: () {
                    print("Hello, World!");
                  },
                  height: 100.0,
                  width: 150.0,
                  boxDecoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "Custom Button\n(reverse)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.0,
                    ),
                    textAlign: TextAlign.center,
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
