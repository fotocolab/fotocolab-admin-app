enum TransitionEnum {
  leftToCenter(displayValue: 'Left To Center', transition: 'leftToCenter'),
  rightToCenter(displayValue: 'Right to Center', transition: 'rightToCenter'),
  put(displayValue: '', transition: 'PUT'),
  delete(displayValue: '', transition: 'DELETE');

  const TransitionEnum({required this.displayValue, required this.transition});

  final String transition;
  final String displayValue;
}
