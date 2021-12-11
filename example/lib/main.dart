import 'package:flutter/material.dart';

import 'package:scale_button/scale_button.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Scale Button Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleButton(
            child: Container(
              height: 48.0,
              width: 300.0,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(24.0)),
              ),
              child: Text(
                "Basic",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 14.0),
          ScaleButton(
            reverse: true,
            child: Container(
              height: 48.0,
              width: 300.0,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(24.0)),
              ),
              child: Text(
                "Basic (reverse)",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 36.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ScaleButton(
                bound: 0.5,
                duration: Duration(milliseconds: 1500),
                child: Text("Text Button"),
              ),
              ScaleButton(
                bound: 0.8,
                reverse: true,
                child: Container(
                  height: 100.0,
                  width: 150.0,
                  decoration: const BoxDecoration(
                      color: Colors.orangeAccent, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Text(
                    "Custom Button\n(reverse)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
