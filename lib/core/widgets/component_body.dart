import 'package:flutter/material.dart';

class ComponentBody extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  const ComponentBody({
    super.key,
    required this.child,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ??
          const EdgeInsets.only(
            top: 40,
            bottom: 20,
          ),
      padding: padding ??
          const EdgeInsets.only(
            left: 20,
            top: 20,
            right: 20,
            bottom: 20,
          ),
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(60),
        ),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 20,
            color: Colors.black12.withOpacity(0.15),
          ),
        ],
      ),
      child: child,
    );
  }
}
