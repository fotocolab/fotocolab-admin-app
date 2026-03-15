import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/calendar/response/events/events_response_model.dart';
import 'package:fotocolab_admin/src/feature/calendar/data/calendar_repo.dart';

class CalendarRemoteRepo implements CalendarRepo {
  @override
  Future<List<EventsResponseModel>> getEvents() async {
    var response = await rootBundle.loadString(
      'assets/stub/events_2026_calendar.json',
    );
    try {
      List<dynamic> jsonList = json.decode(response);

      List<EventsResponseModel> eventsList = jsonList
          .map((jsonItem) => EventsResponseModel.fromJson(jsonItem))
          .toList();

      return eventsList;
    } catch (e) {
      return [];
    }
  }
}

final calendarRemoteRepoProvider = Provider<CalendarRemoteRepo>(
  (ref) => CalendarRemoteRepo(),
);
