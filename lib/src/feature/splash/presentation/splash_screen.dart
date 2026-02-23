import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/route/route_name.dart';
import 'package:fotocolab_admin/src/feature/profile/presentation/provider/profile_provider.dart';
import 'package:fotocolab_admin/util/assets/assets.dart';
import 'package:fotocolab_admin/util/auth/auth_manager.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late ProfileNotifierProvider provider;

  Future<void> fetchData() async {
    await AuthManager().fetchToken();

    if (AuthManager().token == null) {
      gotoLoginScreen();
    } else {
      await provider.getProfile();
      if (provider.user != null) {
        gotoHomeScreen();
      } else {
        gotoLoginScreen();
      }
    }
  }

  void gotoLoginScreen() {
    context.go(RouteName.login);
  }

  void gotoHomeScreen() {
    context.go(RouteName.home);
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
    ref.watch(profileProvider);
    provider = ref.read(profileProvider.notifier);
    return BaseLayout(
      child: Expanded(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 200),
                child: Image.asset(
                  Assets.logo,
                  width: context.screenWidth * 0.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
