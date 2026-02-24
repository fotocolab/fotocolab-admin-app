import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/src/feature/profile/presentation/provider/profile_provider.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  late ProfileNotifierProvider provider;
  @override
  Widget build(BuildContext context) {
    ref.watch(profileProvider);
    provider = ref.read(profileProvider.notifier);
    return BaseLayout(
      child: Column(
        children: [
          BrandText.white(
            data: provider.user?.email ?? '--',
            fontSize: BrandFontSize.size18,
            fontWeight: .w700,
          ),
        ],
      ),
    );
  }
}
