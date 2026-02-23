import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/src/feature/subscription/presentation/provider/subscription_provider.dart';
import 'package:fotocolab_admin/util/enum/subscription_duration_enum.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_admin/util/validator/validator.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class EnterSubscriptionWidget extends ConsumerStatefulWidget {
  final TextEditingController? planNameController,
      priceController,
      taglineController,
      nofOfDaysController;
  const EnterSubscriptionWidget({
    super.key,
    this.planNameController,
    this.priceController,
    this.taglineController,
    this.nofOfDaysController,
  });

  @override
  ConsumerState<EnterSubscriptionWidget> createState() =>
      _CreateSubscriptionNameWidgetState();
}

class _CreateSubscriptionNameWidgetState
    extends ConsumerState<EnterSubscriptionWidget> {
  late SubscriptionNotifierProvider provider;

  @override
  Widget build(BuildContext context) {
    ref.watch(subscriptionProvider);
    provider = ref.read(subscriptionProvider.notifier);
    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.rocket_launch_rounded, color: AppColors.primary),
                BrandText.white(data: context.loc.plan),
              ],
            ),
          ],
        ),

        BrandVSpace.gap16(),
        Row(
          children: [
            Expanded(
              child: BrandTextField(
                label: context.loc.plan_name,
                controller: widget.planNameController,
                validator: (value) {
                  return Validator.empty(context: context, value: value);
                },
              ),
            ),
            BrandHSpace.gap10(),
            SizedBox(
              width: 120,
              child: BrandTextField(
                label: context.loc.price,
                keyboardType: .number,
                controller: widget.priceController,
                validator: (value) {
                  return Validator.empty(context: context, value: value);
                },
              ),
            ),
          ],
        ),
        BrandVSpace.gap20(),
        BrandTextField(
          label: context.loc.plan_title,
          controller: widget.taglineController,
          validator: (value) {
            return Validator.empty(context: context, value: value);
          },
        ),
        BrandVSpace.gap30(),
        BrandDropDownButton<SubscriptionDurationEnum>(
          label: context.loc.plan_duration,
          selectedValue: provider.selectedPlanDuration,
          onSelected: (value) {
            provider.setselectedPlanDurationEnum =
                (value as SubscriptionDurationEnum);
            widget.nofOfDaysController?.text =
                provider.selectedPlanDuration?.duration.toString() ?? '';
          },
          items: SubscriptionDurationEnum.values
              .map(
                (e) => BrandDropdownMenuItem<SubscriptionDurationEnum>(
                  value: e,
                  child: BrandText.white(data: e.displayValue),
                ),
              )
              .toList(),
        ),
        if (provider.selectedPlanDuration != null) ...[
          BrandVSpace.gap16(),
          BrandTextField(
            controller: widget.nofOfDaysController,
            label: context.loc.days,
            validator: (value) {
              return Validator.empty(context: context, value: value);
            },
          ),
        ],
        BrandVSpace.gap30(),
      ],
    );
  }
}
