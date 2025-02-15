import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/screens/home/models/progress_task_model.dart';
import 'package:todo_app/screens/home/models/task_group_model.dart';

class FetchTaskService {
  static final Random _random = Random();

  static Color _getDistinctColor(List<Color> choices, {Color? avoidColor}) {
    Color selected;
    do {
      selected = choices[_random.nextInt(choices.length)];
    } while (selected == avoidColor);
    return selected;
  }

  static Color prevProgressIndicatorColor =
      _getDistinctColor(progressIndicatorColors);

  static Future<Map<String, dynamic>> fetchTasks() async {
    Map<String, dynamic> result;
    Uri url = Uri.parse("https://dummyjson.com/todos/random/10");
    DateTime today = DateTime.now();

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> rawTasks = json.decode(response.body);

        List<TaskCardModel> allTasks = rawTasks.map((item) {
          bool isCompleted = item['completed'];
          double progressValue =
              isCompleted ? 1.0 : (_random.nextBool() ? 0.75 : 0.4);

          var selectedCategory =
              taskCategories[_random.nextInt(taskCategories.length)];
          Color progressIndicatorColor = _getDistinctColor(
              progressIndicatorColors,
              avoidColor: prevProgressIndicatorColor);
          prevProgressIndicatorColor = progressIndicatorColor;

          return TaskCardModel(
            cardTitle: selectedCategory["title"],
            cardDetail: item['todo'].trim(),
            iconColor: selectedCategory["iconColor"],
            icon: selectedCategory["icon"],
            progressIndicatorColor: progressIndicatorColor,
            progressIndicatorValue: progressValue,
            cardColor: selectedCategory["cardColor"],
          );
        }).toList();

        List<TaskCardModel> progressTasks = allTasks
            .where((task) =>
                task.progressIndicatorValue > 0.0 &&
                task.progressIndicatorValue < 1.0)
            .toList();

        double totalProgress = allTasks
            .map((t) => t.progressIndicatorValue)
            .reduce((a, b) => a + b);
        double overallProgress = (totalProgress / allTasks.length) * 100;

        Map<String, List<TaskCardModel>> groupedTasks = {};
        for (var task in allTasks) {
          groupedTasks.putIfAbsent(task.cardTitle, () => []).add(task);
        }

        List<TaskGroupModel> taskGroupsList = groupedTasks.entries.map((entry) {
          var category =
              taskCategories.firstWhere((cat) => cat['title'] == entry.key);
          Color bgColor = _getDistinctColor(progressIndicatorColors,
              avoidColor: category['iconColor']);
          int numOfTasks = entry.value.length;
          double progressValue = (entry.value
                      .map((t) => t.progressIndicatorValue)
                      .reduce((a, b) => a + b) /
                  numOfTasks) *
              100;
          return TaskGroupModel(
            icon: category['icon'],
            title: entry.key,
            numOfTask: numOfTasks,
            color: category['iconColor'],
            bgColor: bgColor,
            progressValue: progressValue,
          );
        }).toList();

        List<Map<String, dynamic>> todaysTasks = [];
        for (int i = 0; i < 10; i++) {
          var task = allTasks[_random.nextInt(allTasks.length)];
          int randomHour = _random.nextInt(12) + 1;
          int randomMinute = _random.nextInt(60);
          String period = _random.nextBool() ? "AM" : "PM";
          String formattedTime =
              "$randomHour:${randomMinute.toString().padLeft(2, '0')} $period";

          String status;
          if (i < 3) {
            status = "Done";
          } else if (i < 5) {
            status = "Pending";
          } else {
            status = "In Progress";
          }

          todaysTasks.add({
            "category": task.cardTitle,
            "description": task.cardDetail,
            "icon": task.icon,
            "status": status,
            "time": formattedTime,
            "date": "${today.day}/${today.month}/${today.year}",
          });
        }

        result = {
          'status': true,
          'message': 'Successfully Fetched Tasks',
          'progress_tasks': progressTasks.map((task) => task.toJson()).toList(),
          'task_groups': taskGroupsList.map((group) => group.toJson()).toList(),
          'overall_progress': overallProgress,
          'todays_tasks': todaysTasks,
        };
      } else {
        String message = '${json.decode(response.body)['message']}.';
        result = {
          'status': false,
          'message': 'Fetching Tasks Failed',
          'data': message
        };
      }
    } on SocketException {
      result = {
        'status': false,
        'message': 'Unsuccessful request.',
        'data': 'No internet Connection'
      };
    }
    return result;
  }
}
