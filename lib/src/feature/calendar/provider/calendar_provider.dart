import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/calendar/response/events/events_response_model.dart';
import 'package:fotocolab_admin/core/model/calendar/state/calendar_state.dart';
import 'package:fotocolab_admin/src/feature/calendar/data/calendar_remote_repo.dart';

final calendarProvider =
    StateNotifierProvider<CalendarNotifierProvider, CalendarState>(
      (ref) => CalendarNotifierProvider(ref),
    );

class CalendarNotifierProvider extends StateNotifier<CalendarState> {
  CalendarNotifierProvider(this.ref) : super(const CalendarState());

  final Ref ref;

  List<EventsResponseModel> get events => state.events;

  Future<void> getEvents() async {
    state = state.copyWith(isLoading: true);

    var result = await ref.read(calendarRemoteRepoProvider).getEvents();

    state = state.copyWith(events: result, isLoading: false);
  }

  bool isToday(DateTime? date) {
    if (DateTime.now().day == date?.day &&
        DateTime.now().month == date?.month) {
      return true;
    } else {
      return false;
    }
  }
}
