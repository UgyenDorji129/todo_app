import 'package:flutter/material.dart';
import 'package:todo_app/global_widget/custom_icon.dart';

Widget progressCard(
    {context,
    cardTitle,
    cardDetail,
    iconColor,
    cardColor,
    icon,
    progressIndicatorColor,
    progressIndicatorValue}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.5,
    height: MediaQuery.of(context).size.height * 0.16,
    decoration: BoxDecoration(
        color: cardColor, borderRadius: BorderRadius.circular(20),boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(174, 203, 199, 199),
              spreadRadius: 0.001,
              blurRadius: 0.015)
        ]),
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cardTitle,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color.fromARGB(255,110, 106, 124)),
            ),
            customIcon(icon: icon, color: iconColor, size: 18.0, vertical: 5.0, horizantal: 5.0)
          ],
        ),
        Text(cardDetail,
            maxLines: 2,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: const Color.fromARGB(175, 0, 0, 0))),
        LinearProgressIndicator(
          borderRadius: BorderRadius.circular(20),
          value: progressIndicatorValue,
          semanticsLabel: 'Linear progress indicator',
          valueColor: AlwaysStoppedAnimation<Color>(progressIndicatorColor),
        ),
      ],
    ),
  );
}
