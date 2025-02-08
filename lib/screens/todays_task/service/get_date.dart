import 'package:intl/intl.dart';

List<Map<String, dynamic>> getCurrentMonthDetails() {
  final now = DateTime.now();
  final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

  List<Map<String, dynamic>> daysInMonth = [];

  for (var i = 0; i < lastDayOfMonth.day; i++) {
    final currentDate = DateTime(now.year, now.month, i + 1);
    final dayName = DateFormat('E').format(currentDate); // Get day of the week (e.g., "Sun", "Mon")
    final monthName = DateFormat('MMM').format(currentDate); // Get abbreviated month name
    final isToday = currentDate.day == now.day && currentDate.month == now.month && currentDate.year == now.year;

    daysInMonth.add({
      'date': currentDate.day,
      'day': dayName,
      'month': monthName,
      'is_today': isToday,
    });
  }

  return daysInMonth;
}