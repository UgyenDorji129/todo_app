import 'package:flutter/material.dart';

Widget customFloatingActionButton() {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 159, 166, 241).withValues(),
          blurRadius: 10,
          spreadRadius: 0.2,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: FloatingActionButton(
      onPressed: () {},
      backgroundColor: Color.fromARGB(225, 101, 56, 233),
      shape: const CircleBorder(),
      child: const Icon(Icons.add, size: 28, color: Colors.white),
    ),
  );
}
