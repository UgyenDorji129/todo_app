import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_task/add_task.dart';
import 'package:todo_app/screens/add_task/widgets/add_task_appbar.dart';
import 'package:todo_app/screens/home/home_screen.dart';
import 'package:todo_app/screens/home/services/fetch_task.dart';
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
  var homeData = {
    "inProgress": [],
    "taskGroup": [],
    "overAllProgress": 0.0,
    "isLoading": false
  };

  List<Widget> get screenList => [
    HomeScreen(homeData: homeData), // 👈 Always gets updated data
    const TodaysTask(),
    const AddTask(),
    const Profile(),
  ];

  final appBarList = [
    homeAppBar,
    todaysTaskAppBar,
    addTaskAppBar,
    todaysTaskAppBar
  ];
  
  int currentIndex = 0;

  Future<void> fetchTaskList() async {
    var response = await FetchTaskService.fetchTasks();
    if (response['status']){
      setState(() {
        homeData['inProgress'] = response['progress_tasks'];
        homeData['taskGroup'] = response['task_groups'];
        homeData['overAllProgress'] = response['overall_progress'];
        homeData['isLoading'] = false;
      });
    }
  }

  void switchTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      homeData['isLoading'] = true;
    });
    fetchTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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

