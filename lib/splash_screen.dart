import 'package:flutter/material.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/app_preferences.dart';
import 'package:project_structure/utils/navigation_utils/routes.dart';

import 'utils/navigation_utils/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      navigateFurther(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      key: ValueKey("Container"),
      width: double.maxFinite,
      child: Center(
        child: Text(
          'Splash screen ',
          style: TextStyle(color: AppColors.textPrimaryColor),
        ),
      ),
    );
  }

  Future<void> navigateFurther(BuildContext context) async {
    final bool? isShowOnboarding = AppPreference.getOnBoarding();
    if (isShowOnboarding ?? false) {
      Navigation.replace(Routes.welcomeScreen);
    } else {
      Navigation.replace(Routes.onboardingScreen);
    }
  }
}
