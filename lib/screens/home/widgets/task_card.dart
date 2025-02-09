import 'package:flutter/material.dart';
import 'package:todo_app/global_widget/custom_icon.dart';
import 'package:todo_app/screens/home/widgets/progress_widget.dart';

Widget taskCard(
    {context, icon, title, numOfTask, color, bgColor, progressValue}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.095,
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(174, 203, 199, 199),
              spreadRadius: 0.001,
              blurRadius: 0.015)
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            customIcon(icon: Icons.web, color: color, size: 40.0),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  '${numOfTask.toStringAsFixed(0)} Tasks',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
        progressWidget(
            context: context,
            fontSize: 12.0,
            height: 0.12,
            width: 0.12,
            pointColor: color,
            axisColor: Color.fromARGB(98, 211, 207, 207),
            value: progressValue)
      ],
    ),
  );
}
