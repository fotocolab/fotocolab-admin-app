// Created By Suresh M, 10/03/2025

import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    if (text.length > oldValue.text.length) {
      if (text.length == 2 || text.length == 5) {
        text += '/'; // Auto-insert `/` after day and month
      }
    }

    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
