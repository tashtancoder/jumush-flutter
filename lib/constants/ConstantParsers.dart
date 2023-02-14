import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConstantParsers {
  static Color fromHex(String hex) {
    if (hex == null || hex.length < 5) return Color(255);
    Color color;
    try {
      color = Color(int.parse('ff' + hex.replaceFirst('#', ''), radix: 16));
    } catch (_) {
      color = Color(255);
    }
    return color;
  }

  static String percentFormat(BuildContext context, double number) {
    final locale = Localizations.localeOf(context);
    print('Locale ${locale.toString()}');
    NumberFormat decimalPercentPattern = NumberFormat.decimalPercentPattern(
        locale: locale.toString(), decimalDigits: 2);
    return decimalPercentPattern.format(number);
  }

  static String currencyFormat(BuildContext context, double number) {
    final locale = Localizations.localeOf(context);
    NumberFormat currencyFormat;
    print('Locale ${locale.toString()}');
    if (locale.toString() == 'tr') {
      currencyFormat = NumberFormat.currency(
        locale: locale.toString(),
        name: 'TRY',
        symbol: '₺',
        decimalDigits: 2,
      );
    } else {
      currencyFormat = NumberFormat.simpleCurrency(
          locale: locale.toString(), decimalDigits: 2);
    }
    return currencyFormat.format(number);
  }

  static String currencyFormatForAll(BuildContext context, double number, String countryCode) {
    print('CountryCode ' + countryCode);
    NumberFormat currencyFormat;
    if (countryCode == 'tr') {
      currencyFormat = NumberFormat.currency(
        locale: countryCode,
        name: 'TRY',
        symbol: '₺',
        decimalDigits: 2,
      );
    } else {
      currencyFormat = NumberFormat.simpleCurrency(
          locale: countryCode, decimalDigits: 2);
    }
    return currencyFormat.format(number);
  }

  static String getCurrencySymbol(BuildContext context, String countryCode) {
    print('CountryCode ' + countryCode);
    NumberFormat currencyFormat;
    if (countryCode == 'tr') {
      currencyFormat = NumberFormat.currency(
        locale: countryCode,
        name: 'TRY',
        symbol: '₺',
        decimalDigits: 2,
      );
    } else {
      currencyFormat = NumberFormat.simpleCurrency(
          locale: countryCode, decimalDigits: 2);
    }
    return currencyFormat.currencySymbol;
  }

  static String getFileFormat(String fName) {
    return fName.split('.').last;
  }

  static String getSeason(int season) {
    return "20${season.toString().substring(1, 3)}-20${season.toString().substring(3, 5)}";
  }
}
