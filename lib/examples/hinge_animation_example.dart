import 'package:flutter/material.dart';

class HingeAnimationExample extends StatefulWidget {
  const HingeAnimationExample({super.key});

  @override
  State<HingeAnimationExample> createState() => _HingeAnimationExampleState();
}

class _HingeAnimationExampleState extends State<HingeAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _opacityAnimation;
  bool isAnimating = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Rotation from 0 to around 80 degrees (like falling)
    _rotationAnimation = Tween<double>(begin: 0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.easeInOutBack),
      ),
    );

    // Opacity fades out as it falls
    _opacityAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  void _startAnimation() {
    if (!isAnimating) {
      setState(() => isAnimating = true);
      _controller.forward(from: 0).then((_) {
        setState(() => isAnimating = false);
      });
    }
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
        title: const Text('Hinge Animation Example'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Transform(
                alignment: Alignment.topLeft, // pivot like hinge
                transform: Matrix4.identity()
                  ..rotateZ(_rotationAnimation.value),
                child: child,
              ),
            );
          },
          child: const Text(
            'Hinge Animation 💥',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: _startAnimation,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
