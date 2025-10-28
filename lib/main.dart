import 'package:flutter/material.dart';

// Import all example files from lib/examples
import 'examples/shimmer_example.dart';
import 'examples/rive_animation_example.dart';
import 'examples/lottie_animation_example.dart';
import 'examples/animated_splash_screen.dart';
import 'examples/rotate_transition_example.dart';
import 'examples/progress_dialog_example.dart';
import 'examples/lazy_loader_example.dart';
import 'examples/hinge_animation_example.dart';
import 'examples/auto_size_text_example.dart';
import 'examples/physics_animation_example.dart';
import 'examples/ripple_effect_example.dart';
import 'examples/skeleton_text_example.dart';
import 'examples/animation_route_transition_1stscreen_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation Examples',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const ExampleSelector(),
    );
  }
}

class ExampleSelector extends StatelessWidget {
  const ExampleSelector({super.key});

  // List of examples with name and corresponding widget
  final List<Map<String, dynamic>> examples = const [
    {'name': 'Animated Splash Screen', 'widget': AnimatedSplashScreen()},
    {'name': 'Shimmer Example', 'widget': ShimmerExample()},
    {'name': 'Rive Animation Example', 'widget': RiveSimpleExample()},
    {'name': 'Lottie Animation Example', 'widget': LottieAnimationExample()},
    {'name': 'Rotate Transition Example', 'widget': RotateTransitionExample()},
    {'name': 'Progress Dialog Example', 'widget': ProgressDialogExample()},
    {'name': 'Lazy Loader Example', 'widget': LazyLoaderExample()},
    {'name': 'Hinge Animation Example', 'widget': HingeAnimationExample()},
    {'name': 'AutoSize Text Example', 'widget': AutoSizeExample()},
    {'name': 'Physics Animation Example', 'widget': PhysicsAnimationExample()},
    {'name': 'Ripple Effect Example', 'widget': RippleEffectExample()},
    {'name': 'Skeleton Text Example', 'widget': SkeletonTextExample()},
    {'name': 'Animation Route Transition Example', 'widget': HomeScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animation Examples'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: examples.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(examples[index]['name']),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => examples[index]['widget'],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
