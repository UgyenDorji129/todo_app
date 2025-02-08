import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/widgets/custom_icon.dart';

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
        color: cardColor, borderRadius: BorderRadius.circular(20)),
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cardTitle,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            customIcon(icon: icon, color: iconColor, size: 20.0)
          ],
        ),
        Text(cardDetail,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
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
