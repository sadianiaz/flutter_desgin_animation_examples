import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveSimpleExample extends StatelessWidget {
  const RiveSimpleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rive Animation Example"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: SizedBox(
          width: 250,
          height: 250,
          child: RiveAnimation.asset(
            'assets/animations/loading.riv', // your rive file path
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
