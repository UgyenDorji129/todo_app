import 'package:flutter/material.dart';

Widget userName() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Hello!",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      Text(
        "Ugyen Dorji",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      )
    ],
  );
}
