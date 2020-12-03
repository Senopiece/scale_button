import 'package:flutter/material.dart';

class ButtonDecoration {
  final double height;
  final double width;
  final BoxDecoration boxDecoration;

  ButtonDecoration({this.height, this.width, this.boxDecoration});
}

// ignore: must_be_immutable
class ScaleButton extends StatefulWidget {
  /// Adds a custom decoration to Scale Button
  final ButtonDecoration buttonDecoration;

  /// Adjust the animation speed
  ///
  /// Defaults to [300]
  final Duration duration;

  /// Adjust the shrink & zoom size.
  ///
  /// Default to [0.2]
  final double bound;

  final VoidCallback onTap;

  final Widget child;

  /// You can choose the type of animation [true : shrink, false: zoom]
  ///
  /// Default to [false]
  final bool reverse;

  ScaleButton(
      {this.buttonDecoration,
      this.duration,
      this.bound,
      this.onTap,
      this.child,
      this.reverse});

  @override
  _ScaleButtonState createState() => _ScaleButtonState();
}

class _ScaleButtonState extends State<ScaleButton>
    with SingleTickerProviderStateMixin {
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
        if (widget.onTap != null) {
          widget.onTap();
        }
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
