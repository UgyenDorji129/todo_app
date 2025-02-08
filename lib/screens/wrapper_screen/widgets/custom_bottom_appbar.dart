import 'package:flutter/material.dart';
import 'package:todo_app/screens/wrapper_screen/widgets/icon_button.dart';

class CustomBottomAppBar extends StatefulWidget {
  final Function(int) switchTab;
  final int currentIndex;

  const CustomBottomAppBar({
    super.key,
    required this.switchTab,
    required this.currentIndex,
  });

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
      ),
      child: BottomAppBar(
        height: 70,
        shape: const CircularNotchedRectangle(),
        color: const Color.fromARGB(153, 230, 225, 246),
        elevation: 10,
        notchMargin: 6.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconButton(0, Icons.home_rounded, widget.currentIndex, widget.switchTab),
              iconButton(1, Icons.calendar_month_rounded, widget.currentIndex, widget.switchTab),
              const SizedBox(width: 30),
              iconButton(2, Icons.insert_drive_file, widget.currentIndex, widget.switchTab),
              iconButton(3, Icons.people_alt_rounded, widget.currentIndex, widget.switchTab),
            ],
          ),
        ),
      ),
    );
  }

}