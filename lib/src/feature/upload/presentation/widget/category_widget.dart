import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/upload/response/category/upload_category_response_model.dart';
import 'package:fotocolab_admin/route/route_name.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/provider/upload_provider.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_admin/util/validator/validator.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class CategoryWidget extends ConsumerStatefulWidget {
  const CategoryWidget({super.key});

  @override
  ConsumerState<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends ConsumerState<CategoryWidget> {
  late UploadNotifierProvider provider;

  GlobalKey<FormState> keywordFormKey = GlobalKey();

  TextEditingController keywordController = TextEditingController();

  Future<void> fetchData() async {
    await provider.getUploadCategory();
  }

  void gotoCreateCategoryScreen() {
    context.push(RouteName.createCategory);
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
              Row(
                children: [
                  Expanded(
                    child: BrandDropDownButton<UploadCategoryResponseModel>(
                      selectedValue: provider.selectedUploadCategory,
                      items: [
                        // BrandDropdownMenuItem(value: '0', child: BrandTextField()),
                        ...provider.uploadCategory.map(
                          (e) =>
                              BrandDropdownMenuItem<
                                UploadCategoryResponseModel
                              >(
                                value: e,
                                child: BrandText.white(
                                  data: e.categoryName ?? '-',
                                ),
                              ),
                        ),
                      ],
                      onSelected: (value) {
                        provider.setSelectedUploadCategory =
                            value as UploadCategoryResponseModel;
                      },
                    ),
                  ),
                  BrandHSpace.gap10(),
                  BrandIconButon(
                    iconData: Icons.create_new_folder,
                    onTap: gotoCreateCategoryScreen,
                  ),
                ],
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
