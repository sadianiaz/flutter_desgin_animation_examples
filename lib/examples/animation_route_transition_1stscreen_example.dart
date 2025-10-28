import 'package:flutter/material.dart';
import 'secondscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 600),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const SecondScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      // Choose animation style here
                      const begin = Offset(1.0, 0.0); // start from right
                      const end = Offset.zero; // end at normal position
                      const curve = Curves.easeInOut;

                      var tween = Tween(
                        begin: begin,
                        end: end,
                      ).chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
              ),
            );
          },
          child: const Text('Go to Second Screen'),
        ),
      ),
    );
  }
}
