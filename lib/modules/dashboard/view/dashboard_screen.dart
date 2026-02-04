import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_structure/generated/l10n.dart';
import 'package:project_structure/modules/dashboard/controller/dash_board_controller.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/assets.dart';
import 'package:project_structure/utils/constants.dart';
import 'package:project_structure/widget/annotated_region.dart';
import 'package:project_structure/widget/common_icon_view.dart';
import 'package:project_structure/widget/common_text.dart';
import 'package:project_structure/widget/custom_cache_network_image_view.dart';
import 'package:project_structure/widget/custom_round_button.dart';
import 'package:project_structure/widget/popups_and_dialogs/pop_up_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashBoardController _dashBoardController = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (_dashBoardController.selectedTabIndex.value != 0) {
          _dashBoardController.selectedTabIndex.value = 0;
          _dashBoardController.tabController
              .animateTo(_dashBoardController.selectedTabIndex.value, duration: Constants.kAnimationDuration200, curve: Curves.decelerate);
        } else {
          await commonPopUpView(
          context: context,
          title: S.of(context).exitApp,
          subTitle: S.of(context).exitDesc,
          onConfirm: () async {
            exit(0);
          },
          confirmButtonTitle: S.of(context).exitText,
          );
        }
      },
      child: CustomAnnotatedRegions(
        systemNavigationBarColor: AppColors.bottomColor,
        brightness: Brightness.dark,
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _dashBoardController.tabController,
            children: _dashBoardController.tabsList,
          ),
          bottomNavigationBar: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(top: 9.5.h),
                decoration: BoxDecoration(
                  color: AppColors.bottomColor,
                ),
                child: SafeArea(
                  top: false,
                  child: Row(
                    children: [
                      bottomNavigationBarElement(
                        title: S.of(context).home,
                        icon: IconAsset.home,
                        index: 0,
                        onTap: _dashBoardController.onTabChange,
                      ),
                      bottomNavigationBarElement(
                        title: S.of(context).profile,
                        icon: IconAsset.home,
                        index: 1,
                        iconView: CustomRoundButton(
                          childView: CustomCacheNetworkImageView(
                            imageUrl: kImageUrl,
                            shape: BoxShape.circle,
                            height: 24.h,
                            width: 24.h,
                          ),
                          iconPadding: EdgeInsets.zero,
                          iconSize: 24.h,
                          border: Border.all(
                            width: 1,
                            color: _dashBoardController.selectedTabIndex.value == 1
                                ? AppColors.primaryColor
                                : AppColors.textPrimaryColor.withValues(alpha: 0.80),
                          ),
                        ),
                        onTap: _dashBoardController.onTabChange,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavigationBarElement({
    required final String title,
    required final String icon,
    required final Function(int) onTap,
    required final int index,
    final Widget? iconView,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap.call(index);
        },
        child: Container(
          color: AppColors.bottomColor,
          child: Obx(
            () => Column(
              children: [
                AnimatedCrossFade(
                  crossFadeState: _dashBoardController.selectedTabIndex.value == index ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  duration: Constants.kAnimationDuration200,
                  firstChild: iconView ??
                      SvgIconView(
                        icon: icon,
                        size: 24.h,
                        color: AppColors.textPrimaryColor,
                      ),
                  secondChild: iconView ??
                      SvgIconView(
                        icon: icon,
                        size: 24.h,
                        color: AppColors.textPrimaryColor,
                      ),
                ),
                4.verticalSpace,
                CommonText(
                  string: title,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: _dashBoardController.selectedTabIndex.value == index ? AppColors.primaryColor : AppColors.textSecondaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
