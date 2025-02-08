import 'package:flutter/material.dart';
import 'package:todo_app/screens/todays_task/service/get_date.dart';
import 'package:todo_app/screens/todays_task/widget/date_card.dart';

class TodaysTask extends StatefulWidget {
  const TodaysTask({super.key});

  @override
  State<TodaysTask> createState() => _TodaysTaskState();
}

class _TodaysTaskState extends State<TodaysTask> {
  var dates = [];
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
    return Container(
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
          ],
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