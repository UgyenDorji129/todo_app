import 'package:flutter/material.dart';
import 'package:todo_app/global_widget/loading_widget.dart';
import 'package:todo_app/screens/welcome_page/welcome_page.dart';
import 'package:todo_app/screens/wrapper_screen/wrapper_screen.dart';
import 'package:todo_app/services/save_details_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> checkUserStatus() async {
    return await SaveDetailService().hasValidUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkUserStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            title: 'Final Assignment',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: const Color.fromARGB(225, 101, 56, 233),
              fontFamily: "custom_lexend",
            ),
            home: Scaffold(
              body: loadingWidget(),
            ),
          );
        }

        bool isLoggedIn = snapshot.data ?? false;

        return MaterialApp(
          title: 'Final Assignment',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color.fromARGB(225, 101, 56, 233),
            fontFamily: "custom_lexend",
          ),
          home: isLoggedIn ? const WrapperScreen() : const WelcomeScreen(),
          routes: {
            '/home': (context) => const WrapperScreen(),
            '/welcome': (context) => const WelcomeScreen(),
          },
        );
      },
    );
  }
}
