import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/calendar/response/events/events_response_model.dart';
import 'package:fotocolab_admin/route/navigation_service.dart';
import 'package:fotocolab_admin/src/common/date_picker_manager.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/provider/upload_provider.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_admin/util/formator/date_formator.dart';
import 'package:fotocolab_admin/util/validator/validator.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class CreateCategoryScreen extends ConsumerStatefulWidget {
  final dynamic routeArgs;
  const CreateCategoryScreen({super.key, this.routeArgs});

  @override
  ConsumerState<CreateCategoryScreen> createState() =>
      _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends ConsumerState<CreateCategoryScreen> {
  late UploadNotifierProvider provider;
  GlobalKey<FormState> categoryFormKey = GlobalKey();

  TextEditingController categoryController = TextEditingController();

  Future<void> addCategoryOnTap() async {
    bool isValid = categoryFormKey.currentState?.validate() ?? false;
    if (isValid) {
      bool isCreated = await provider.createUploadCategory(
        categoryName: categoryController.text,
      );
      if (isCreated && mounted) {
        NavigationService.showSuccessSnackbar(
          message: context.loc.event_added_successfully,
        );
      }
    }
  }

  Future<void> fromDateOnTap() async {
    var date = await DatePickerManager.showPicker(
      context: context,
      firstDate: provider.firstDate,
      lastDate: provider.lastDate,
    );
    if (date != null) {
      provider.setSelectedFromDate = date;
    }
  }

  Future<void> toDateOnTap() async {
    var date = await DatePickerManager.showPicker(
      context: context,
      firstDate: provider.firstDate,
      lastDate: provider.lastDate,
    );
    if (date != null) {
      provider.setSelectedToDate = date;
    }
  }

  void clearSelectedDate() {
    provider.clearSelectedDate();
  }

  void init() {
    if (widget.routeArgs != null) {
      try {
        var model = EventsResponseModel.fromJson(widget.routeArgs);
        categoryController.text = model.eventName ?? '';
        if (model.fromDate != null) {
          provider.setSelectedFromDate = model.fromDate!.subtract(
            Duration(days: 2),
          );
        }
        if (model.endDate != null) {
          provider.setSelectedToDate = model.endDate!;
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
    ref.watch(uploadProvider);
    provider = ref.read(uploadProvider.notifier);
    return BaseLayout(
      appBar: BrandAppBar(title: context.loc.create_category),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Form(
              key: categoryFormKey,
              child: BrandTextField(
                hintText: context.loc.category_name,
                controller: categoryController,
                validator: (value) {
                  return Validator.empty(context: context, value: value);
                },
              ),
            ),
            BrandVSpace.gap10(),
            Row(
              crossAxisAlignment: .start,
              children: [
                Expanded(
                  child: BrandButton.secondary(
                    title: provider.selectedFromDate == null
                        ? context.loc.from
                        : DateFormats.ddMMyyyy.format(
                            provider.selectedFromDate!,
                          ),
                    onTap: fromDateOnTap,
                    borderColor: AppColors.primary,
                    bgColor: AppColors.primary.withAlpha(100),
                    fontColor: AppColors.primary,
                    fontSize: 12,
                  ),
                ),
                BrandHSpace.gap10(),
                Expanded(
                  child: BrandButton.secondary(
                    title: provider.selectedToDate == null
                        ? context.loc.to
                        : DateFormats.ddMMyyyy.format(provider.selectedToDate!),
                    onTap: toDateOnTap,
                    borderColor: AppColors.primary,
                    bgColor: AppColors.primary.withAlpha(100),
                    fontColor: AppColors.primary,
                    fontSize: 12,
                  ),
                ),
                BrandHSpace.gap10(),
                BrandIconButon(iconData: Icons.clear, onTap: clearSelectedDate),
              ],
            ),
            BrandVSpace.gap10(),
            SizedBox(
              child: BrandButton.secondary(
                title: context.loc.add_category,
                onTap: addCategoryOnTap,
                borderColor: AppColors.primary,
                bgColor: AppColors.primary.withAlpha(100),
                fontColor: AppColors.primary,
                fontSize: 16,
                isLoading: provider.isCreateCategoryLoading,
              ),
            ),
            BrandVSpace.gap10(),
          ],
        ),
      ),
    );
  }
}
