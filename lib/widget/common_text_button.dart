import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/widget/common_icon_view.dart';
import 'package:project_structure/widget/common_text.dart';

class CommonTextButton extends StatelessWidget {
  final String text;
  final String leadingIcon;
  final VoidCallback? onTap;
  final Color? textColor;
  final Color? iconColor;
  final double? iconSize;
  final double? textSize;
  final FontWeight? fontWeight;
  final double? paddingBetween;
  final TextDecoration? textDecoration;

  const CommonTextButton({
    super.key,
    required this.text,
    required this.leadingIcon,
    this.onTap,
    this.textColor,
    this.iconColor,
    this.iconSize,
    this.textSize,
    this.fontWeight,
    this.paddingBetween,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.transparentColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leadingIcon.isNotEmpty)
              SvgIconView(
                icon: leadingIcon,
                color: iconColor ?? AppColors.primaryColor,
                size: iconSize ?? 16.h,
              ),
            SizedBox(width: paddingBetween ?? 6.w),
            CommonText(
              string: text,
              fontSize: textSize ?? 14.sp,
              fontWeight: fontWeight ?? FontWeight.w600,
              decorationColor: textColor ?? AppColors.primaryColor,
              textDecoration: textDecoration ?? TextDecoration.underline,
              color: AppColors.transparentColor,
            ),
          ],
        ),
      ),
    );
  }
}
