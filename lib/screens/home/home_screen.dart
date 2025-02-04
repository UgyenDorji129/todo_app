import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: customAppBar(context),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}
