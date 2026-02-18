import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/src/feature/subscription/presentation/provider/subscription_provider.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class CreateSubscriptionScreen extends ConsumerStatefulWidget {
  const CreateSubscriptionScreen({super.key});

  @override
  ConsumerState<CreateSubscriptionScreen> createState() =>
      _CreateSubscriptionScreenState();
}

class _CreateSubscriptionScreenState
    extends ConsumerState<CreateSubscriptionScreen> {
  late SubscriptionNotifierProvider provider;
  Future<void> delete() async {}
  @override
  Widget build(BuildContext context) {
    ref.watch(subscriptionProvider);
    provider = ref.read(subscriptionProvider.notifier);
    return BaseLayout(
      appBar: BrandAppBar(title: context.loc.create_new_plan),
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                RoundedContainer(
                  color: AppColors.green28,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 26,
                    ),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.rocket_launch_rounded,
                                  color: AppColors.primary,
                                ),
                                BrandText.white(data: context.loc.plan),
                              ],
                            ),
                            BrandIconButon(
                              borderColor: AppColors.red55,
                              iconData: Icons.delete_outline_outlined,
                              iconColor: AppColors.white,
                              onTap: delete,
                            ),
                          ],
                        ),

                        BrandVSpace.gap10(),
                        Row(
                          children: [
                            Expanded(
                              child: BrandTextField(
                                label: context.loc.plan_name,
                              ),
                            ),
                            BrandHSpace.gap10(),
                            SizedBox(
                              width: 120,
                              child: BrandTextField(
                                label: context.loc.price,
                                keyboardType: .number,
                              ),
                            ),
                          ],
                        ),
                        BrandVSpace.gap20(),
                        BrandTextField(label: context.loc.plan_title),
                        BrandVSpace.gap30(),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            BrandText.white(
                              data: context.loc.features,
                              fontColor: AppColors.blueAF,
                              fontWeight: .w700,
                            ),
                            BrandTextButton(
                              title: context.loc.add_feature,
                              onTap: () {
                                provider.addFeature();
                              },
                            ),
                          ],
                        ),
                        BrandVSpace.gap10(),
                        ...provider.featuresList.map(
                          (e) => Column(
                            children: [
                              BrandTextField(
                                hintText: context.loc.enter_features,
                                onChanged: (p0) {},
                              ),
                              BrandVSpace.gap20(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BrandVSpace.gap30(),
                BrandButton.primary(title: context.loc.create, onTap: () {}),
                BrandVSpace.gap100(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
