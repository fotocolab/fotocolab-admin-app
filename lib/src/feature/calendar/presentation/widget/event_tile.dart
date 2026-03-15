import 'package:flutter/material.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_admin/util/formator/date_formator.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';

class EventTile extends StatelessWidget {
  final String? eventName;
  final DateTime? fromDate, toDate;
  final bool isToday;
  final VoidCallback? onTap;
  const EventTile({
    super.key,
    this.eventName,
    this.fromDate,
    this.toDate,
    this.isToday = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BrandInkWell(
      onTap: onTap,
      child: RoundedContainer(
        borderColor: AppColors.primary.withAlpha(30),
        color: AppColors.primary.withAlpha(25),
        width: context.screenWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    RoundedContainer(
                      color: isToday
                          ? AppColors.primary
                          : AppColors.primary.withAlpha(30),
                      width: 65,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            BrandText.white(
                              data: fromDate != null
                                  ? DateFormats.eee.format(fromDate!)
                                  : '--',
                              fontWeight: .w600,
                              fontSize: BrandFontSize.size14,
                            ),
                            BrandText.white(
                              data: fromDate != null
                                  ? DateFormats.dd.format(fromDate!)
                                  : '--',
                              fontWeight: .w700,
                            ),
                          ],
                        ),
                      ),
                    ),
                    BrandHSpace.gap10(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Row(
                            children: [
                              RoundedContainer(
                                width: 10,
                                height: 10,
                                color: isToday
                                    ? AppColors.primary
                                    : AppColors.greyA3,
                              ),
                              BrandHSpace.gap10(),
                              Flexible(
                                child: BrandText.white(
                                  data: eventName ?? '-',
                                  fontWeight: .w600,
                                  fontColor: isToday
                                      ? AppColors.primary
                                      : AppColors.white,
                                ),
                              ),
                            ],
                          ),

                          BrandText.grey(
                            data: fromDate != null
                                ? '${DateFormats.ddMMMyyyy.format(fromDate!)} --> ${DateFormats.ddMMMyyyy.format(toDate!)}'
                                : '--',
                            fontWeight: .w500,
                            fontColor: AppColors.greyA3,
                            fontSize: BrandFontSize.size14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  BrandHSpace.gap10(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: isToday ? AppColors.primary : AppColors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
