import 'package:flutter/material.dart';
import 'package:fotocolab_admin/util/extension/extension.dart';
import 'package:fotocolab_admin/util/regx/regx.dart';

abstract class Validator {
  static String? nameValidator({
    required BuildContext context,
    required String? value,
    String? errorMessage,
  }) {
    if (value?.isEmpty ?? true) {
      return errorMessage ?? context.loc.please_enter_your_name;
    }

    return null;
  }

  static String? phoneNovalidator({
    required BuildContext context,
    required String? value,
    int? limit,
  }) {
    if (value?.isEmpty ?? true) {
      return context.loc.please_enter_phone_number;
    }
    if (!RegularExpression.digitsOnly.hasMatch(value!)) {
      return context.loc.phone_number_not_valid;
    }
    if (limit != null) {
      if (limit < value.length) {
        return context.loc.phone_number_not_valid;
      }
    }
    return null;
  }

  static String? emailValidator({
    required BuildContext context,
    required String? value,
  }) {
    if (value?.isEmpty ?? true) {
      return context.loc.please_enter_email;
    }

    if (!RegularExpression.email.hasMatch(value ?? '')) {
      return context.loc.not_a_valid_email;
    }
    return null;
  }

  static String? amountValidator({
    required BuildContext context,
    required String? value,
  }) {
    if (value?.isEmpty ?? true) {
      return context.loc.please_enter_amount;
    }

    if (!RegularExpression.amount.hasMatch(value ?? '')) {
      return context.loc.please_enter_a_valid_amount;
    }
    return null;
  }

  static String? empty({
    required BuildContext context,
    required String? value,
    String? errorMessage,
  }) {
    if (value?.isEmpty ?? true) {
      return errorMessage ?? context.loc.please_enter;
    }

    return null;
  }

  static String? password({
    required String pwd,
    required BuildContext context,
  }) {
    final errors = <String>[];

    if (pwd.length < 8) {
      errors.add(context.loc.minimum_eigth_characters);
    }
    if (!RegExp(r'[A-Z]').hasMatch(pwd)) {
      errors.add(context.loc.at_least_one_uppercase_letter);
    }
    if (!RegExp(r'[a-z]').hasMatch(pwd)) {
      errors.add(context.loc.at_least_one_lowercase_letter);
    }
    if (!RegExp(r'\d').hasMatch(pwd)) {
      errors.add(context.loc.at_least_one_digit);
    }
    if (!RegExp(
      r'[!@#\$%\^&\*\(\)\-_\+=\[\]\{\}\|;:\",<\.>\/\?`~]',
    ).hasMatch(pwd)) {
      errors.add(context.loc.at_least_one_special_character);
    }
    if (RegExp(r'\s').hasMatch(pwd)) {
      errors.add(context.loc.no_whitespace_allowed);
    }

    if (errors.isEmpty) return null;
    return errors.join('\n');
  }

  static String? confirmPasword({
    required BuildContext context,
    required String? password,
    required String? confirmPasword,
  }) {
    if (confirmPasword?.isEmpty ?? true) {
      return context.loc.minimum_eigth_characters;
    } else if (password != confirmPasword) {
      return context.loc.passwords_do_not_match;
    }

    return null;
  }
}
