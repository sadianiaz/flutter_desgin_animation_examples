import 'package:flutter/material.dart';
import 'dart:async';

class ProgressDialogExample extends StatefulWidget {
  const ProgressDialogExample({super.key});

  @override
  State<ProgressDialogExample> createState() => _ProgressDialogExampleState();
}

class _ProgressDialogExampleState extends State<ProgressDialogExample> {
  void _showProgressDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // user can’t close by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Row(
            children: const [
              CircularProgressIndicator(color: Colors.teal),
              SizedBox(width: 20),
              Text("Please wait..."),
            ],
          ),
        );
      },
    );

    // Simulate a 3-second background task
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context); // close dialog
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Task Completed ✅")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Dialog Example'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showProgressDialog,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
          child: const Text('Show Progress Dialog'),
        ),
      ),
    );
  }
}
