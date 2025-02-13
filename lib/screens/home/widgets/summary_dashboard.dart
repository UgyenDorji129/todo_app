import 'package:flutter/material.dart';
import 'package:todo_app/global_widget/custom_icon.dart';
import 'package:todo_app/screens/home/widgets/progress_widget.dart';


Widget summaryDashboard(context, overAllProgress) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.16,
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color.fromARGB(225, 101, 56, 233),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Your today's task \nalmost done!",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          FilledButton(
              style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all(Colors.white)),
              onPressed: () {},
              child: Text(
                "View Task",
                style: TextStyle(color: Color.fromARGB(225, 101, 56, 233),  fontSize: 13, fontWeight: FontWeight.w600),
              ))
        ]),
        progressWidget(
            context: context,
            fontSize: 15.0,
            height: 0.2,
            width: 0.2,
            pointColor: Colors.white,
            axisColor: Color.fromARGB(98, 211, 207, 207),
            value: overAllProgress,
            fontColor: Colors.white
            ),
        customIcon(
            icon: Icons.more_horiz_rounded, color: Colors.white, size: 25.0, vertical: 0.05, horizantal: 0.5)
      ],
    ),
  );
}
