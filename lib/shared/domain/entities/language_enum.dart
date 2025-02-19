import 'package:clean_architecture/core/translations/l10n.dart';
import 'package:clean_architecture/main.dart';

enum LanguageEnum {
  ar, // Arabic
  en, // English
}

extension LanguageEnumExtension on LanguageEnum {
  String get local {
    switch (this) {
      case LanguageEnum.ar:
        return "ar";

      case LanguageEnum.en:
        return "en";
    }
  }

  String get localHeader {
    switch (this) {
      case LanguageEnum.ar:
        return "ar_AE";

      case LanguageEnum.en:
        return "en_US";
    }
  }

  String get langName {
    switch (this) {
      case LanguageEnum.ar:
        return S.of(navigatorKey.currentContext!).arabic;

      case LanguageEnum.en:
        return S.of(navigatorKey.currentContext!).english;

      default:
        return S.of(navigatorKey.currentContext!).english;
    }
  }
}
