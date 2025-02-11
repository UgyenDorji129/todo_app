import 'package:flutter/material.dart';
import 'package:todo_app/global_widget/loading_widget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: loadingWidget());
  }
}