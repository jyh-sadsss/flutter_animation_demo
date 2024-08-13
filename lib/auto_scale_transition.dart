import 'package:flutter/material.dart';

class AutoScaleTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  const AutoScaleTransition(
      {required this.animation, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: animation.value,
              height: animation.value,
              child: child,
            ),
          );
        },
        child: child);
  }
}
