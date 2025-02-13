import 'package:flutter/material.dart';

class TaskCardModel {
  final String cardTitle;
  final String cardDetail;
  final Color iconColor;
  final IconData icon;
  final Color progressIndicatorColor;
  final double progressIndicatorValue;
  final Color cardColor;

  TaskCardModel({
    required this.cardTitle,
    required this.cardDetail,
    required this.iconColor,
    required this.icon,
    required this.progressIndicatorColor,
    required this.progressIndicatorValue,
    required this.cardColor,
  });

  factory TaskCardModel.fromJson(Map<String, dynamic> json) {
    return TaskCardModel(
      cardTitle: json['cardTitle'],
      cardDetail: json['cardDetail'],
      iconColor: Color(json['iconColor']),
      icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
      progressIndicatorColor: Color(json['progressIndicatorColor']),
      progressIndicatorValue: json['progressIndicatorValue'].toDouble(),
      cardColor: Color(json['cardColor']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "cardTitle": cardTitle,
      "cardDetail": cardDetail,
      "iconColor": iconColor, 
      "icon": icon,
      "progressIndicatorColor": progressIndicatorColor,
      "progressIndicatorValue": progressIndicatorValue,
      "cardColor": cardColor,
    };
  }
}
