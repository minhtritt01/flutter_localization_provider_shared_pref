import 'package:flutter/material.dart';
import 'helper.dart';

class AppLanguageProvider extends ChangeNotifier {
  Locale _appLocale = const Locale('en');
  String _locale = 'en';
  Locale get appLocal => Locale(_locale);
  String get locale => _locale;
  Future<void> fetchLocale() async {
    var languageCode = await Helper.getLanguage();
    _locale = languageCode;
    if (languageCode.isNotEmpty) {
      _appLocale = Locale(languageCode);
      return;
    }

    return;
  }

  Future<void> updateLanguage(String languageCode) async {
    if (_appLocale == Locale(languageCode)) {
      return;
    }
    if (Locale(languageCode) == _appLocale) {
      return;
    } else {
      _locale = languageCode;
      _appLocale = Locale(languageCode);
      await Helper.setLanguage(languageCode);
    }
    notifyListeners();
  }
}
