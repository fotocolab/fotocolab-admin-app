import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @fotocolab.
  ///
  /// In en, this message translates to:
  /// **'Fotocolab'**
  String get fotocolab;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @fotocolab_admin.
  ///
  /// In en, this message translates to:
  /// **'Fotocolab Admin'**
  String get fotocolab_admin;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgot_password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @secure_admin_access.
  ///
  /// In en, this message translates to:
  /// **'Secure admin access'**
  String get secure_admin_access;

  /// No description provided for @secure_enterprise_access.
  ///
  /// In en, this message translates to:
  /// **'Secure Premium Enterprise Sccess'**
  String get secure_enterprise_access;

  /// No description provided for @please_enter_your_name.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get please_enter_your_name;

  /// No description provided for @please_enter_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Please enter phone number'**
  String get please_enter_phone_number;

  /// No description provided for @phone_number_not_valid.
  ///
  /// In en, this message translates to:
  /// **'Phone number not valid'**
  String get phone_number_not_valid;

  /// No description provided for @please_enter_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter email'**
  String get please_enter_email;

  /// No description provided for @not_a_valid_email.
  ///
  /// In en, this message translates to:
  /// **'Not a valid email'**
  String get not_a_valid_email;

  /// No description provided for @please_enter_amount.
  ///
  /// In en, this message translates to:
  /// **'Please enter amount'**
  String get please_enter_amount;

  /// No description provided for @please_enter_a_valid_amount.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid amount'**
  String get please_enter_a_valid_amount;

  /// No description provided for @please_enter.
  ///
  /// In en, this message translates to:
  /// **'Please enter'**
  String get please_enter;

  /// No description provided for @minimum_eigth_characters.
  ///
  /// In en, this message translates to:
  /// **'Minimum 8 characters'**
  String get minimum_eigth_characters;

  /// No description provided for @at_least_one_uppercase_letter.
  ///
  /// In en, this message translates to:
  /// **'At least one uppercase letter'**
  String get at_least_one_uppercase_letter;

  /// No description provided for @at_least_one_lowercase_letter.
  ///
  /// In en, this message translates to:
  /// **'At least one lowercase letter'**
  String get at_least_one_lowercase_letter;

  /// No description provided for @at_least_one_digit.
  ///
  /// In en, this message translates to:
  /// **'At least one digit'**
  String get at_least_one_digit;

  /// No description provided for @at_least_one_special_character.
  ///
  /// In en, this message translates to:
  /// **'At least one special character (e.g. !@#%)'**
  String get at_least_one_special_character;

  /// No description provided for @no_whitespace_allowed.
  ///
  /// In en, this message translates to:
  /// **'No whitespace allowed'**
  String get no_whitespace_allowed;

  /// No description provided for @passwords_do_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwords_do_not_match;

  /// No description provided for @oops_something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Oops something went wrong'**
  String get oops_something_went_wrong;

  /// No description provided for @but_dont_worry.
  ///
  /// In en, this message translates to:
  /// **'But don\'t worry - it\'s not your fault.'**
  String get but_dont_worry;

  /// No description provided for @asset_manager.
  ///
  /// In en, this message translates to:
  /// **'Asset Manager'**
  String get asset_manager;

  /// No description provided for @bulk_asset_upload.
  ///
  /// In en, this message translates to:
  /// **'Bulk Asset Upload'**
  String get bulk_asset_upload;

  /// No description provided for @drag_and_drop.
  ///
  /// In en, this message translates to:
  /// **'Drag & Drop'**
  String get drag_and_drop;

  /// No description provided for @select_file.
  ///
  /// In en, this message translates to:
  /// **'Select Files'**
  String get select_file;

  /// No description provided for @active_uploads.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE UPLOADS'**
  String get active_uploads;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @upload_category.
  ///
  /// In en, this message translates to:
  /// **'UPLOAD CATEGORY'**
  String get upload_category;

  /// No description provided for @select_existing_category.
  ///
  /// In en, this message translates to:
  /// **'Select Existing Category'**
  String get select_existing_category;

  /// No description provided for @or_manual.
  ///
  /// In en, this message translates to:
  /// **'Manual Entry'**
  String get or_manual;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @plus.
  ///
  /// In en, this message translates to:
  /// **'+'**
  String get plus;

  /// No description provided for @keyword.
  ///
  /// In en, this message translates to:
  /// **'Keywords'**
  String get keyword;

  /// No description provided for @for_search.
  ///
  /// In en, this message translates to:
  /// **'For Search'**
  String get for_search;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @add_category.
  ///
  /// In en, this message translates to:
  /// **'Add category'**
  String get add_category;

  /// No description provided for @subscription_plans.
  ///
  /// In en, this message translates to:
  /// **'Subcription Plans'**
  String get subscription_plans;

  /// No description provided for @manage_tiers.
  ///
  /// In en, this message translates to:
  /// **'Manager Tiers'**
  String get manage_tiers;

  /// No description provided for @configure_pricing_and_limits.
  ///
  /// In en, this message translates to:
  /// **'Configure pricing and limits'**
  String get configure_pricing_and_limits;

  /// No description provided for @create_new_plan.
  ///
  /// In en, this message translates to:
  /// **'Create New Plan'**
  String get create_new_plan;

  /// No description provided for @plan.
  ///
  /// In en, this message translates to:
  /// **'Plan'**
  String get plan;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'PRICE'**
  String get price;

  /// No description provided for @plan_title.
  ///
  /// In en, this message translates to:
  /// **'PLAN TITLE / TAGLINE'**
  String get plan_title;

  /// No description provided for @features.
  ///
  /// In en, this message translates to:
  /// **'FEATURES'**
  String get features;

  /// No description provided for @add_feature.
  ///
  /// In en, this message translates to:
  /// **'Add Feature'**
  String get add_feature;

  /// No description provided for @plan_name.
  ///
  /// In en, this message translates to:
  /// **'PLAN NAME'**
  String get plan_name;

  /// No description provided for @enter_features.
  ///
  /// In en, this message translates to:
  /// **'Enter features'**
  String get enter_features;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @are_you_sure_you_want_to_exit.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit?'**
  String get are_you_sure_you_want_to_exit;

  /// No description provided for @are_you_sure.
  ///
  /// In en, this message translates to:
  /// **'Are your sure?'**
  String get are_you_sure;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @discard_changes.
  ///
  /// In en, this message translates to:
  /// **'Discard Changes'**
  String get discard_changes;

  /// No description provided for @are_you_sure_want_to_discard_changes.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to discard changes?'**
  String get are_you_sure_want_to_discard_changes;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return SEn();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
