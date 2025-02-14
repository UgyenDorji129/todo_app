import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/screens/todays_task/service/get_date.dart';
import 'package:todo_app/screens/todays_task/service/task_segregator.dart';
import 'package:todo_app/screens/todays_task/widget/custom_filled_buton.dart';
import 'package:todo_app/screens/todays_task/widget/custom_task_card.dart';
import 'package:todo_app/screens/todays_task/widget/date_card.dart';

class TodaysTask extends StatefulWidget {
  final tasks;
  const TodaysTask({super.key, required this.tasks});

  @override
  State<TodaysTask> createState() => _TodaysTaskState();
}

class _TodaysTaskState extends State<TodaysTask> {
  var dates = [];
  late ScrollController _scrollController;
  var categorizedTask = {};
  int currentIndex = 0;
  final random = Random();

  void updatedIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    dates = getCurrentMonthDetails();
    _scrollController = ScrollController();
    categorizedTask = segregateTasks(widget.tasks);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollToToday();
  }

  void _scrollToToday() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int todayIndex = dates.indexWhere((date) => date['is_today'] == true);
      if (todayIndex != -1) {
        double itemWidth = MediaQuery.of(context).size.width * 0.18 + 10;
        double scrollOffset = todayIndex * itemWidth;

        _scrollController.animateTo(
          scrollOffset,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredTasks = [];

    if (currentIndex == 0) {
      filteredTasks = [
        ...categorizedTask["inProgress"] ?? [],
        ...categorizedTask["todo"] ?? [],
        ...categorizedTask["done"] ?? []
      ];
      filteredTasks.shuffle(random);
    } else if (currentIndex == 1) {
      filteredTasks = categorizedTask["todo"] ?? [];
    } else if (currentIndex == 2) {
      filteredTasks = categorizedTask["inProgress"] ?? [];
    } else if (currentIndex == 3) {
      filteredTasks = categorizedTask["done"] ?? [];
    }

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage('assets/home_back.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...dates.map((dateItem) {
                      return dateCard(context: context, dateItem: dateItem);
                    }),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    customFilledButton(
                        label: "All",
                        color: currentIndex == 0
                            ? Color.fromARGB(225, 101, 56, 233)
                            : Color.fromARGB(109, 100, 56, 233),
                        updateIndex: updatedIndex,
                        index: 0),
                    customFilledButton(
                        label: "To Do",
                        color: currentIndex == 1
                            ? Color.fromARGB(225, 101, 56, 233)
                            : Color.fromARGB(109, 100, 56, 233),
                        updateIndex: updatedIndex,
                        index: 1),
                    customFilledButton(
                        label: "In Progress",
                        color: currentIndex == 2
                            ? Color.fromARGB(225, 101, 56, 233)
                            : Color.fromARGB(109, 100, 56, 233),
                        updateIndex: updatedIndex,
                        index: 2),
                    customFilledButton(
                        label: "Completed",
                        color: currentIndex == 3
                            ? Color.fromARGB(225, 101, 56, 233)
                            : Color.fromARGB(109, 100, 56, 233),
                        updateIndex: updatedIndex,
                        index: 3)
                  ],
                ),
              ),
              Column(
                children: filteredTasks.map((task) {
                  return customTaskCard(context: context, task: task);
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
