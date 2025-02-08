import 'package:flutter/material.dart';
import 'package:todo_app/global_widget/custom_app_bar_icon.dart';
import 'package:todo_app/screens/home/widgets/profile_avatar.dart';
import 'package:todo_app/screens/home/widgets/user_name.dart';

AppBar homeAppBar(context) {
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * .1,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        roundedProfileAvatar(),
        SizedBox(
          width: 12,
        ),
        userName()
      ],
    ),
    actions: [customAppBarIcon(Icons.notifications_active)],
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    elevation: 0.0,
  );
}
