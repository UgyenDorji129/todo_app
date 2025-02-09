import 'package:flutter/material.dart';

Widget addTaskButton(context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 1,
    child: FilledButton(
      style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all(Color.fromARGB(225, 101, 56, 233))),
      onPressed: () {
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Builder(
          builder: (context) {
            return Text(
              "Add Project",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500),
            );
          }
        ),
      ),
    ),
  );
}
