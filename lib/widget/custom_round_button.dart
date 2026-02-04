import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/assets.dart';
import 'package:project_structure/widget/common_icon_view.dart';

class CustomRoundButton extends StatelessWidget {
  final bool usePrimaryColor;
  final bool isPrimeUser;
  final String? icon;
  final Function()? onTap;
  final Function()? onLongPress;
  final Color? backgroundColor;
  final Color? iconColor;
  final EdgeInsetsGeometry? iconPadding;
  final double? iconSize;
  final double? borderRadius;
  final BoxBorder? border;
  final Widget? childView;

  const CustomRoundButton({
    super.key,
    this.usePrimaryColor = false,
    this.isPrimeUser = false,
    this.icon,
    this.onTap,
    this.onLongPress,
    this.iconPadding,
    this.backgroundColor,
    this.iconColor,
    this.iconSize,
    this.border,
    this.borderRadius,
    this.childView,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: isPrimeUser
          ? Container(
              alignment: Alignment.center,
              // color: Colors.red,
              width: 70,
              height: 50,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundColor ?? AppColors.backgroundColor,
                      shape: BoxShape.circle,
                      border: border,
                    ),
                    padding: iconPadding ?? EdgeInsets.all(6.h),
                    child: childView ??
                        SvgIconView(
                          icon: icon ?? IconAsset.arrowBackward,
                          size: iconSize ?? 24.h,
                          color: iconColor,
                        ),
                  ),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                // color: backgroundColor ?? AppColors.cardBgColor1,
                color: backgroundColor ?? AppColors.transparentColor,
                shape: BoxShape.circle,
                border: border,
              ),
              padding: iconPadding ?? EdgeInsets.all(6.h),
              child: childView ??
                  SvgIconView(
                    icon: icon ?? IconAsset.arrowBackward,
                    size: iconSize ?? 24.h,
                    color: iconColor,
                  ),
            ),
    );
  }
}
