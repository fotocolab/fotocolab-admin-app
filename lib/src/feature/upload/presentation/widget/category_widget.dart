import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/upload/response/category/upload_category_response_model.dart';
import 'package:fotocolab_admin/src/common/date_picker_manager.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/provider/upload_provider.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_admin/util/formator/date_formator.dart';
import 'package:fotocolab_admin/util/validator/validator.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class CategoryWidget extends ConsumerStatefulWidget {
  const CategoryWidget({super.key});

  @override
  ConsumerState<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends ConsumerState<CategoryWidget> {
  late UploadNotifierProvider provider;

  GlobalKey<FormState> categoryFormKey = GlobalKey();

  GlobalKey<FormState> keywordFormKey = GlobalKey();

  TextEditingController categoryController = TextEditingController();

  TextEditingController keywordController = TextEditingController();

  Future<void> fetchData() async {
    await provider.getUploadCategory();
  }

  Future<void> addCategoryOnTap() async {
    bool isValid = categoryFormKey.currentState?.validate() ?? false;
    if (isValid) {
      await provider.createUploadCategory(
        categoryName: categoryController.text,
      );
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(uploadProvider);
    provider = ref.read(uploadProvider.notifier);
    return RoundedContainer(
      color: AppColors.blue29.withAlpha(100),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Icon(Icons.folder, color: AppColors.primary),
                BrandHSpace.gap4(),
                BrandText.white(
                  data: context.loc.upload_category,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            BrandVSpace.gap10(),
            if (provider.isCategoryLoading) ...[
              BrandLoaderWidget(width: 50),
            ] else if (provider.uploadCategory.isEmpty)
              ...[]
            else
              BrandDropDownButton<UploadCategoryResponseModel>(
                selectedValue: provider.selectedUploadCategory,
                items: [
                  BrandDropdownMenuItem(value: '0', child: BrandTextField()),

                  ...provider.uploadCategory.map(
                    (e) => BrandDropdownMenuItem<UploadCategoryResponseModel>(
                      value: e,
                      child: BrandText.white(data: e.categoryName ?? '-'),
                    ),
                  ),
                ],
                onSelected: (value) {
                  provider.setSelectedUploadCategory =
                      value as UploadCategoryResponseModel;
                },
              ),
            BrandVSpace.gap10(),
            Row(
              crossAxisAlignment: .start,
              children: [
                Expanded(
                  child: Form(
                    key: categoryFormKey,
                    child: BrandTextField(
                      hintText: context.loc.or_manual,
                      controller: categoryController,
                      validator: (value) {
                        return Validator.empty(context: context, value: value);
                      },
                    ),
                  ),
                ),
                BrandHSpace.gap10(),
                BrandButton.secondary(
                  title: provider.selectedFromDate == null
                      ? context.loc.from
                      : DateFormats.ddMMyyyy.format(provider.selectedFromDate!),
                  onTap: fromDateOnTap,
                  borderColor: AppColors.primary,
                  bgColor: AppColors.primary.withAlpha(100),
                  fontColor: AppColors.primary,
                  fontSize: 12,
                ),
                BrandHSpace.gap10(),
                BrandButton.secondary(
                  title: provider.selectedToDate == null
                      ? context.loc.to
                      : DateFormats.ddMMyyyy.format(provider.selectedToDate!),
                  onTap: toDateOnTap,
                  borderColor: AppColors.primary,
                  bgColor: AppColors.primary.withAlpha(100),
                  fontColor: AppColors.primary,
                  fontSize: 12,
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
              ),
            ),
            BrandVSpace.gap10(),
            BrandDivider(color: AppColors.blue.withAlpha(100)),
            BrandVSpace.gap16(),
            Row(
              children: [
                Icon(Icons.search_rounded, color: AppColors.primary),
                BrandHSpace.gap4(),
                BrandText.white(
                  data: context.loc.for_search,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            BrandVSpace.gap10(),
            Row(
              children: [
                Expanded(
                  child: Form(
                    key: keywordFormKey,
                    child: BrandTextField(
                      hintText: context.loc.keyword,
                      controller: keywordController,
                      validator: (value) {
                        return Validator.empty(context: context, value: value);
                      },
                    ),
                  ),
                ),
                BrandHSpace.gap10(),
                SizedBox(
                  width: 55,
                  child: BrandButton.secondary(
                    title: context.loc.plus,
                    onTap: () {
                      bool isValid =
                          keywordFormKey.currentState?.validate() ?? false;
                      if (isValid) {
                        provider.addKeywords(keywordController.text);
                      }
                    },
                    borderColor: AppColors.primary,
                    bgColor: AppColors.primary.withAlpha(100),
                    fontColor: AppColors.primary,
                    fontSize: 26,
                  ),
                ),
              ],
            ),
            BrandHSpace.gap10(),
            Wrap(
              children: [
                ...provider.keywords.map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: BrandText.white(data: e),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
