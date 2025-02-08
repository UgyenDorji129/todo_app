import 'package:flutter/material.dart';

Widget iconButton(int index, IconData icon, int currentIndex, Function switchTab) {
    final isSelected = currentIndex == index;
    final color = isSelected
        ? const Color.fromARGB(225, 101, 56, 233) // Brighter color
        : const Color.fromARGB(224, 173, 150, 241); // Faded color

    return IconButton(
      icon: Icon(icon, color: color),
      onPressed: () {
        if (currentIndex != index) { // Prevent unnecessary rebuilds
          switchTab(index);
        }
      },
    );
}