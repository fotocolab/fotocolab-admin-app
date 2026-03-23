enum LanguageEnum {
  english(id: "en", value: 'english', displayValue: 'English'),
  hindi(id: "hi", value: 'hindi', displayValue: 'Hindi'),
  assamese(id: "as", value: 'assamese', displayValue: 'Assamese'),
  bengali(id: "bn", value: 'bengali', displayValue: 'Bengali'),
  bodo(id: "bo", value: 'bodo', displayValue: 'Bodo'),
  gujarati(id: "gu", value: 'gujarati', displayValue: 'Gujarati'),
  kannada(id: "kn", value: 'kannada', displayValue: 'Kannada'),
  malayalam(id: 'ml', value: 'malayalam', displayValue: 'Malayalam'),
  marathi(id: 'mr', value: 'marathi', displayValue: 'Marathi'),
  nepali(id: 'ne', value: 'nepali', displayValue: 'Nepali'),
  odia(id: 'or', value: 'odia', displayValue: 'Odia'),
  punjabi(id: 'pa', value: 'punjabi', displayValue: 'Punjabi'),
  tamil(id: 'ta', value: 'tamil', displayValue: 'Tamil'),
  telugu(id: 'te', value: 'telugu', displayValue: 'Telugu'),
  urdu(id: 'ur', value: 'urdu', displayValue: 'Urdu');
  // dogri(id: "doi", value: 'dogri', displayValue: 'Dogri'),
  // kashmiri(id: "ks", value: 'kashmiri', displayValue: 'Kashmiri'),
  // konkani(id: 'kok', value: 'konkani', displayValue: 'Konkani'),
  // maithili(id: 'mai', value: 'maithili', displayValue: 'Maithili'),
  // manipuri(id: 'mni', value: 'manipuri', displayValue: 'Manipuri'),

  // sanskrit(id: 'sa', value: 'sanskrit', displayValue: 'Sanskrit'),
  // santali(id: 'sat', value: 'santali', displayValue: 'Santali'),
  // sindhi(id: 'sd', value: 'sindhi', displayValue: 'Sindhi'),

  const LanguageEnum({
    required this.id,
    required this.displayValue,
    required this.value,
  });

  final String id;
  final String displayValue;
  final String value;
}
