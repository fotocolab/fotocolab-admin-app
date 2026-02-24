import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/subscription/response/plans_response_model.dart/plans_response_model.dart';
import 'package:fotocolab_admin/route/route_name.dart';
import 'package:fotocolab_admin/src/common/dialog/app_exit_dialog.dart';
import 'package:fotocolab_admin/src/feature/subscription/presentation/provider/subscription_provider.dart';
import 'package:fotocolab_admin/util/enum/subscription_feature_enum.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:fotocolab_design_system/design_system/widget/brand_switch.dart';
import 'package:go_router/go_router.dart';

class PlansDetailsWidget extends ConsumerStatefulWidget {
  const PlansDetailsWidget({super.key});

  @override
  ConsumerState<PlansDetailsWidget> createState() => _PlansDetailsWidgetState();
}

class _PlansDetailsWidgetState extends ConsumerState<PlansDetailsWidget> {
  late SubscriptionNotifierProvider provider;

  Future<void> deleteOnTap(PlansResponseModel item) async {
    AppExitWarning.showdialog(
      context: context,
      title: context.loc.delete_q,
      subTitle: context.loc.are_you_sure_want_to_delete,
      iconData: Icons.delete_forever_rounded,
      onConfirm: () async {
        var isDeleted = await provider.deletePlan(planId: item.planId);
        if (isDeleted && mounted) {
          context.pop();
        }
        provider.getAllPlan();
      },
    );
  }

  Future<void> deactivateOnTap(PlansResponseModel item) async {
    AppExitWarning.showdialog(
      context: context,
      title: context.loc.deactivate_q,
      subTitle: context.loc.are_you_sure_want_to_deactivate,
      iconData: Icons.toggle_off,
      onConfirm: () async {
        var isDeleted = await provider.deactivatePlan(planId: item.planId);
        if (isDeleted && mounted) {
          context.pop();
        }
        provider.getAllPlan();
      },
    );
  }

  Future<void> activateOnTap(PlansResponseModel item) async {
    AppExitWarning.showdialog(
      context: context,
      title: context.loc.activate_q,
      subTitle: context.loc.are_you_sure_want_to_activate,
      iconData: Icons.toggle_on,
      onConfirm: () async {
        var isDeleted = await provider.activatePlan(planId: item.planId);
        if (isDeleted && mounted) {
          context.pop();
        }
        provider.getAllPlan();
      },
    );
  }

  void gotoEditSubscriptionScreen(PlansResponseModel item) {
    context.push(RouteName.editSubscription, extra: json.encode(item));
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(subscriptionProvider);
    provider = ref.read(subscriptionProvider.notifier);
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: provider.plans.length,
          itemBuilder: (context, index) {
            var item = provider.plans[index];
            return RoundedContainer(
              color: AppColors.blue29,
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
                        BrandText.white(
                          data: item.planName ?? '--',
                          fontWeight: .w700,
                        ),
                        if (item.isDeleted != true)
                          BrandSwitch(
                            value: item.isActive ?? false,
                            onChanged: (value) {
                              if (item.isActive == true) {
                                deactivateOnTap(item);
                              } else {
                                activateOnTap(item);
                              }
                            },
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        BrandText.primary(
                          data: item.price?.toString() ?? '--',
                          fontWeight: .w700,
                        ),
                        BrandText.white(
                          data: '/${item.duration?.unit}',
                          fontColor: AppColors.grey8B,
                        ),
                      ],
                    ),
                    BrandVSpace.gap20(),
                    BrandText.white(
                      data: context.loc.features,
                      fontColor: AppColors.blueAF,
                      fontWeight: .w700,
                    ),
                    BrandVSpace.gap10(),
                    if (item.features != null)
                      ...item.features!.toJson().entries.map((e) {
                        if (e.key ==
                            SubscriptionFeatureEnum.unlimitedDownloads.name) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Column(
                              children: [
                                BrandCheckboxTile(
                                  title: e.key.camelCaseToTitle(),
                                  isSelected: e.value,
                                ),
                                if (e.value == false) ...[
                                  BrandVSpace.gap10(),
                                  BrandTextField(
                                    controller: TextEditingController(
                                      text: item.features!
                                          .toJson()[SubscriptionFeatureEnum
                                              .perDayDownloads
                                              .name]
                                          .toString(),
                                    ),
                                    hintText: context.loc.per_day_download,
                                    keyboardType: .number,
                                    enabled: false,
                                  ),
                                ],
                              ],
                            ),
                          );
                        }

                        if (e.key ==
                            SubscriptionFeatureEnum.perDayDownloads.name) {
                          return SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: BrandCheckboxTile(
                            title: e.key.camelCaseToTitle(),
                            isSelected: e.value,
                          ),
                        );
                      }),
                    BrandVSpace.gap26(),
                    if (item.isDeleted != true)
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          BrandIconButon(
                            iconData: Icons.edit,
                            onTap: () {
                              gotoEditSubscriptionScreen(item);
                            },
                          ),
                          BrandIconButon(
                            iconData: Icons.delete_forever,
                            borderColor: AppColors.red,
                            iconColor: AppColors.red,
                            isLoading: provider.isDeletePlanLoading,
                            onTap: () {
                              deleteOnTap(item);
                            },
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => BrandVSpace.gap20(),
        ),
      ],
    );
  }
}
