import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/widgets/progress_widget.dart';

Widget summaryDashboard(context){
  return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.16,
        margin: EdgeInsets.only(left: 20, right: 20),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 16, 188, 231),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Your today's task \nalmost done!",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              FilledButton(
                  onPressed: () {},
                  child: Text(
                    "View Task",
                    style: TextStyle(color: Colors.white),
                  ))
            ]),
            progressWidget(context),
            Container(
                padding: EdgeInsets.symmetric(vertical: 0.05, horizontal: 0.5),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(98, 211, 207, 207),
                    borderRadius: BorderRadius.circular(6)),
                child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.more_horiz_rounded,
                      color: Colors.white,
                    )))
          ],
        ),
      );
}