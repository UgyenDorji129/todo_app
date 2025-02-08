import 'package:flutter/material.dart';

Widget subTitle(title, noOfTask) {
  return Row(
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Text(
        noOfTask,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      )
    ],
  );
}
