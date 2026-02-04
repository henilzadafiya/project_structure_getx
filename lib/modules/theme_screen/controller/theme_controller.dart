import 'package:get/get.dart';
import 'package:project_structure/utils/app_preferences.dart';
import 'package:project_structure/utils/enums.dart';

class ThemeScreenController extends GetxController {
  RxBool isFromSettingScreen = false.obs;

  RxString selectedTheme = UsedTheme.darkTheme.name.obs;

  @override
  void onInit() {
    isFromSettingScreen.value = Get.arguments ?? false;
    selectedTheme.value = AppPreference.getUsedThemeName();

    super.onInit();
  }
}
