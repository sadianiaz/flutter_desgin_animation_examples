import 'package:flutter/material.dart';

class RippleEffectExample extends StatelessWidget {
  const RippleEffectExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ripple Effect Example'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Ripple tapped!')));
          },
          splashColor: Colors.tealAccent, // color of ripple
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 200,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                'Tap Me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
