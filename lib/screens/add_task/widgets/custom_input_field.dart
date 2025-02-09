import 'package:flutter/material.dart';

Widget customInputField(fontSize, {context, controller, title, height}) {
  return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * height,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(173, 137, 132, 132),
                spreadRadius: 0.001,
                blurRadius: 0.015)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
          Expanded(
            child: TextField(
              style: fontSize != 0.0 ? TextStyle(fontSize: 16, fontWeight: FontWeight.bold) : TextStyle(),
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(bottom: 8),
              ),
            ),
          )
        ],
      ));
}
