import 'package:get/get.dart';

import 'enUS.dart';
import 'hiIN.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'hi_IN': hiIN,
      };
}
