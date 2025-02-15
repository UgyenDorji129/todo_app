import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/screens/add_task/add_task.dart';
import 'package:todo_app/screens/add_task/widgets/add_task_appbar.dart';
import 'package:todo_app/screens/error_screen/error_screen.dart';
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
  bool isSuccess = true;
  var todaysTaskData = [];

  void addTask({projectController, taskGroup}) {
    if (projectController.text.isEmpty || taskGroup == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a task and select a category")),
      );
      return;
    }

    final taskCategory = taskCategories.firstWhere(
      (cat) => cat["title"] == taskGroup,
    );

    final newTask = {
      "cardTitle": taskCategory["title"],
      "cardDetail": projectController.text.trim(),
      "iconColor": taskCategory["iconColor"],
      "icon": taskCategory["icon"],
      "progressIndicatorColor": Colors.blue, 
      "progressIndicatorValue": 0.0, 
      "cardColor": taskCategory["cardColor"],
    };

    if (!homeData.containsKey(taskCategory["title"])) {
      homeData[taskCategory["title"]] = <Map<String, dynamic>>[];
    }

    (homeData[taskCategory["title"]] as List<Map<String, dynamic>>)
        .add(newTask);

    List<String> statusOptions = ["Done", "Pending", "In Progress"];
    String randomStatus = statusOptions[Random().nextInt(statusOptions.length)];

    final newTodayTask = {
      "category": taskCategory["title"],
      "description": projectController.text.trim(),
      "icon": taskCategory["icon"],
      "status": randomStatus,
      "time":
          "${Random().nextInt(12) + 1}:${(Random().nextInt(60)).toString().padLeft(2, '0')} ${Random().nextBool() ? "AM" : "PM"}",
      "date": DateTime.now().toString().split(" ")[0],
    };

    todaysTaskData.add(newTodayTask);
    projectController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Task Added Successfully!")),
    );
  }

  List<Widget> get screenList => [
        HomeScreen(homeData: homeData),
        TodaysTask(
          tasks: todaysTaskData,
        ),
        AddTask(
          addTask : addTask
        ),
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
    if (response['status'])  {
      setState(() {
        homeData['inProgress'] = response['progress_tasks'];
        homeData['taskGroup'] = response['task_groups'];
        homeData['overAllProgress'] = response['overall_progress'];
        todaysTaskData = response['todays_tasks'];
        homeData['isLoading'] = false;
      });
    }
    else{
      setState(() {
        isSuccess = false;
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
      appBar: isSuccess ? appBarList[currentIndex](context) : null,
      floatingActionButton: isSuccess ? customFloatingActionButton() : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: isSuccess ? CustomBottomAppBar(
        switchTab: switchTab,
        currentIndex: currentIndex,
      ) : null,
      body: isSuccess ? screenList[currentIndex] : ErrorScreen(),
    );
  }
}
