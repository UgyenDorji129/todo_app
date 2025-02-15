import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Please connect to your internet and try again!!!",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
      ),
    );
  }
}
