enum UploadEnum {
  free(id: 0, value: 'free', displayValue: 'Free Users'),
  paid(id: 1, value: 'paid', displayValue: 'Paid Users');

  const UploadEnum({
    required this.id,
    required this.displayValue,
    required this.value,
  });

  final int id;
  final String displayValue;
  final String value;
}
