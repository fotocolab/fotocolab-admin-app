// Created By Suresh M, 07/03/2025

import 'package:intl/intl.dart';

abstract class DateFormats {
  static final yyyyMMddHHmmss = DateFormat('yyyy-MM-dd HH:mm:ss');
  static final ddMMyyyy = DateFormat('dd/MM/yyyy');
  static final yyyyMMdd = DateFormat('yyyy/MM/dd');
  static final yyyyMMDD = DateFormat('yyyy-MM-dd');
  static final dateTime = DateFormat('EEE, MMM d,h:mm a');

  ///EEE=> Mon
  static final eee = DateFormat('EEE');

  /// dd=>06
  static final dd = DateFormat('dd');
  static final time = DateFormat("HH:mm");
  static final time12A = DateFormat("hh:mm a");
  static final ddMMM = DateFormat("dd MMM");
  static final yyee = DateFormat("yyyy,EEE");

  ///EEE dd MMM-> Sat 23 Nov 2024
  static final eeeDDMMM = DateFormat("EEE dd MMM");

  ///dd MMM yyyy-> 17 Sep 2025
  static final ddMMMyyyy = DateFormat("dd MMM yyyy");

  ///EEE HH:mm:ss-> WED 13:12:06
  static final eeehhmmss = DateFormat("EEE HH:mm:ss");
}
