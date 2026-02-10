import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fotocolab_admin/localization/l10n/l10n.dart';
import 'package:fotocolab_admin/route/navigation_service.dart';
import 'package:fotocolab_admin/route/routes.dart';
import 'package:fotocolab_design_system/design_system/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fotocolab',
      debugShowCheckedModeBanner: false,
      supportedLocales: S.supportedLocales,
      locale: Locale('en'),
      routerConfig: routerConfig,
      theme: BrandThemes.lightTheme,
      scaffoldMessengerKey: NavigationService.scaffoldMessengerKey,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
