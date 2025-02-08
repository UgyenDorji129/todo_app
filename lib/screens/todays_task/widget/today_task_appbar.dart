import 'package:flutter/material.dart';
import 'package:todo_app/global_widget/custom_app_bar_icon.dart';

AppBar todaysTaskAppBar(context) {
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * .1,
    title: Text("Today's Tasks",  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    actions: [customAppBarIcon(Icons.notifications_active)],
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    elevation: 0.0,
  );
}
