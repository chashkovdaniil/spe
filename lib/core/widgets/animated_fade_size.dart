import 'package:flutter/material.dart';

import 'custom_size_transition.dart';

class AnimatedFadeSize extends StatefulWidget {
  final Widget child;
  final bool isVisible;
  const AnimatedFadeSize({
    Key? key,
    required this.child,
    required this.isVisible,
  }) : super(key: key);

  @override
  _AnimatedFadeSizeState createState() => _AnimatedFadeSizeState();
}

class _AnimatedFadeSizeState extends State<AnimatedFadeSize>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final CurvedAnimation _scaleCurve;
  late final CurvedAnimation _fadeCurve;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _scaleCurve = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 1.0),
    );
    _fadeCurve = CurvedAnimation(
      parent: _scaleCurve,
      curve: const Interval(0.0, 1.0),
    );
    if (widget.isVisible) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedFadeSize oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.child.runtimeType != oldWidget.child.runtimeType ||
        oldWidget.isVisible != widget.isVisible) {
      if (widget.isVisible) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomSizeTransition(
      sizeFactor: _scaleCurve,
      child: FadeTransition(
        opacity: _fadeCurve,
        child: widget.child,
      ),
    );
  }
}
