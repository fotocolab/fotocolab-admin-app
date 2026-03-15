import 'package:fotocolab_admin/core/model/calendar/response/events/events_response_model.dart';

abstract class CalendarRepo {
  Future<List<EventsResponseModel>> getEvents();
}
