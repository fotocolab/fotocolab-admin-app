import 'package:flutter/material.dart';
import 'package:fotocolab_admin/util/assets/assets.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
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
