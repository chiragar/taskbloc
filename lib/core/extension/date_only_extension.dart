extension DateOnly on DateTime {
  String get formattedDate {
    // Format the DateTime to a string with only date (you can customize the format)
    return "${this.day.toString().padLeft(2, '0')}/${this.month.toString().padLeft(2, '0')}/${this.year}";
  }
}
