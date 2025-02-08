import 'package:flutter/material.dart';
import 'package:todo_app/screens/welcome_page/widgets/welcome_button.dart';
import 'package:todo_app/screens/welcome_page/widgets/welcome_image.dart';
import 'package:todo_app/screens/welcome_page/widgets/welcome_title.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/background.png'), 
          fit: BoxFit.cover, 
        ),
      ),
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 5),
      child: Column(
        children: [
          welcomeImage(context),
          Column(
            children: [
              welcomeText(
                  title: "Task Management & \nTo-Do List",
                  lineHeight: 1.1,
                  fontSize: 24,
                  isFontWeight: true),
              SizedBox(
                height: 25,
              ),
              welcomeText(
                  title:
                      "This productive tool is designed to help \nyou better manage your task \nproject-wise conveniently!",
                  lineHeight: 1.1,
                  fontSize: 14,
                  isFontWeight: false),
              SizedBox(
                height: 35,
              ),
              welcomeButton(context),
            ],
          )
        ],
      ),
    ));
  }
}
