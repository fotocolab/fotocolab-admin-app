import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/provider/upload_provider.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/widget/active_uploads_widget.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/widget/bulk_upload_widget.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/widget/category_widget.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/widget/upload_type_widget.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class UploadScreen extends ConsumerStatefulWidget {
  const UploadScreen({super.key});

  @override
  ConsumerState<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends ConsumerState<UploadScreen> {
  late UploadNotifierProvider provider;
  @override
  Widget build(BuildContext context) {
    ref.watch(uploadProvider);
    provider = ref.read(uploadProvider.notifier);
    return BaseLayout(
      appBar: BrandAppBar(
        title: context.loc.asset_manager,
        centerTitle: false,
        showBackButton: false,
      ),
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                UploadTypeWidget(),
                BrandVSpace.gap10(),
                CategoryWidget(),
                BrandVSpace.gap10(),
                BulkUploadWidget(),
                BrandVSpace.gap10(),
                if (provider.selectedFiles.isNotEmpty) ActiveUploadsWidget(),
                BrandVSpace.gap100(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
