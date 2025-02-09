import 'package:flutter/material.dart';
import 'package:todo_app/global_widget/custom_icon.dart';

void showBottomSheet(context, dropdownItems, buildOption) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...dropdownItems.map((item) {
              return buildOption(item);
            })
          ],
        ),
      );
    },
  );
}

Widget taskGropDropDown({context, dropdownItems, buldOption, selectedValue}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.09,
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
    child: SizedBox(
      child: GestureDetector(
        onTap: () => showBottomSheet(
            context, dropdownItems, buldOption), // Open bottom sheet on tap
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customIcon(icon: Icons.work, color: Colors.pinkAccent, size: 45.0),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Task Group",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  selectedValue,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Spacer(),
            const Icon(
              Icons.arrow_drop_down_rounded,
              size: 50,
            ),
          ],
        ),
      ),
    ),
  );
}
