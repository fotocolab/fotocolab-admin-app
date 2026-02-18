import 'package:flutter/material.dart';

enum BottomNavEnum {
  feed(
    id: 1,
    value: 'upload',
    displayValue: 'UPLOAD',
    iconData: Icons.cloud_upload_outlined,
  ),

  discovery(
    id: 2,
    value: 'plan',
    displayValue: 'PLAN',
    iconData: Icons.diamond_rounded,
  ),
  profile(
    id: 3,
    value: 'profile',
    displayValue: 'PROFILE',
    iconData: Icons.person,
  );

  // create(
  //   id: 3,
  //   value: 'create',
  //   displayValue: 'CREATE',
  //   img: Assets.createIcon,
  // ),
  // library(
  //   id: 4,
  //   value: 'library',
  //   displayValue: 'LIBRARY',
  //   img: Assets.libraryIcon,
  // );

  const BottomNavEnum({
    required this.id,
    required this.value,
    required this.displayValue,
    required this.iconData,
  });

  final String value, displayValue;
  final IconData iconData;
  final int id;
}
