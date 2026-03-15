import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/calendar/response/events/events_response_model.dart';
import 'package:fotocolab_admin/route/route_name.dart';
import 'package:fotocolab_admin/src/feature/calendar/presentation/widget/event_tile.dart';
import 'package:fotocolab_admin/src/feature/calendar/provider/calendar_provider.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  late CalendarNotifierProvider provider;

  Future<void> fetchData() async {
    await provider.getEvents();
  }

  void gotoAddCategoryScreen(EventsResponseModel item) {
    context.push(RouteName.createCategory, extra: item.toJson());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(calendarProvider);
    provider = ref.read(calendarProvider.notifier);
    return BaseLayout(
      appBar: BrandAppBar(title: context.loc.calendar_and_events),
      child: Expanded(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: provider.events.length,
                itemBuilder: (context, index) {
                  var item = provider.events[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: EventTile(
                      eventName: item.eventName,
                      fromDate: item.fromDate,
                      toDate: item.endDate,
                      isToday: provider.isToday(item.fromDate),
                      onTap: () {
                        gotoAddCategoryScreen(item);
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => BrandVSpace.gap10(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
