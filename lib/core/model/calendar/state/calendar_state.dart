import 'package:fotocolab_admin/core/model/calendar/response/events/events_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'calendar_state.freezed.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState({
    @Default(false) bool isLoading,
    @Default([]) List<EventsResponseModel> events,
  }) = _CalendarState;
}
