import 'package:flutter/material.dart';

Widget roundedProfileAvatar() {
  return CircleAvatar(
    radius: 22,
    backgroundColor: Colors.transparent,
    foregroundImage: Image.asset(
      'assets/profile.jpg',
    ).image,
  );
}
