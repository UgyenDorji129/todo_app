import 'package:flutter/material.dart';

Widget customIcon({icon, color, size}) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 0.05, horizontal: 0.5),
      decoration: BoxDecoration(
          color: const Color.fromARGB(98, 211, 207, 207),
          borderRadius: BorderRadius.circular(6)),
      child: GestureDetector(
          onTap: () {},
          child: Icon(
            icon,
            color: color,
            size: size,
          )));
}
