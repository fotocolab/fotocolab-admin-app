// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 30/07/2025
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/src/feature/home/presentation/provider/home_provider.dart';
import 'package:fotocolab_admin/src/feature/home/presentation/widget/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:fotocolab_admin/util/enum/bottom_nav_enum.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  late HomeNotifierProvider provider;

  void onTap(BottomNavEnum item) {
    provider.setSelectedBottomNavBar = item;
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(homeProvider);
    provider = ref.read(homeProvider.notifier);
    return SafeArea(
      child: Column(
        mainAxisAlignment: .end,
        mainAxisSize: .min,
        children: [
          BrandDivider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: provider.bottomNavBars
                  .map(
                    (e) => BottomNavBarWidget(
                      iconData: e.iconData,
                      title: e.displayValue,
                      isActive: e == provider.bottomNav,
                      onTap: () {
                        onTap(e);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
