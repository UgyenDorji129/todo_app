import 'package:flutter/material.dart';

class TaskGroupModel {
  final IconData icon;
  final String title;
  final int numOfTask;
  final Color color;
  final Color bgColor;
  final double progressValue;

  TaskGroupModel({
    required this.icon,
    required this.title,
    required this.numOfTask,
    required this.color,
    required this.bgColor,
    required this.progressValue,
  });

  factory TaskGroupModel.fromJson(Map<String, dynamic> json) {
  return TaskGroupModel(
    icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
    title: json['title'],
    numOfTask: json['numOfTask'],
    color: Color(json['color']),
    bgColor: Color(json['bgColor']),
    progressValue: json['progressValue'].toDouble(),
  );
}


  Map<String, dynamic> toJson() => {
        "icon": icon,
        "title": title,
        "numOfTask": numOfTask,
        "color": color,
        "bgColor": bgColor,
        "progressValue": progressValue,
      };
}