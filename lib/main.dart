import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_structure/my_app.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/app_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FireBaseNotification().setUpLocalNotification();
  // FirebaseAnalyticsUtils().init();
  // FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;
  // runZonedGuarded<Future<void>>(() async {
    // await crashlytics.setCrashlyticsCollectionEnabled(true);
    // FlutterError.onError = crashlytics.recordFlutterError;
  await AppPreference.initMySharedPreferences();
  await AppColors.changeThemeColor(usedTheme: AppPreference.getUsedThemeName());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    runApp(const MyApp());

  // }, (error, stack) => print(error));
  // crashlytics.recordError(error, stack));
}
