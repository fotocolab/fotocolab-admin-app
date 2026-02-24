import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/route/route_name.dart';
import 'package:fotocolab_admin/src/feature/subscription/presentation/provider/subscription_provider.dart';
import 'package:fotocolab_admin/src/feature/subscription/presentation/widget/plans_details_widget.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_design_system/design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class SubscriptionScreen extends ConsumerStatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  ConsumerState<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends ConsumerState<SubscriptionScreen> {
  late SubscriptionNotifierProvider provider;
  Future<void> createPlanOnTap() async {
    context.push(RouteName.createSubscription);
  }

  Future<void> fetchData() async {
    await provider.getAllPlan();
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
    ref.watch(subscriptionProvider);
    provider = ref.read(subscriptionProvider.notifier);
    return BaseLayout(
      // appBar: BrandAppBar(title: context.loc.subscription_plans),
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                BrandVSpace.gap16(),
                BrandText.white(
                  data: context.loc.manage_tiers,
                  fontSize: BrandFontSize.size20,
                  fontWeight: .w700,
                ),
                BrandVSpace.gap2(),
                BrandText.grey(
                  data: context.loc.configure_pricing_and_limits,
                  fontColor: AppColors.grey8B,
                ),
                BrandVSpace.gap20(),
                BrandButton.primary(
                  title: context.loc.create_new_plan,
                  onTap: createPlanOnTap,
                  leftIcon: Icon(
                    Icons.add_circle_outline_outlined,
                    color: AppColors.white,
                  ),
                ),
                BrandVSpace.gap20(),

                PlansDetailsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
