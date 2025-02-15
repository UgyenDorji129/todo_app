import 'package:flutter/material.dart';

final List<Map<String, dynamic>> taskCategories = [
    {
      "title": "Office Project",
      "icon": Icons.work_history_sharp,
      "cardColor": Colors.blue[100],
      "iconColor": Colors.red[400]
    },
    {
      "title": "Personal Project",
      "icon": Icons.person_pin,
      "cardColor": Colors.green[100],
      "iconColor": Colors.pink[400]
    },
    {
      "title": "Group Project",
      "icon": Icons.group,
      "cardColor": Colors.purple[100],
      "iconColor": Colors.green[400]
    },
    {
      "title": "Marketing Project",
      "icon": Icons.backup_sharp,
      "cardColor": Colors.teal[100],
      "iconColor": Colors.purpleAccent[400]
    },
    {
      "title": "Skill Development",
      "icon": Icons.lightbulb,
      "cardColor": Colors.indigo[100],
      "iconColor": Colors.blue[400]
    },
  ];

final List<Color> progressIndicatorColors = [
    Colors.green,
    Colors.pink,
    Colors.purple,
    Colors.blue,
    Colors.red,
  ];