import 'package:flutter/material.dart';
import 'package:todo_app/global_widget/custom_app_bar_icon.dart';

AppBar addTaskAppBar(context) {
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * .1,
    title: Text("Add Project",  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    actions: [customAppBarIcon(Icons.notifications_active)],
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    elevation: 0.0,
  );
}
