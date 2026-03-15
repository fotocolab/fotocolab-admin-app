import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/route/route_name.dart';
import 'package:fotocolab_admin/src/feature/profile/presentation/provider/profile_provider.dart';
import 'package:fotocolab_admin/src/feature/profile/presentation/widget/icon_title_tile.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  late ProfileNotifierProvider provider;

  void gotoCalenderOnTap() {
    context.push(RouteName.calendar);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(profileProvider);
    provider = ref.read(profileProvider.notifier);
    return BaseLayout(
      child: Column(
        children: [
          BrandText.white(
            data: provider.user?.fullName ?? '--',
            fontSize: BrandFontSize.size18,
            fontWeight: .w700,
          ),

          BrandDivider(),
          IconTitleTile(
            iconData: Icons.calendar_month,
            value: context.loc.calendar,
            iconColor: AppColors.primary,
            onTap: gotoCalenderOnTap,
          ),
          BrandDivider(),
        ],
      ),
    );
  }
}
