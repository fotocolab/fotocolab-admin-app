import 'dart:developer';

import 'package:fotocolab_admin/app_config.dart';

void debugPrint(Object? value) {
  if (enableDebugPrint) {
    log(value.toString());
  }
}

Duration getBackgoundTime(DateTime pausedTime, DateTime resumedTime) {
  return resumedTime.difference(pausedTime);
}
