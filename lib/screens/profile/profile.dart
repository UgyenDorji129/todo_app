import 'package:flutter/material.dart';
import 'package:todo_app/services/save_details_service.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: FilledButton(onPressed: (){
      SaveDetailService().removeUser();
      Navigator.pushNamed(context, "/welcome");
    }, child: Text("Log Out!")));
  }
}