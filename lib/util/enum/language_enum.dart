enum LanguageEnum {
  english(id: 0, value: 'en', displayValue: 'English'),
  french(id: 1, value: 'hi', displayValue: 'Hindi');

  const LanguageEnum({
    required this.id,
    required this.displayValue,
    required this.value,
  });

  final int id;
  final String displayValue;
  final String value;
}
