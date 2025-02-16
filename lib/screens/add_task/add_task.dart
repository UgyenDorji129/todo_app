// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_task/widgets/add_task_botton.dart';
import 'package:todo_app/screens/add_task/widgets/custom_date_picker.dart';
import 'package:todo_app/screens/add_task/widgets/custom_input_field.dart';
import 'package:todo_app/screens/add_task/widgets/task_group_dropdown.dart';

class AddTask extends StatefulWidget {
  var addTask;
  AddTask({super.key, this.addTask});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var selectedValue = "Office Project";
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();

  final List<String> dropdownItems = [
    'Office Project',
    'Personal Project',
    'Group Project',
    'Marketing Project',
    'Skill Development'
  ];
  TextEditingController projectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Widget buildOption(String option) {
    return ListTile(
      title: Text(option),
      onTap: () {
        setState(() {
          selectedValue = option;
        });
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('assets/home_back.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            taskGropDropDown(
                context: context,
                dropdownItems: dropdownItems,
                buldOption: buildOption,
                selectedValue: selectedValue),
            customInputField(16.0,
                context: context,
                controller: projectController,
                title: "Project Name",
                height: 0.09),
            customInputField(0.0,
                context: context,
                controller: descriptionController,
                title: "Description",
                height: 0.15),
            customDatePicker(
              header: "Start Date",
              context: context,
              selectedDate: selectedStartDate,
              onDateSelected: (date) {
                setState(() {
                  selectedStartDate = date;
                });
              },
            ),
            customDatePicker(
              header: "End Date",
              context: context,
              selectedDate: selectedEndDate,
              onDateSelected: (date) {
                setState(() {
                  selectedEndDate = date;
                });
              },
            ),
            addTaskButton(
                context: context,
                projectController: projectController,
                taskGroup: selectedValue,
                addTask: widget.addTask),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
