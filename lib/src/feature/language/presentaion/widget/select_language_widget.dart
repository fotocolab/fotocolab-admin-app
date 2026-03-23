import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/src/feature/language/presentaion/provider/language_provider.dart';
import 'package:fotocolab_admin/util/enum/language_enum.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class SelectLanguageWidget extends ConsumerStatefulWidget {
  final Function(LanguageEnum? langauge)? onChanged;
  final String? label;
  final LanguageEnum initialSelection;
  const SelectLanguageWidget({
    super.key,
    this.onChanged,
    this.label,
    this.initialSelection = .english,
  });

  @override
  ConsumerState<SelectLanguageWidget> createState() =>
      _SelectLanguageWidgetState();
}

class _SelectLanguageWidgetState extends ConsumerState<SelectLanguageWidget> {
  late LanguageNotifierProvider provider;
  @override
  Widget build(BuildContext context) {
    ref.watch(languageProvider);
    provider = ref.read(languageProvider.notifier);
    return Column(
      crossAxisAlignment: .start,
      children: [
        BrandText.grey(
          data: widget.label ?? context.loc.default_language,
          fontColor: AppColors.greyA3,
        ),
        BrandVSpace.gap10(),
        DropdownMenu(
          width: context.screenWidth,
          menuStyle: MenuStyle(backgroundColor: .all(AppColors.secondary)),
          initialSelection: widget.initialSelection,
          textStyle: BrandTextStyle(color: AppColors.white),
          onSelected: (value) {
            widget.onChanged?.call(value);
          },
          dropdownMenuEntries: provider.languages
              .map(
                (e) => DropdownMenuEntry(
                  value: e,
                  label: e.displayValue,
                  labelWidget: BrandText.primary(data: e.displayValue),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
