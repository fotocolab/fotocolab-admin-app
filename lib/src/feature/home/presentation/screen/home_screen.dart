import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/src/common/dialog/app_exit_dialog.dart';
import 'package:fotocolab_admin/src/feature/home/presentation/provider/home_provider.dart';
import 'package:fotocolab_admin/src/feature/home/presentation/widget/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:fotocolab_admin/src/feature/profile/presentation/provider/profile_provider.dart';
import 'package:fotocolab_admin/src/feature/profile/presentation/screen/profile_screen.dart';
import 'package:fotocolab_admin/src/feature/subscription/presentation/screen/subscription_screen.dart';
import 'package:fotocolab_admin/src/feature/upload/presentation/screen/upload_screen.dart';
import 'package:fotocolab_admin/util/enum/bottom_nav_enum.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late ProfileNotifierProvider proProvider;

  late HomeNotifierProvider provider;

  Widget getChild() {
    switch (provider.bottomNav) {
      case BottomNavEnum.feed:
        return UploadScreen();
      case BottomNavEnum.discovery:
        return SubscriptionScreen();
      case BottomNavEnum.profile:
        return ProfileScreen();
    }
  }

  void backOnTap() {
    AppExitWarning.showdialog(context: context);
  }

  @override
  Widget build(BuildContext context) {
    proProvider = ref.read(profileProvider.notifier);
    ref.watch(homeProvider);
    provider = ref.read(homeProvider.notifier);
    return BaseLayout(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        backOnTap();
      },
      appBar: BrandAppBar(
        title: context.loc.fotocolab,
        centerTitle: false,
        showBackButton: false,
        actions: [
          Icon(Icons.search, color: AppColors.white),
          BrandHSpace.gap16(),
          BrandHSpace.gap16(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
      child: Expanded(child: getChild()),
    );
  }
}
