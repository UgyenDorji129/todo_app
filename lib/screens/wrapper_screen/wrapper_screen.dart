import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_task/add_task.dart';
import 'package:todo_app/screens/add_task/widgets/add_task_appbar.dart';
import 'package:todo_app/screens/home/home_screen.dart';
import 'package:todo_app/screens/home/widgets/home_app_bar.dart';
import 'package:todo_app/screens/profile/profile.dart';
import 'package:todo_app/screens/todays_task/widget/today_task_appbar.dart';
import 'package:todo_app/screens/wrapper_screen/widgets/custom_bottom_appbar.dart';
import 'package:todo_app/screens/home/widgets/custom_floating_action_button.dart';
import 'package:todo_app/screens/todays_task/todays_task.dart';

class WrapperScreen extends StatefulWidget {
  const WrapperScreen({super.key});

  @override
  State<WrapperScreen> createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  final screenList = [const HomeScreen(), const TodaysTask(), const AddTask(), const Profile()];
  final appBarList = [homeAppBar, todaysTaskAppBar, addTaskAppBar, todaysTaskAppBar];
  int currentIndex = 0;

  void switchTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: appBarList[currentIndex](context),
      floatingActionButton: customFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBar(
        switchTab: switchTab,
        currentIndex: currentIndex,
      ),
      body: screenList[currentIndex],
    );
  }
}