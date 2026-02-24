import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/subscription/response/plans_response_model.dart/plans_response_model.dart';
import 'package:fotocolab_admin/route/navigation_service.dart';
import 'package:fotocolab_admin/src/feature/subscription/presentation/provider/subscription_provider.dart';
import 'package:fotocolab_admin/src/feature/subscription/presentation/widget/create_subscription_name_widget.dart';
import 'package:fotocolab_admin/util/enum/subscription_duration_enum.dart';
import 'package:fotocolab_admin/util/enum/subscription_feature_enum.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_admin/util/regx/regx.dart';
import 'package:fotocolab_admin/util/validator/validator.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class EditSubscriptionScreen extends ConsumerStatefulWidget {
  final dynamic routeArgs;
  const EditSubscriptionScreen({super.key, this.routeArgs});

  @override
  ConsumerState<EditSubscriptionScreen> createState() =>
      _EditSubscriptionScreenState();
}

class _EditSubscriptionScreenState
    extends ConsumerState<EditSubscriptionScreen> {
  late SubscriptionNotifierProvider provider;

  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController planNameController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController taglineController = TextEditingController();

  TextEditingController nofOfDaysController = TextEditingController();

  TextEditingController perDayDownloadsController = TextEditingController();

  PlansResponseModel? plans;
  Future<void> editSubscription() async {
    bool isValid = formKey.currentState?.validate() ?? false;
    if (provider.selectedPlanDuration == null) {
      NavigationService.showErrorSnackbar(
        message: context.loc.please_select_plan_duration,
      );
      return;
    }

    if (isValid) {
      bool isCreated = await provider.updateSubscription(
        planName: planNameController.text,
        price: priceController.text,
        tagline: taglineController.text,
        perDayDownloads: perDayDownloadsController.text,
        planId: plans?.planId,
      );

      if (isCreated && mounted) {
        NavigationService.showSuccessSnackbar(
          message: context.loc.plan_updated_successfully,
        );
        provider.getAllPlan();
        await Future.delayed(const Duration(seconds: 2));
        popScreen();
      }
    }
  }

  void popScreen() {
    context.pop();
  }

  Future<void> init() async {
    if (widget.routeArgs != null) {
      try {
        plans = PlansResponseModel.fromJson(json.decode(widget.routeArgs));
        if (plans == null) return;
        planNameController.text = plans!.planName ?? '';
        priceController.text = plans!.price?.toString() ?? '';
        taglineController.text = plans!.tagLine?.toString() ?? '';
        nofOfDaysController.text = plans!.duration?.value?.toString() ?? '';
        perDayDownloadsController.text =
            plans!.features?.perDayDownloads.toString() ?? '';

        provider.setFeature = plans!.features;
        if (plans!.duration?.unit == SubscriptionDurationEnum.weekly.value) {
          provider.setselectedPlanDurationEnum = .weekly;
        } else if (plans!.duration?.unit ==
            SubscriptionDurationEnum.monthly.value) {
          provider.setselectedPlanDurationEnum = .monthly;
        } else if (plans!.duration?.unit ==
            SubscriptionDurationEnum.yearly.value) {
          provider.setselectedPlanDurationEnum = .yearly;
        }
      } catch (e) {
        //
      }
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(subscriptionProvider);
    provider = ref.read(subscriptionProvider.notifier);
    return BaseLayout(
      appBar: BrandAppBar(title: context.loc.edit_plan),
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
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
                          EnterSubscriptionWidget(
                            nofOfDaysController: nofOfDaysController,
                            planNameController: planNameController,
                            priceController: priceController,
                            taglineController: taglineController,
                          ),

                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              BrandText.white(
                                data: context.loc.features,
                                fontColor: AppColors.blueAF,
                                fontWeight: .w700,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 17),
                                child: BrandCheckBox(
                                  value: provider.isSelectAllFeatures,
                                  onChanged: (value) {
                                    provider.setIsSelectAllFeatures =
                                        value ?? false;
                                    provider.selectAllFeatures();
                                  },
                                ),
                              ),
                            ],
                          ),
                          BrandVSpace.gap10(),

                          ...provider.features.toJson().entries.map((e) {
                            if (e.key ==
                                SubscriptionFeatureEnum
                                    .unlimitedDownloads
                                    .name) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Column(
                                  children: [
                                    BrandCheckboxTile(
                                      title: e.key.camelCaseToTitle(),
                                      isSelected: e.value,
                                      onTap: () {
                                        provider.updatedFeatures(e.key);
                                      },
                                    ),
                                    if (e.value == false) ...[
                                      BrandVSpace.gap10(),
                                      BrandTextField(
                                        controller: perDayDownloadsController,
                                        hintText: context.loc.per_day_download,
                                        keyboardType: .number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                            RegularExpression.digitsOnly,
                                          ),
                                        ],

                                        validator: (value) {
                                          return Validator.empty(
                                            context: context,
                                            value: value,
                                          );
                                        },
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
                                onTap: () {
                                  provider.updatedFeatures(e.key);
                                },
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  BrandVSpace.gap30(),
                  BrandButton.primary(
                    title: context.loc.update,
                    onTap: editSubscription,
                    isLoading: provider.isUpdatePlanLoading,
                  ),
                  BrandVSpace.gap100(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
