import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/home/state/home_state.dart';
import 'package:fotocolab_admin/util/enum/bottom_nav_enum.dart';

final homeProvider = StateNotifierProvider<HomeNotifierProvider, HomeState>(
  (ref) => HomeNotifierProvider(ref),
);

class HomeNotifierProvider extends StateNotifier<HomeState> {
  HomeNotifierProvider(this.ref) : super(const HomeState());

  final Ref ref;

  BottomNavEnum get bottomNav => state.selectedBottomNav;

  List<BottomNavEnum> get bottomNavBars => BottomNavEnum.values;

  bool get isWhatsappInstalled => state.isWhatsappInstalled;

  set setSelectedBottomNavBar(BottomNavEnum value) {
    state = state.copyWith(selectedBottomNav: value);
  }

  set setIsWhatsappInstalled(bool values) {
    state = state.copyWith(isWhatsappInstalled: values);
  }
}
