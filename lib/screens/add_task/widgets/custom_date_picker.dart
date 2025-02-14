import 'package:flutter/material.dart';

Widget customDatePicker({
  context,
  selectedDate,
  onDateSelected,
  header
}) {
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
          blurRadius: 0.015,
        ),
      ],
    ),
    child: GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate, // Default to current selection
          firstDate: DateTime.now(), // Restrict past dates
          lastDate: DateTime(2100), // Allow future dates
        );

        if (pickedDate != null) {
          onDateSelected(pickedDate); // Update selected date
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calendar_today, color: Colors.pinkAccent, size: 25.0),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(header,
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text(
                "${selectedDate.toLocal()}".split(' ')[0], // Show only date
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(),
          const Icon(Icons.arrow_drop_down_rounded, size: 50),
        ],
      ),
    ),
  );
}
