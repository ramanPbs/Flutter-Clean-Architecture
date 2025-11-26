import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_clean_architecture/common/translations/AppLanguageUpdate.dart';

class GetXLocalStorage extends GetxController {
  GetStorage getStorage = GetStorage();

  final RxString _userLanguage = 'Language'.obs;

  String get userLanguage => _userLanguage.value;

  dynamic getPref(String key) async {
    return await getStorage.read(key);
  }

  Future<void> init() async {
    _userLanguage.value =
        getStorage.read(AppLanguageUpdate.language) ?? 'Language';
  }

  void setPref(String key, dynamic value) async {
    await getStorage.write(key, value);
  }

  void setUserLanguage(String value) {
    _userLanguage.value = value;
    setPref(AppLanguageUpdate.language, value);
  }
}
