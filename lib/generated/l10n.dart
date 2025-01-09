import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

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

  /// `Added to Favorites`
  String get addedToFavorites {
    return Intl.message(
      'Added to Favorites',
      name: 'addedToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Removed from Favorites`
  String get removedFromFavorites {
    return Intl.message(
      'Removed from Favorites',
      name: 'removedFromFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Government`
  String get governments {
    return Intl.message(
      'Government',
      name: 'governments',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Places`
  String get places {
    return Intl.message(
      'Places',
      name: 'places',
      desc: '',
      args: [],
    );
  }

  /// `Suggested Places`
  String get suggestedPlaces {
    return Intl.message(
      'Suggested Places',
      name: 'suggestedPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Popular Places`
  String get popularPlaces {
    return Intl.message(
      'Popular Places',
      name: 'popularPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get Phone {
    return Intl.message(
      'Phone Number',
      name: 'Phone',
      desc: '',
      args: [],
    );
  }

  /// `Sign UP`
  String get SignUP {
    return Intl.message(
      'Sign UP',
      name: 'SignUP',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your full name`
  String get EnterName {
    return Intl.message(
      'Please enter your full name',
      name: 'EnterName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get EnterEmail {
    return Intl.message(
      'Please enter your email',
      name: 'EnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get EnterPassword {
    return Intl.message(
      'Please enter your password',
      name: 'EnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get EnterConfirmPassword {
    return Intl.message(
      'Please confirm your password',
      name: 'EnterConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `First character should be a letter`
  String get FirstCpital {
    return Intl.message(
      'First character should be a letter',
      name: 'FirstCpital',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get ValidEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'ValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password should be at least 6 characters long`
  String get ValidPassword {
    return Intl.message(
      'Password should be at least 6 characters long',
      name: 'ValidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get PasswordsMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'PasswordsMatch',
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