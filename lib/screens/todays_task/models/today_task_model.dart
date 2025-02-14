import 'package:flutter/material.dart';

class TodayTaskModel {
  final String category;
  final String description;
  final IconData icon;
  final String status;
  final String time;
  final String date;

  TodayTaskModel({
    required this.category,
    required this.description,
    required this.icon,
    required this.status,
    required this.time,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      "category": category,
      "description": description,
      "icon": icon,
      "status": status,
      "time": time,
      "date": date,
    };
  }

  factory TodayTaskModel.fromJson(Map<String, dynamic> json) {
    return TodayTaskModel(
      category: json["category"],
      description: json["description"],
      icon: IconData(json["icon"], fontFamily: 'MaterialIcons'),
      status: json["status"],
      time: json["time"],
      date: json["date"],
    );
  }
}
