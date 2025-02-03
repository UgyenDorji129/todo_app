import 'package:flutter/material.dart';

Widget welcomeButton(context){
  return SizedBox(
  width: MediaQuery.of(context).size.width * .65,
  child: FilledButton(
    onPressed: () {},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the text
        children: [
          Expanded(
            child: Text(
              "Let's Start",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, letterSpacing: 1.5),
            ),
          ),
          Icon(Icons.arrow_right_alt_outlined, size: 30),
        ],
      ),
    ),
  ),
);

}