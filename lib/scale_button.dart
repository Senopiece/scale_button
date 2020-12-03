// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'package:flutter/material.dart';

class ButtonDecoration {
  double height;
  double width;
  BoxDecoration boxDecoration;

  ButtonDecoration({this.height, this.width, this.boxDecoration});
}

class ScaleButton extends StatefulWidget {
  ButtonDecoration buttonDecoration;
  Duration duration;
  double bound;
  VoidCallback onTap;
  Widget child;
  bool reverse;

  ScaleButton({this.buttonDecoration, this.duration, this.bound, this.onTap, this.child, this.reverse});

  @override
  _ScaleButtonState createState() => _ScaleButtonState();
}

class _ScaleButtonState extends State<ScaleButton> with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  AnimationController _controller;
  bool reverse;

  void initAnimationController() {
    _controller = AnimationController(
      vsync: this,
      duration: widget?.duration ?? Duration(milliseconds: 300),
      upperBound: widget?.bound ?? 0.2,
    )..addListener(() {
        setState(() {
          _scale = reverse ? 1 + _controller.value : 1 - _controller.value;
        });
      });
  }

  @override
  void initState() {
    reverse = widget.reverse ?? false;
    initAnimationController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _controller.forward();
      },
      onTapUp: (_) {
        _controller.reverse();
      },
      onTapCancel: () {
        _controller.reverse();
      },
      onTap: () {
        widget.onTap == null ? print("") : widget.onTap();
      },
      child: Transform.scale(
        scale: _scale,
        child: Container(
          width: widget.buttonDecoration?.width ?? 200.0,
          height: widget.buttonDecoration?.height ?? 50.0,
          alignment: Alignment.center,
          decoration: widget.buttonDecoration?.boxDecoration ??
              BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(24.0),
              ),
          child: widget?.child ??
              Text(
                "Animation Button",
                style: TextStyle(color: Colors.white),
              ),
        ),
      ),
    );
  }
}
