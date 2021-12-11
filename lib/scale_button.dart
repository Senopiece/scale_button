import 'package:flutter/material.dart';

class ScaleButton extends StatefulWidget {
  const ScaleButton({
    Key? key,
    Duration duration = const Duration(milliseconds: 300),
    double bound = 0.2,
    VoidCallback? onTap,
    bool reverse = false,
    required Widget child,
  })  : this.duration = duration,
        this.bound = bound,
        this.onTap = onTap,
        this.child = child,
        this.reverse = reverse,
        super(key: key);

  /// Adjust the animation speed
  ///
  /// Defaults to [300]
  final Duration duration;

  /// Adjust the shrink & zoom size.
  ///
  /// Default to [0.2]
  final double bound;

  /// Called when the user taps this part of the material.
  final VoidCallback? onTap;

  /// The widget below this widget in the tree.
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
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
      onTap: widget.onTap,
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
