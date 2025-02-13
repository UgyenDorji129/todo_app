import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/services/fetch_task.dart';
import 'package:todo_app/screens/home/widgets/progress_card.dart';
import 'package:todo_app/screens/home/widgets/sub_title.dart';
import 'package:todo_app/screens/home/widgets/summary_dashboard.dart';
import 'package:todo_app/screens/home/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var inProgress = [];
  var taskGroup = [];
  var overAllProgress  = 0.0;


  Future<void> fetchTaskList() async {
    var response = await FetchTaskService.fetchTasks();
    if (response['status']){
      setState(() {
      inProgress = response['progress_tasks'];
      taskGroup = response['task_groups'];
      overAllProgress = response['overall_progress'];
    });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTaskList();
  }


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
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              summaryDashboard(context, overAllProgress),
              SizedBox(
                height: 20,
              ),
              subTitle("In Progress", '${inProgress.length}'),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...inProgress.map((data) {
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
              subTitle("Task Group", '${taskGroup.length}'),
              SizedBox(
                height: 20,
              ),
              ...taskGroup.map((data) {
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
