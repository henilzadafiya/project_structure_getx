import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_structure/generated/l10n.dart';
import 'package:project_structure/language_change_provider.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/app_string.dart';
import 'package:project_structure/utils/navigation_utils/routes.dart';
import 'package:project_structure/utils/utils.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageChangeProvider>(
      create: (context) => LanguageChangeProvider(),
      child: Builder(builder: (context) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child1) {
            return ValueListenableBuilder(
              valueListenable: currentUsedTheme,
              builder: (context, value, child) {
                log("ValueListenableBuilder :: ${value.toString()}");
                return GetMaterialApp(
                  key: Key(value),
                  debugShowCheckedModeBanner: false,
                  supportedLocales: S.delegate.supportedLocales,
                  locale: Provider.of<LanguageChangeProvider>(context).currentLocal,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  title: AppString.appName,
                  initialBinding: AppBidding(),
                  initialRoute: Routes.splash,
                  getPages: Routes.pages,
                  builder: (context, child2) {
                    return Scaffold(
                      body: GestureDetector(
                        onTap: () {
                          Utils.hideKeyboardInApp(context);
                        },
                        child: child2,
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      }),
    );
  }
}

class AppBidding extends Bindings {
  @override
  void dependencies() {}
}
