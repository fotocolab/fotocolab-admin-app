enum SubscriptionDurationEnum {
  weekly(duration: 7, displayValue: 'WEEKLY', value: 'week'),
  monthly(duration: 30, displayValue: 'MONTHLY', value: 'month'),
  yearly(duration: 365, displayValue: 'YEARLY', value: 'year');

  const SubscriptionDurationEnum({
    required this.duration,
    required this.displayValue,
    required this.value,
  });

  final String displayValue;
  final String value;
  final int duration;
}
