// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todo_app/global_widget/loading_widget.dart';
import 'package:todo_app/screens/home/widgets/progress_card.dart';
import 'package:todo_app/screens/home/widgets/sub_title.dart';
import 'package:todo_app/screens/home/widgets/summary_dashboard.dart';
import 'package:todo_app/screens/home/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  final homeData;
  const HomeScreen({super.key, this.homeData});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) { 
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Optional: rounded corners
        image: DecorationImage(
          image: const AssetImage('assets/home_back.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: widget.homeData["isLoading"] ? loadingWidget() : SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              summaryDashboard(context, widget.homeData["overAllProgress"]),
              SizedBox(
                height: 20,
              ),
              subTitle("In Progress", '${widget.homeData["inProgress"].length}'),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...widget.homeData["inProgress"].map((data) {
                      return Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: progressCard(
                          context: context,
                          cardTitle: data['cardTitle'],
                          cardDetail: data['cardDetail'],
                          iconColor: data['iconColor'],
                          icon: data['icon'],
                          progressIndicatorColor:
                              data['progressIndicatorColor'],
                          progressIndicatorValue:
                              data['progressIndicatorValue'],
                          cardColor: data['cardColor'],
                        ),
                      );
                    })
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              subTitle("Task Group", '${widget.homeData["taskGroup"].length}'),
              SizedBox(
                height: 20,
              ),
              ...widget.homeData["taskGroup"].map((data) {
                return taskCard(
                  context: context,
                  title: data['title'],
                  numOfTask: data['numOfTask'],
                  color: data['color'],
                  bgColor: data['bgColor'],
                  progressValue: data['progressValue'],
                  icon: data['icon'],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
