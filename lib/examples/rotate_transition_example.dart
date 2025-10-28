import 'package:flutter/material.dart';

class RotateTransitionExample extends StatefulWidget {
  const RotateTransitionExample({super.key});

  @override
  State<RotateTransitionExample> createState() =>
      _RotateTransitionExampleState();
}

class _RotateTransitionExampleState extends State<RotateTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Duration of one full rotation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(); // repeat indefinitely
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotation Transition Example'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: RotationTransition(
          turns: _controller, // AnimationController drives rotation
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.refresh, size: 80, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
