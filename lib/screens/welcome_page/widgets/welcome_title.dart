import 'package:flutter/material.dart';

Widget welcomeText({required String title, required double lineHeight, required double fontSize,  required bool isFontWeight}){
  return isFontWeight ? Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              height: lineHeight,
              fontWeight:  FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ) : Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              height: lineHeight,
            ),
            textAlign: TextAlign.center,
          );
}
