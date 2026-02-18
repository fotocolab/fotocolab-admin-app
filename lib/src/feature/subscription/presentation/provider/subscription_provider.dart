import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fotocolab_admin/core/model/subscription/feature/subscription_feature_response_model.dart';
import 'package:fotocolab_admin/core/model/subscription/state/subscription_state.dart';

final subscriptionProvider =
    StateNotifierProvider<SubscriptionNotifierProvider, SubscriptionState>(
      (ref) => SubscriptionNotifierProvider(ref),
    );

class SubscriptionNotifierProvider extends StateNotifier<SubscriptionState> {
  SubscriptionNotifierProvider(this.ref) : super(const SubscriptionState());

  final Ref ref;

  List<SubscriptionFeatureResponseModel> get featuresList => state.featuresList;

  void addFeature() {
    var i = [...featuresList];
    i.add(SubscriptionFeatureResponseModel(index: i.length));
    state = state.copyWith(featuresList: i);
  }

  set setFeatureList(String value) {
    // var i=
  }
}
