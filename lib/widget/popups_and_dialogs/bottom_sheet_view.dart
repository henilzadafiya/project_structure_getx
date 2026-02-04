import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/assets.dart';
import 'package:project_structure/utils/constants.dart';
import 'package:project_structure/utils/navigation_utils/navigation.dart';
import 'package:project_structure/widget/annotated_region.dart';
import 'package:project_structure/widget/common_icon_view.dart';
import 'package:project_structure/widget/common_text.dart';
import 'package:project_structure/widget/custom_appbar_button.dart';

Future<dynamic> commonBottomSheet(
  BuildContext context, {
  required Widget child,
  double? height,
  Color? backgroundColor,
  String? title,
  String? fontFamily,
  double? fontSize,
  FontWeight? fontWeight,
  EdgeInsetsGeometry? padding,
  bool useBackIcon = false,
  bool isDismissible = true,
  bool showCloseIcon = true,
  bool useSafeArea = true,
}) async {
  return await showModalBottomSheet(
    isDismissible: isDismissible,
    isScrollControlled: true,
    showDragHandle: false,
    useSafeArea: true,
    backgroundColor: backgroundColor ?? AppColors.cardBgColor2,
    elevation: 0,
    context: context,
    builder: (context) {
      return CustomAnnotatedRegions(
        systemNavigationBarColor: backgroundColor ?? AppColors.backgroundColor,
        child: SafeArea(
          bottom: useSafeArea ? Platform.isIOS : false,
          top: false,
          child: SizedBox(
            height: height ?? MediaQuery.of(context).size.height * 0.80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 5.h,
                  width: 45.w,
                  margin: EdgeInsets.symmetric(vertical: 16.h),
                  decoration: BoxDecoration(
                    color: AppColors.disableColor,
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                ),
                if ((title?.isNotEmpty ?? false) && (!showCloseIcon))
                  Row(
                    children: [
                      if (useBackIcon)
                        SvgIconView(
                          icon: IconAsset.arrowBackward,
                          size: 16.h,
                          onTap: () => Navigation.pop(),
                        ),
                      Expanded(
                        child: Center(
                          child: CommonText(
                            string: title ?? "",
                            fontWeight: fontWeight ?? FontWeight.w500,
                            fontFamily: fontFamily,
                            fontSize: fontSize ?? 18.sp,
                          ),
                        ),
                      ),
                      if (useBackIcon)
                        SvgIconView(
                          icon: IconAsset.arrowBackward,
                          size: 16.h,
                          color: AppColors.transparentColor,
                        ),
                    ],
                  ).paddingOnly(bottom: 24.h, left: 8.w, right: 8.w),
                if (showCloseIcon)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CommonText(
                          string: title?.toUpperCase() ?? "",
                          fontWeight: FontWeight.w500,
                          fontSize: 26.sp,
                          fontFamily: Constants.interFont,
                          softWrap: true,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      AppBarActionButton(
                        icon: IconAsset.close_icon,
                        onTapIcon: () {
                          Navigation.pop();
                        },
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 16.w, vertical: 10.h),
                Expanded(child: child),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<dynamic> commonBottomSheetNew(
  BuildContext context, {
  required Widget child,
  double? height,
  Color? backgroundColor,
  String? title,
  EdgeInsetsGeometry? padding,
  bool useBackIcon = false,
  bool isDismissible = true,
  bool showCloseIcon = true,
  bool useSafeArea = true,
}) async {
  return await showModalBottomSheet(
    isDismissible: isDismissible,
    isScrollControlled: true,
    showDragHandle: false,
    useSafeArea: true,
    backgroundColor: backgroundColor ?? AppColors.cardBgColor2,
    elevation: 0,
    barrierColor: AppColors.blackColor.withValues(alpha: 0.8),
    context: context,
    builder: (context) {
      return CustomAnnotatedRegions(
        systemNavigationBarColor: backgroundColor ?? AppColors.cardBgColor2,
        child: SafeArea(
          bottom: useSafeArea ? Platform.isIOS : false,
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 5.h,
                width: 45.w,
                margin: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  color: AppColors.disableColor,
                  borderRadius: BorderRadius.circular(40.r),
                ),
              ),
              if ((title?.isNotEmpty ?? false) && (!showCloseIcon))
                Row(
                  children: [
                    if (useBackIcon)
                      SvgIconView(
                        icon: IconAsset.arrowBackward,
                        size: 16.h,
                        onTap: () => Navigation.pop(),
                      ),
                    Expanded(
                      child: Center(
                        child: CommonText(
                          string: title ?? "",
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    if (useBackIcon)
                      SvgIconView(
                        icon: IconAsset.arrowBackward,
                        size: 16.h,
                        color: AppColors.transparentColor,
                      ),
                  ],
                ).paddingOnly(bottom: 24.h, left: 8.w, right: 8.w),
              if (showCloseIcon)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      string: title?.toUpperCase() ?? "",
                      fontWeight: FontWeight.w500,
                      fontSize: 22.sp,
                      fontFamily: Constants.interFont,
                    ),
                    AppBarActionButton(
                      icon: IconAsset.close_icon,
                      onTapIcon: () {
                        Navigation.pop();
                      },
                    ),
                  ],
                ).paddingSymmetric(horizontal: 16.w, vertical: 10.h),
              child,
            ],
          ),
        ),
      );
    },
  );
}
