import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (BuildContext context, Widget? child) => SlideTransition(
        position: slidingAnimation,
        child: Text('Read Books For Free', textAlign: TextAlign.center),
      ),
    );
  }
}
