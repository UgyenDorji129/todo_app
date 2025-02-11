import 'package:flutter/material.dart';
import 'package:todo_app/screens/todays_task/service/get_date.dart';
import 'package:todo_app/screens/todays_task/widget/custom_filled_buton.dart';
import 'package:todo_app/screens/todays_task/widget/custom_task_card.dart';
import 'package:todo_app/screens/todays_task/widget/date_card.dart';

class TodaysTask extends StatefulWidget {
  const TodaysTask({super.key});

  @override
  State<TodaysTask> createState() => _TodaysTaskState();
}

class _TodaysTaskState extends State<TodaysTask> {
  var dates = [];

  List<Map<String, dynamic>> tasks = [
    {
      "category": "Shopping app Design",
      "description": "Market Research",
      "icon": Icons.work,
      "status": "Done",
      "time": "12:00 AM"
    },
    {
      "category": "Task Management App",
      "description": "UI Design",
      "icon": Icons.design_services,
      "status": "In Progress",
      "time": "3:00 PM"
    },
    {
      "category": "E-commerce App",
      "description": "Backend Setup",
      "icon": Icons.settings,
      "status": "To-do",
      "time": "9:00 AM"
    },
    {
      "category": "Social Media App",
      "description": "User Authentication",
      "icon": Icons.security,
      "status": "Done",
      "time": "2:00 PM"
    },
    {
      "category": "Fitness App",
      "description": "Workout Routine Integration",
      "icon": Icons.fitness_center,
      "status": "In Progress",
      "time": "11:00 AM"
    },
    {
      "category": "Weather App",
      "description": "API Integration",
      "icon": Icons.cloud,
      "status": "Done",
      "time": "4:00 PM"
    },
    {
      "category": "Finance Tracker App",
      "description": "Budget Calculation Module",
      "icon": Icons.account_balance_wallet,
      "status": "To-do",
      "time": "10:00 AM"
    },
    {
      "category": "Food Delivery App",
      "description": "Order Tracking System",
      "icon": Icons.local_dining,
      "status": "In Progress",
      "time": "1:30 PM"
    },
    {
      "category": "News App",
      "description": "News Feed Implementation",
      "icon": Icons.article,
      "status": "To-do",
      "time": "6:00 PM"
    },
    {
      "category": "Education App",
      "description": "Quiz Feature Integration",
      "icon": Icons.school,
      "status": "Done",
      "time": "8:00 AM"
    },
    {
      "category": "Travel App",
      "description": "Map Integration",
      "icon": Icons.map,
      "status": "In Progress",
      "time": "5:00 PM"
    },
    {
      "category": "Music App",
      "description": "Playlist Management",
      "icon": Icons.music_note,
      "status": "Done",
      "time": "7:00 PM"
    },
    {
      "category": "Messaging App",
      "description": "Push Notifications Setup",
      "icon": Icons.chat,
      "status": "In Progress",
      "time": "12:30 PM"
    },
    {
      "category": "Calendar App",
      "description": "Event Syncing",
      "icon": Icons.calendar_today,
      "status": "To-do",
      "time": "4:30 PM"
    }
  ];

  late ScrollController _scrollController; // Added scroll controller

  @override
  void initState() {
    super.initState();
    dates = getCurrentMonthDetails();
    _scrollController = ScrollController(); // Initialize scroll controller
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
                    customFilledButton("All", Color.fromARGB(225, 101, 56, 233)),
                    customFilledButton(
                        "To Do", Color.fromARGB(109, 100, 56, 233)),
                    customFilledButton(
                        "In Progress", Color.fromARGB(109, 100, 56, 233)),
                    customFilledButton(
                        "Completed", Color.fromARGB(109, 100, 56, 233))
                  ],
                ),
              ),
            ...tasks.map((item){
              return customTaskCard(context: context, task: item);
            })
              
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
