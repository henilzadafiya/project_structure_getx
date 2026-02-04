import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/assets.dart';
import 'package:project_structure/utils/navigation_utils/navigation.dart';
import 'package:project_structure/utils/utils.dart';
import 'package:project_structure/widget/common_icon_view.dart';

class AppbarBackButton extends StatelessWidget {
  final Function()? onBackArrowPressed0;

  const AppbarBackButton({super.key, this.onBackArrowPressed0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBackArrowPressed0 ??
          () {
            Utils.onHapticFeedbackImpact();
            Navigation.pop();
          },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.r), border: Border.all(width: 2.w, color: AppColors.borderColor)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.backgroundColor.withValues(alpha: 0.2),
                      blurRadius: 6.0,
                      spreadRadius: 0.1,
                      offset: const Offset(1.0, 0),
                    ),
                  ],
                ),
                height: 15.h,
                width: 15.h,
              ),
              SvgIconView(
                icon: IconAsset.arrowBackward,
                size: 20.h,
                color: AppColors.backArrowColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarActionButton extends StatelessWidget {
  final Function()? onTapIcon;
  final String? icon;
  final bool isProIconShow;
  final bool isShadowApply;
  final bool userColor;
  final double? iconSize;
  final Color? color;

  const AppBarActionButton(
      {super.key,
      this.onTapIcon,
      this.icon,
      this.isProIconShow = false,
      this.isShadowApply = true,
      this.iconSize,
      this.userColor = false,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.r),
              border: Border.all(width: 2.w, color: isProIconShow ? AppColors.primaryColor : AppColors.backgroundColor)),
          child: Padding(
            padding: EdgeInsets.all(10.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      // if (isShadowApply)
                      BoxShadow(
                        color: AppColors.whiteColor.withValues(alpha: 0.2),
                        blurRadius: 6.0,
                        spreadRadius: 0.1,
                        offset: const Offset(1.0, 0),
                      ),
                    ],
                  ),
                  height: 15.h,
                  width: 15.h,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
