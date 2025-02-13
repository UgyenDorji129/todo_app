import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/screens/home/models/progress_task_model.dart';
import 'package:todo_app/screens/home/models/task_group_model.dart';




class FetchTaskService {
  static final List<Map<String, dynamic>> taskCategories = [
    {"title": "Website Development", "icon": Icons.web},
    {"title": "Mobile App", "icon": Icons.fitness_center},
    {"title": "AI Research", "icon": Icons.computer},
    {"title": "Marketing Campaign", "icon": Icons.assignment},
    {"title": "Database Optimization", "icon": Icons.lightbulb},
  ];

  static final List<Color> cardColors = [
    const Color.fromARGB(28, 251, 173, 226), 
    const Color.fromARGB(29, 146, 127, 255), 
    const Color.fromARGB(22, 165, 255, 177), 
  ];

  static final List<Color> iconColors = [
    const Color.fromARGB(195, 255, 64, 128),
    const Color.fromARGB(142, 255, 82, 82),
    const Color.fromARGB(161, 255, 109, 64),
  ];

  static final List<Color> progressIndicatorColors = [
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.blue,
    Colors.red,
  ];

  static final Random _random = Random();
  

  static Color _getDistinctColor(List<Color> choices, {Color? avoidColor}) {
    Color selected;
    do {
      selected = choices[_random.nextInt(choices.length)];
    } while (selected == avoidColor);
    return selected;
  }

  static Future<Map<String, dynamic>> fetchTasks() async {
    Map<String, dynamic> result;
    Uri url = Uri.parse("https://dummyjson.com/todos/random/10");
    Color lastSelectedCardColor = _getDistinctColor(cardColors);
    Color lastSelectedIconColor = _getDistinctColor(cardColors);

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> rawTasks = json.decode(response.body);

        List<TaskCardModel> progressTasks = rawTasks.map((item) {
          bool isCompleted = item['completed'];
          double progressValue = isCompleted ? 1.0 : (_random.nextBool() ? 0.75 : 0.4);

          Color cardColor = _getDistinctColor(cardColors, avoidColor: lastSelectedCardColor);
          Color iconColor = _getDistinctColor(iconColors, avoidColor: lastSelectedIconColor);
          lastSelectedIconColor = iconColor;
          lastSelectedCardColor = cardColor;
          Color progressIndicatorColor = _getDistinctColor(progressIndicatorColors, avoidColor: iconColor);

          var selectedCategory = taskCategories[_random.nextInt(taskCategories.length)];

          return TaskCardModel(
            cardTitle: selectedCategory["title"],
            cardDetail: item['todo'].trim(),
            iconColor: iconColor,
            icon: selectedCategory["icon"],
            progressIndicatorColor: progressIndicatorColor,
            progressIndicatorValue: progressValue,
            cardColor: cardColor,
          );
        }).toList();

        Map<String, List<TaskCardModel>> groupedTasks = {};
        for (var task in progressTasks) {
          groupedTasks.putIfAbsent(task.cardTitle, () => []).add(task);
        }
        Color lastSelectColor = _getDistinctColor(iconColors);
        List<TaskGroupModel> taskGroupsList = groupedTasks.entries.map((entry) {
          Color color = _getDistinctColor(iconColors, avoidColor: lastSelectColor);
          lastSelectColor = color;
          Color bgColor = _getDistinctColor(progressIndicatorColors, avoidColor: color);
          int numOfTasks = entry.value.length;
          double progressValue =
              (entry.value.map((t) => t.progressIndicatorValue).reduce((a, b) => a + b) / numOfTasks) * 100;
          return TaskGroupModel(
            icon: entry.value.first.icon,
            title: entry.key,
            numOfTask: numOfTasks,
            color: color,
            bgColor: bgColor,
            progressValue: progressValue,
          );
        }).toList();

        result = {
          'status': true,
          'message': 'Successfully Fetched Tasks',
          'progress_tasks': progressTasks.map((task) => task.toJson()).toList(),
          'task_groups': taskGroupsList.map((group) => group.toJson()).toList()
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
