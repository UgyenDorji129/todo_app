import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/home_screen.dart';
import 'package:todo_app/screens/welcome_page/welcome_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/screens/wrapper_screen/wrapper_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(225, 101, 56, 233),
        fontFamily: "custom_lexend"
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/home': (context) => const WrapperScreen()
      },
    );
  }
}
