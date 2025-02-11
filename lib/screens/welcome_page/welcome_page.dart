import 'package:flutter/material.dart';
import 'package:todo_app/global_widget/loading_widget.dart';
import 'package:todo_app/screens/welcome_page/widgets/welcome_button.dart';
import 'package:todo_app/screens/welcome_page/widgets/welcome_image.dart';
import 'package:todo_app/screens/welcome_page/widgets/welcome_title.dart';
import 'package:todo_app/services/auth_service.dart';
import 'package:todo_app/services/save_details_service.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isLoading = false;

  Future<void> loginUser(context) async {
    setState(() {
      isLoading = true;
    });
    String userName = "emilys";
    String password = "emilyspass";
    var res = await LoginService.login(userName, password);

    if (res['status'] == true) {
      await SaveDetailService()
          .saveUser(res['data'].username, res['data'].token);
      Navigator.pushNamed(context, "/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? loadingWidget()
            : Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background.png'),
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
                        welcomeButton(context, loginUser),
                      ],
                    )
                  ],
                ),
              ));
  }
}
