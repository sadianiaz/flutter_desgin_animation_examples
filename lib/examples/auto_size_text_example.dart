import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AutoSizeExample extends StatelessWidget {
  const AutoSizeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoSizeText Example'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Container(
          width: 250,
          height: 100,
          color: Colors.grey[200],
          padding: const EdgeInsets.all(8),
          child: const AutoSizeText(
            'This is an example of AutoSizeText widget. ',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            maxLines: 2, // maximum number of lines allowed
            minFontSize: 14, // minimum font size
            overflow: TextOverflow.ellipsis, // adds "..." if text is too long
          ),
        ),
      ),
    );
  }
}
