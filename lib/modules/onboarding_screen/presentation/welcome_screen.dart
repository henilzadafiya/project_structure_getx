import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_structure/generated/l10n.dart';
import 'package:project_structure/modules/onboarding_screen/controller/welcome_screen_controller.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/navigation_utils/navigation.dart';
import 'package:project_structure/utils/navigation_utils/routes.dart';
import 'package:project_structure/widget/common_text.dart';
import 'package:project_structure/widget/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final WelcomeScreenController _welcomeScreenController = Get.put(WelcomeScreenController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Flexible(
                child: CustomButton(
                  buttonColor: AppColors.buttonTitleColor,
                  buttonBorderColor: AppColors.disableColor,
                  onTap: () {
                    Navigation.pushNamed(Routes.signIn);
                  },
                  text: S.of(context).login,
                ),
              ),
              10.w.horizontalSpace,
              Flexible(
                child: CustomButton(
                  text: S.of(context).registerNow,
                  buttonColor: AppColors.buttonTitleColor,
                  textColor: AppColors.textPrimaryColor,
                  buttonBorderColor: AppColors.disableColor,
                  onTap: () {
                    Navigation.pushNamed(Routes.signUp);
                  },
                ),
              ),
            ],
          ),
          GestureDetector(onTap: () {
            Navigation.replace(Routes.dashBoardScreen);
            
          },child: CommonText(string: "Skip")),
        ],
      ).paddingSymmetric(horizontal: 16.w),
    );
  }
}
