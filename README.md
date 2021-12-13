# scale_button

A customizable and easy-to-use animation button library for Flutter. Compatible with Android & iOS & Web. :smiley:

[![pub](https://img.shields.io/pub/v/scale_button)](https://pub.dev/packages/scale_button)



<br>

## Showcase

<img src = "https://user-images.githubusercontent.com/55150540/145807932-1500e1ad-745c-4ac5-bf9e-588a4760b414.gif" width = 200>

<br>

## Getting Started

In the pubspec.yaml of your flutter project, add the following dependency:
```yaml
dependencies:
  ...
  scale_button : "^lastest_version"
```

<br>

## Usage
Need to include the import the package to the dart file where it will be used, refer the below command
```dart
import 'package:scale_button/scale_button.dart';
```

<br>

## Complete example
```dart
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

```
