import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/widget/common_icon_view.dart';
import 'package:project_structure/widget/common_text.dart';
import 'package:project_structure/widget/custom_cache_network_image_view.dart';


class CommonSubtitleView extends StatelessWidget {
  final String title;
  final String userProfileImage;
  final Function()? onTap;
  final String? subTitle;
  final double? fontSize;
  final double? subTitleFontSize;
  final double? iconSize;
  final double? imageSize;
  final double? imageBorderRadius;
  final Color? titleColor;
  final String? icon;
  final Color? subTitleColor;
  final Color? iconColor;
  final FontWeight? fontWeight;
  final FontWeight? subTitleFontWeight;
  final TextOverflow? overflow;
  final int? maxLines;

  const CommonSubtitleView({
    super.key,
    required this.title,
    required this.userProfileImage,
    this.subTitle,
    this.fontWeight,
    this.titleColor,
    this.imageBorderRadius,
    this.subTitleColor,
    this.fontSize,
    this.overflow,
    this.imageSize,
    this.onTap,
    this.subTitleFontSize,
    this.subTitleFontWeight,
    this.iconSize,
    this.iconColor,
    this.icon,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(3.h),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(imageBorderRadius ?? 6.r)),
        child: Row(
          children: [
            CustomCacheNetworkImageView(
              imageUrl: userProfileImage,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(imageBorderRadius ?? 6.r),
              height: imageSize ?? 35.h,
              width: imageSize ?? 35.h,
            ),
            10.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonText(
                    string: title,
                    fontSize: fontSize ?? 16.sp,
                    fontWeight: fontWeight ?? FontWeight.w600,
                    color: titleColor ?? AppColors.textPrimaryColor,
                    overflow: overflow ?? TextOverflow.ellipsis,
                    maxLines: maxLines,
                  ),
                  if (subTitle != null) ...[
                    Row(
                      children: [
                        if (icon != null) ...[
                          SvgIconView(
                            icon: icon ?? '',
                            size: iconSize ?? 13.h,
                            color: iconColor ?? AppColors.primaryColor,
                          ),
                          5.horizontalSpace,
                        ],
                        Expanded(
                          child: CommonText(
                            string: subTitle ?? '',
                            color: subTitleColor ?? AppColors.primaryColor,
                            fontWeight: subTitleFontWeight ?? FontWeight.w600,
                            fontSize: subTitleFontSize ?? 13.sp,
                            overflow: overflow ?? TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            )
          ],
        ),
      ).paddingOnly(top: 4.h),
    );
  }
}
