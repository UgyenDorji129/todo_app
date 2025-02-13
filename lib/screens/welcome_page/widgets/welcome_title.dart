import 'package:flutter/material.dart';

Widget welcomeText({required String title, required double lineHeight, required double fontSize,  required bool isFontWeight}){
  return isFontWeight ? Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              height: lineHeight,
              fontWeight:  FontWeight.w600,
              color: Color.fromARGB(255, 36, 37, 44)
            ),
            textAlign: TextAlign.center,
          ) : Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              height: lineHeight,
              color: Color.fromARGB(255,110, 106, 124),
              letterSpacing: 1.0
            ),
            textAlign: TextAlign.center,
          );
}
