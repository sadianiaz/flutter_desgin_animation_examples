import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PhysicsAnimationExample extends StatefulWidget {
  const PhysicsAnimationExample({super.key});

  @override
  State<PhysicsAnimationExample> createState() =>
      _PhysicsAnimationExampleState();
}

class _PhysicsAnimationExampleState extends State<PhysicsAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _ballPosition = 0.0;

  @override
  void initState() {
    super.initState();

    // Create controller for animation
    _controller = AnimationController.unbounded(vsync: this);

    // Spring simulation: mass=1, stiffness=100, damping=5
    final spring = SpringDescription(mass: 1, stiffness: 100, damping: 5);

    // Animate from 0 to 300 using spring physics
    final simulation = SpringSimulation(spring, 0, 300, 0);

    _controller.animateWith(simulation);

    // Update ball position on every tick
    _controller.addListener(() {
      setState(() {
        _ballPosition = _controller.value;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Physics Animation Example'),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          Positioned(
            top: _ballPosition,
            left: MediaQuery.of(context).size.width / 2 - 25,
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
