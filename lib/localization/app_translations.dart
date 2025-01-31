import 'package:get/get.dart';
import 'package:shoe_size/localization/de_translations.dart';
import 'package:shoe_size/localization/es_translations.dart';
import 'package:shoe_size/localization/hi_translations.dart';
import 'package:shoe_size/localization/ja_translations.dart';
import 'package:shoe_size/localization/pt_translations.dart';
import 'package:shoe_size/localization/ru_translations.dart';
import 'package:shoe_size/localization/zh_translations.dart';
import 'en_translations.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': enTranslations,
    'zh': zhTranslations,
    'ja': jaTranslations,
    'hi': hiTranslations,
    'ru': ruTranslations,
    'de': deTranslations,
    'es': esTranslations,
    'pt': ptTranslations,
  };
}
