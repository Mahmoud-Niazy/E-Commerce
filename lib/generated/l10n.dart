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

  /// `Discover Daily and Tendy Products`
  String get onBoarding1 {
    return Intl.message(
      'Discover Daily and Tendy Products',
      name: 'onBoarding1',
      desc: '',
      args: [],
    );
  }

  /// `Everything You Need in Our Place`
  String get onBoarding2 {
    return Intl.message(
      'Everything You Need in Our Place',
      name: 'onBoarding2',
      desc: '',
      args: [],
    );
  }

  /// `You Will Find Products Of All Categories`
  String get onBoarding3 {
    return Intl.message(
      'You Will Find Products Of All Categories',
      name: 'onBoarding3',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy Our Discounts`
  String get onBoarding4 {
    return Intl.message(
      'Enjoy Our Discounts',
      name: 'onBoarding4',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get Welcome {
    return Intl.message(
      'Welcome',
      name: 'Welcome',
      desc: '',
      args: [],
    );
  }

  /// `SignIn to continue`
  String get SignInToContinue {
    return Intl.message(
      'SignIn to continue',
      name: 'SignInToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get EnterYourEmail {
    return Intl.message(
      'Enter Your Email',
      name: 'EnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get EnterYourPassword {
    return Intl.message(
      'Enter Your Password',
      name: 'EnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Name`
  String get EnterYourName {
    return Intl.message(
      'Enter Your Name',
      name: 'EnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Phone`
  String get EnterYourPhone {
    return Intl.message(
      'Enter Your Phone',
      name: 'EnterYourPhone',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get ForgetPassword {
    return Intl.message(
      'Forget Password ?',
      name: 'ForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get LOGIN {
    return Intl.message(
      'LOGIN',
      name: 'LOGIN',
      desc: '',
      args: [],
    );
  }

  /// `Don\'t have an account ?`
  String get DontHaveAnAccount {
    return Intl.message(
      'Don\\\'t have an account ?',
      name: 'DontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get SignUp {
    return Intl.message(
      'SignUp',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Email`
  String get PleaseEnterYourEmail {
    return Intl.message(
      'Please Enter Your Email',
      name: 'PleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Password`
  String get PleaseEnterYourPassword {
    return Intl.message(
      'Please Enter Your Password',
      name: 'PleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Name`
  String get PleaseEnterYourName {
    return Intl.message(
      'Please Enter Your Name',
      name: 'PleaseEnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Phone`
  String get PleaseEnterYourPhone {
    return Intl.message(
      'Please Enter Your Phone',
      name: 'PleaseEnterYourPhone',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
