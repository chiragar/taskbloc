extension DateComparison on DateTime {
  bool isSameDateAs(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }
}
