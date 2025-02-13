import 'package:flutter/material.dart';

Widget customIcon({icon, color, size, vertical, horizantal}) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizantal),
      decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(6)),
      child: GestureDetector(
          onTap: () {},
          child: Icon(
            icon,
            color: color,
            size: size,
          )));
}

// const Color.fromARGB(98, 211, 207, 207)



