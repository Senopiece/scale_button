# scale_button

Easy-to-use animation button library for Flutter.


## Showcase

<img src = "https://user-images.githubusercontent.com/55150540/100977695-b004ec80-3584-11eb-8700-a74c9bf0c605.gif" width = 200>

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
                  onTap: () {
                    print("Hello, World!");
                  },
                  buttonDecoration: ButtonDecoration(
                    height: 100.0,
                    width: 150.0,
                    boxDecoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      shape: BoxShape.circle,
                    ),
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

```
