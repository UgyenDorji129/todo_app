import 'package:flutter/material.dart';

Widget welcomeImage(context){
  return Image.asset(
            "assets/welcome_logo.png",
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
          );
}