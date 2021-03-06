import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unnecessary_brace_in_string_interps

//WARNING: This file is automatically generated. DO NOT EDIT, all your changes would be lost.

typedef LocaleChangeCallback = void Function(Locale locale);

class I18n implements WidgetsLocalizations {
  const I18n();
  static Locale _locale;
  static bool _shouldReload = false;

  static set locale(Locale newLocale) {
    _shouldReload = true;
    I18n._locale = newLocale;
  }

  static const GeneratedLocalizationsDelegate delegate = GeneratedLocalizationsDelegate();

  /// function to be invoked when changing the language
  static LocaleChangeCallback onLocaleChanged;

  static I18n of(BuildContext context) =>
    Localizations.of<I18n>(context, WidgetsLocalizations);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get appname => "Pehlitoon";
  String get searchbartxt => "Search for a series";
  String get home => "Home";
  String get discover => "Discover";
  String get coming => "Coming";
  String get account => "Account";
  String get recently => "Recently Read";
  String get ranking => "Ranking";
  String get daily => "Daily";
  String get more => "More";
  String get topTen => "Top 10";
  
  String get weekly => "Weekly";
  String get genres => "Genres";
  String get latest => "Latest";
  String get mon => "Mon";
  String get tue => "Tue";
  String get wen => "Wen";
  String get thu => "Thu";
  String get fri => "Fri";
  String get sat => "Sat";
  String get sun => "Sun";
  String get romance => "Romance";
  String get drama => "Drama";
  String get fantasy => "Fantasy";
  String get action => "Action";
  String get sliceOfLife => "Slice of Life";
}

class _I18n_en_US extends I18n {
  const _I18n_en_US();

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class _I18n_ur_PK extends I18n {
  const _I18n_ur_PK();

  String get appname => "Pehlitoon";
  String get searchbartxt => "Search for a series";
  String get home => "Home";
  String get discover => "Discover";
  String get coming => "Coming";
  String get account => "Account";
  String get recently => "Haal hi mein";
  String get ranking => "Darja bandi";
  String get daily => "Rozana";
  String get more => "Mazeed";
  String get topTen => "Top 10";
  
  String get weekly => "Haftawar";
  String get genres => "Anwaa";
  String get latest => "Taaza tareen";
  String get mon => "Pir";
  String get tue => "Mangal";
  String get wen => "Budh";
  String get thu => "Jumaraat";
  String get fri => "Jumma";
  String get sat => "Hafta";
  String get sun => "Itwaar";
  String get romance => "Romanvi";
  String get drama => "Drama";
  String get fantasy => "Tasawwur";
  String get action => "Action";
  String get sliceOfLife => "Zindagi ka tukda";
  
  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();
  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", "US"),
      Locale("ur", "PK"),
    ];
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      if (isSupported(locale)) {
        return locale;
      }
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    };
  }

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    I18n._locale = locale;
    //I18n._locale ??= locale;
    I18n._shouldReload = false;
    final String lang = I18n._locale != null ? I18n._locale.toString() : "";
    final String languageCode = I18n._locale != null ? I18n._locale.languageCode : "";
    if ("en_US" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }
    else if ("ur_PK" == lang) {
      print('ff');
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_ur_PK());
    }
    else if ("en" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }
    else if ("ur" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_ur_PK());
    }

    return SynchronousFuture<WidgetsLocalizations>(const I18n());
  }

  @override
  bool isSupported(Locale locale) {
    for (var i = 0; i < supportedLocales.length && locale != null; i++) {
      final l = supportedLocales[i];
      if (l.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => I18n._shouldReload;
}