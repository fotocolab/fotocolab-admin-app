import 'package:flutter/material.dart';

abstract class DatePickerManager {
  static Future<DateTime?> showPicker({
    required BuildContext context,
    required DateTime firstDate,
    required DateTime lastDate,
    DateTime? initialDate,
  }) async {
    var pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: initialDate,
    );

    return pickedDate;
  }
}
