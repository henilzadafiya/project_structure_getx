import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_structure/generated/l10n.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/assets.dart';
import 'package:project_structure/widget/common_icon_view.dart';
import 'package:project_structure/widget/common_text.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget(
      {super.key, required this.title, this.icon, this.iconSize, this.subTitle, this.topPadding, this.leftPadding, this.rightPadding,this.titleColor});

  final String title;
  final String? icon;
  final double? iconSize;
  final String? subTitle;
  final double? topPadding;
  final double? leftPadding;
  final double? rightPadding;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgIconView(
            icon: icon ?? IconAsset.search_icon,
            size: iconSize ?? 85.h,
            useColor: false,
            // color: AppColors.textPrimaryColor.withOpacity(0.80),
          ),
          10.verticalSpace,
          CommonText(
            string: title,
            fontSize: 16.sp,
            softWrap: true,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
            color: titleColor??AppColors.primaryColor,
          ).paddingSymmetric(horizontal: 40.w),
          3.verticalSpace,
          CommonText(
            string: subTitle ?? S.of(context).noDataDesc,
            fontSize: 12.sp,
            softWrap: true,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w400,
            color: AppColors.cardBgColor2,
          ).paddingSymmetric(horizontal: 40.w),
        ],
      ).paddingOnly(top: topPadding ?? 0, right: rightPadding ?? 16.w, left: leftPadding ?? 16.w),
    );
  }
}

class NoBackgroundImage extends StatelessWidget {
  const NoBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      color: AppColors.cardBgColor2,
      child: Center(
        child: SvgIconView(
          icon: ImagesAsset.no_image,
          size: 80.h,
          color: AppColors.textSecondaryColor.withOpacity(0.40),
        ),
      ),
    );
  }
}
