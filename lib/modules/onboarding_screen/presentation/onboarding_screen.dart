import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_structure/generated/l10n.dart';
import 'package:project_structure/modules/onboarding_screen/controller/onboarding_controller.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/app_preferences.dart';
import 'package:project_structure/utils/assets.dart';
import 'package:project_structure/utils/navigation_utils/navigation.dart';
import 'package:project_structure/utils/navigation_utils/routes.dart';
import 'package:project_structure/widget/common_icon_view.dart';
import 'package:project_structure/widget/common_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController _onboardingController = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _onboardingController.controller,
                children: [
                  _onBoardingViewWidget(
                    image: ImagesAsset.app_logo,
                    leadingText: S.of(context).onBoardingTitle,
                    descriptionText: S.of(context).onBoardingDescription,
                    leadingTextColor: AppColors.primaryColor,
                    trailingTextColor: AppColors.textPrimaryColor,
                  ),
                  _onBoardingViewWidget(
                    image: ImagesAsset.app_logo,
                    leadingText: S.of(context).onBoardingTitle,
                    descriptionText: S.of(context).onBoardingDescription,
                    leadingTextColor: AppColors.textPrimaryColor,
                    trailingTextColor: AppColors.primaryColor,
                  ),
                  _onBoardingViewWidget(
                    image: ImagesAsset.app_logo,
                    leadingText: S.of(context).onBoardingTitle,
                    descriptionText: S.of(context).onBoardingDescription,
                    leadingTextColor: AppColors.textPrimaryColor,
                    trailingTextColor: AppColors.primaryColor,
                  )
                ],
                onPageChanged: (int index) {
                  _onboardingController.index.value = index;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => _navigationWidget(
                        icon: IconAsset.arrowBackward,
                        isActive: _onboardingController.index.value == 0 ? false : true,
                        onTap: () {
                          _onboardingController.controller.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                        }),
                  ),
                  _navigationWidget(
                      icon: IconAsset.arrowForward,
                      isActive: true,
                      onTap: () async {
                        if (_onboardingController.index.value == 2) {
                          await AppPreference.setOnBoarding(true);
                          Navigation.replace(Routes.welcomeScreen);
                        } else {
                          _onboardingController.controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                        }
                      }),
                ],
              ),
            ),
            10.h.verticalSpace
          ],
        ),
      ),
    );
  }

  Widget _onBoardingViewWidget({
    required String image,
    required String leadingText,
    required Color leadingTextColor,
    required Color trailingTextColor,
    required String descriptionText,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image),
          46.h.verticalSpace,
          CommonText(
            string: leadingText,
            color: leadingTextColor,
            fontSize: 35.sp,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          ),
          10.h.verticalSpace,
          CommonText(
            string: descriptionText,
            color: AppColors.textPrimaryColor,
            softWrap: true,
            fontSize: 16.sp,
            fontStyle: FontStyle.italic,
          ),
        ],
      ),
    );
  }

  Widget _navigationWidget({
    required String icon,
    bool? isActive,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: (isActive ?? false) ? onTap : null,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: (isActive ?? false) ? AppColors.textPrimaryColor : AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(50),
          border: (isActive ?? false)
              ? null
              : Border.all(
                  color: AppColors.textPrimaryColor,
                ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: SvgIconView(
            color: (isActive ?? false) ? AppColors.backgroundColor : AppColors.textPrimaryColor,
            icon: icon,
          ),
        ),
      ),
    );
  }
}
