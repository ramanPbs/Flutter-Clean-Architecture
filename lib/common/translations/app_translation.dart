import 'package:get/get.dart';
import 'package:getx_clean_architecture/common/translations/enSP.dart';

import 'enUS.dart';
import 'hiIN.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'hi_IN': hiIN,
        'es_SP': esSP,
      };
}
