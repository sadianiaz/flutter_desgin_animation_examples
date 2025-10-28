import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationExample extends StatelessWidget {
  const LottieAnimationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lottie Animation Example'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the Lottie animation
            Lottie.asset(
              'assets/animations/loading.json',
              width: 200,
              height: 200,
              repeat: true, // keep looping
            ),
            const SizedBox(height: 20),
            const Text(
              'Loading...',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
