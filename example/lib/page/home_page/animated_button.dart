import 'package:flutter/material.dart';
import 'package:modrabl/modrabl.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({Key? key}) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  Duration duration = const Duration(milliseconds: 1000);

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  Future<void> startAnimation() async {
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    _controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
          _controller.reverse();
          break;
        case AnimationStatus.dismissed:
          _controller.forward();
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
      }
    });
    _controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(
                color: Colors.black,
                width: 1),
          ),
          child: const Text('Tekrar Dene').center,
        );
      },
    );
  }
}
