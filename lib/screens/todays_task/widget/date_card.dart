import 'package:flutter/material.dart';

Widget dateCard({context, dateItem}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.18,
    height: MediaQuery.of(context).size.height * 0.13,
    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
    margin: EdgeInsets.only(top: 2.5, right: 10, bottom: 2.5, left: 0.6),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: dateItem["is_today"]? Color.fromARGB(225, 101, 56, 233):Colors.white,
        boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(173, 160, 157, 157),
              spreadRadius: 0.01,
              blurRadius: 1)
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dateItem["month"],
        ),
        Text('${dateItem["date"].toStringAsFixed(0)}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        Text(dateItem["day"])
      ],
    ),
  );
}
