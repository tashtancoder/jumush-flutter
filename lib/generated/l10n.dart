// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Employer find`
  String get appTitle {
    return Intl.message(
      'Employer find',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Get started`
  String get get_started {
    return Intl.message(
      'Get started',
      name: 'get_started',
      desc: '',
      args: [],
    );
  }

  /// `By signig app you are agree to Jumush`
  String get by_signing_up {
    return Intl.message(
      'By signig app you are agree to Jumush',
      name: 'by_signing_up',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use and Privacy Policy`
  String get terms_use_privacy_policy {
    return Intl.message(
      'Terms of Use and Privacy Policy',
      name: 'terms_use_privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get terms_and_conditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to \n Jumush`
  String get welcome_to_jumush {
    return Intl.message(
      'Welcome to \n Jumush',
      name: 'welcome_to_jumush',
      desc: '',
      args: [],
    );
  }

  /// `Continue with phone number`
  String get continue_with_phone {
    return Intl.message(
      'Continue with phone number',
      name: 'continue_with_phone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your valid phone number. We will send you a 4 digit code to verify your account.`
  String get enter_valid_number {
    return Intl.message(
      'Please enter your valid phone number. We will send you a 4 digit code to verify your account.',
      name: 'enter_valid_number',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_ {
    return Intl.message(
      'Continue',
      name: 'continue_',
      desc: '',
      args: [],
    );
  }

  /// `OTP code`
  String get otp_code {
    return Intl.message(
      'OTP code',
      name: 'otp_code',
      desc: '',
      args: [],
    );
  }

  /// `Type OTP code we have sent you`
  String get enter_otp {
    return Intl.message(
      'Type OTP code we have sent you',
      name: 'enter_otp',
      desc: '',
      args: [],
    );
  }

  /// `Send again`
  String get send_again {
    return Intl.message(
      'Send again',
      name: 'send_again',
      desc: '',
      args: [],
    );
  }

  /// `Profile Setup`
  String get profile_setup {
    return Intl.message(
      'Profile Setup',
      name: 'profile_setup',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Surname`
  String get surname {
    return Intl.message(
      'Surname',
      name: 'surname',
      desc: '',
      args: [],
    );
  }

  /// `Birth Date`
  String get birthdate {
    return Intl.message(
      'Birth Date',
      name: 'birthdate',
      desc: '',
      args: [],
    );
  }

  /// `Employer`
  String get employer {
    return Intl.message(
      'Employer',
      name: 'employer',
      desc: '',
      args: [],
    );
  }

  /// `Employee`
  String get employee {
    return Intl.message(
      'Employee',
      name: 'employee',
      desc: '',
      args: [],
    );
  }

  /// `Sexuality`
  String get sexuality {
    return Intl.message(
      'Sexuality',
      name: 'sexuality',
      desc: '',
      args: [],
    );
  }

  /// `male`
  String get male {
    return Intl.message(
      'male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `female`
  String get female {
    return Intl.message(
      'female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get agree {
    return Intl.message(
      'Agree',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Search person`
  String get search_person {
    return Intl.message(
      'Search person',
      name: 'search_person',
      desc: '',
      args: [],
    );
  }

  /// `Write message...`
  String get write_msg {
    return Intl.message(
      'Write message...',
      name: 'write_msg',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'kg'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
