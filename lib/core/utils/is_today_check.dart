  bool isToday(DateTime selectedDate) {
    DateTime currentDate = DateTime.now();
    return currentDate.year == selectedDate.year &&
        currentDate.month == selectedDate.month &&
        currentDate.day == selectedDate.day;
  }