import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension FormatDate on DateTime {
  String formatDate() {
    return DateFormat('dd-MM-yyyy').format(this);
  }
}

extension FormatTime on TimeOfDay {
  String formatTime() {
    final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    return DateFormat('HH:mm').format(dateTime);
  }
}
