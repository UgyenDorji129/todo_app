import 'package:flutter/material.dart';
import 'package:todo_app/global_widget/custom_icon.dart';


Widget customTaskCard({context, task}) {
  return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.12,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(173, 137, 132, 132),
                spreadRadius: 0.001,
                blurRadius: 0.015)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task["category"],
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              Text(
                task["description"],
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time_filled,
                    color: Color.fromARGB(109, 100, 56, 233),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    task["time"],
                    style: TextStyle(color: Color.fromARGB(109, 100, 56, 233)),
                  )
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              customIcon(
                  icon: task["icon"],
                  color: const Color.fromARGB(255, 230, 142, 234),
                  size: 25.0),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber[50]),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: Text(task["status"]),
              )
            ],
          )
        ],
      ));
}
