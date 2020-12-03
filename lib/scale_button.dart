import 'package:flutter/material.dart';

class ScaleButton extends StatefulWidget {
  ScaleButton({
    Key key,
    double width = 200.0,
    double height = 50.0,
    BoxDecoration boxDecoration = const BoxDecoration(
      color: Colors.blueAccent,
    ),
    Duration duration = const Duration(milliseconds: 300),
    double bound = 0.2,
    VoidCallback onTap,
    bool reverse = false,
    Widget child,
  })  : this.width = width,
        this.height = height,
        this.boxDecoration = boxDecoration,
        this.duration = duration,
        this.bound = bound,
        this.onTap = onTap,
        this.child = child,
        this.reverse = reverse,
        super(key: key);

  final double width;

  final double height;

  /// Adds a custom decoration to Scale Button
  final BoxDecoration boxDecoration;

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

  @override
  _ScaleButtonState createState() => _ScaleButtonState();
}

class _ScaleButtonState extends State<ScaleButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      upperBound: widget.bound,
    )..addListener(() {
        setState(() {
          _scale =
              widget.reverse ? 1 + _controller.value : 1 - _controller.value;
        });
      });
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
            width: widget.width,
            height: widget.height,
            alignment: Alignment.center,
            color: widget.boxDecoration == null ? Colors.blueAccent : null,
            decoration: widget.boxDecoration,
            child: widget.child),
      ),
    );
  }
}
