import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/widgets/progress_card.dart';
import 'package:todo_app/screens/home/widgets/sub_title.dart';
import 'package:todo_app/screens/home/widgets/summary_dashboard.dart';
import 'package:todo_app/screens/home/widgets/task_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var inProgress = [
      {
        "cardTitle": "Website Development",
        "cardDetail": "Redesign of company homepage",
        "iconColor": Colors.orange[200],
        "icon": Icons.web,
        "progressIndicatorColor": Colors.greenAccent,
        "progressIndicatorValue": 0.75,
        "cardColor": const Color.fromARGB(255, 240, 255, 240)
      },
      {
        "cardTitle": "Mobile App",
        "cardDetail": "Design for fitness tracking app",
        "iconColor": Colors.teal[200],
        "icon": Icons.fitness_center,
        "progressIndicatorColor": Colors.orangeAccent,
        "progressIndicatorValue": 0.4,
        "cardColor": const Color.fromARGB(255, 255, 245, 230)
      },
      {
        "cardTitle": "AI Research",
        "cardDetail": "Machine learning model implementation",
        "iconColor": Colors.blue[200],
        "icon": Icons.computer,
        "progressIndicatorColor": Colors.purpleAccent,
        "progressIndicatorValue": 0.9,
        "cardColor": const Color.fromARGB(255, 230, 230, 255)
      },
      {
        "cardTitle": "Mobile App",
        "cardDetail": "Design for fitness tracking app",
        "iconColor": Colors.teal[200],
        "icon": Icons.fitness_center,
        "progressIndicatorColor": Colors.orangeAccent,
        "progressIndicatorValue": 0.4,
        "cardColor": const Color.fromARGB(255, 255, 245, 230)
      },
      {
        "cardTitle": "Website Development",
        "cardDetail": "Redesign of company homepage",
        "iconColor": Colors.orange[200],
        "icon": Icons.web,
        "progressIndicatorColor": Colors.greenAccent,
        "progressIndicatorValue": 0.75,
        "cardColor": const Color.fromARGB(255, 240, 255, 240)
      },
    ];

    var taskGroup = [
      {
        "icon": Icons.business,
        "title": "Office Project",
        "numOfTask": 23,
        "color": Colors.orange[200],
        "bgColor": Colors.greenAccent,
        "progressValue": 78.0,
      },
      {
        "icon": Icons.design_services,
        "title": "App Development",
        "numOfTask": 15,
        "color": Colors.blue[200],
        "bgColor": Colors.blueAccent,
        "progressValue": 65.0,
      },
      {
        "icon": Icons.computer,
        "title": "AI Research",
        "numOfTask": 5,
        "color": Colors.purple[200],
        "bgColor": Colors.pinkAccent,
        "progressValue": 95.0,
      },
      {
        "icon": Icons.web,
        "title": "Website Redesign",
        "numOfTask": 30,
        "color": Colors.teal[200],
        "bgColor": Colors.deepOrangeAccent,
        "progressValue": 45.0,
      },
      {
        "icon": Icons.school,
        "title": "Educational Program",
        "numOfTask": 12,
        "color": Colors.red[200],
        "bgColor": Colors.amberAccent,
        "progressValue": 60.0,
      },
      {
        "icon": Icons.security,
        "title": "Security Improvements",
        "numOfTask": 18,
        "color": Colors.green[200],
        "bgColor": Colors.cyanAccent,
        "progressValue": 85.0,
      },
      {
        "icon": Icons.business_center,
        "title": "Client Consultation",
        "numOfTask": 8,
        "color": Colors.pink[200],
        "bgColor": Colors.indigoAccent,
        "progressValue": 50.0,
      },
      {
        "icon": Icons.chat_bubble,
        "title": "Marketing Campaign",
        "numOfTask": 20,
        "color": Colors.yellow[200],
        "bgColor": Colors.tealAccent,
        "progressValue": 70.0,
      },
      {
        "icon": Icons.cloud,
        "title": "Cloud Migration",
        "numOfTask": 10,
        "color": Colors.lightBlue[200],
        "bgColor": Colors.lightGreenAccent,
        "progressValue": 40.0,
      },
      {
        "icon": Icons.devices,
        "title": "IoT Integration",
        "numOfTask": 6,
        "color": Colors.cyan[200],
        "bgColor": Colors.deepPurpleAccent,
        "progressValue": 80.0,
      }
    ];

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
              summaryDashboard(context),
              SizedBox(
                height: 20,
              ),
              subTitle("In Progress", "7"),
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
              subTitle("Task Group", "4"),
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
