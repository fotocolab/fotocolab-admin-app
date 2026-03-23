import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/language/state/language_state.dart';
import 'package:fotocolab_admin/util/enum/language_enum.dart';

final languageProvider =
    StateNotifierProvider<LanguageNotifierProvider, LanguageState>(
      (ref) => LanguageNotifierProvider(ref),
    );

class LanguageNotifierProvider extends StateNotifier<LanguageState> {
  LanguageNotifierProvider(this.ref) : super(const LanguageState());

  final Ref ref;

  List<LanguageEnum> get languages => LanguageEnum.values;
}
