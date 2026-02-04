import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/constants.dart';
import 'package:project_structure/utils/utils.dart';
import 'package:project_structure/widget/common_text.dart';
import 'package:project_structure/widget/custom_loading_widget.dart';

class CustomButton extends StatefulWidget {
  final double? height;
  final VoidCallback? onTap;
  final double? width;
  final double? fontSize;
  final double? size;
  final double? endSvgSize;
  final double? borderWidth;
  final FontWeight? fontWeight;
  final String? text;
  final bool useIconColor;
  final String? svg;
  final String? endSvg;
  final Color? buttonColor;
  final Color? disableButtonColor;
  final Color? buttonBorderColor;
  final Color? loaderColor;
  final Color? textColor;
  final Color? disableTextColor;
  final bool needBorderColor;
  final bool isDisabled;
  final bool isLoader;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final CrossAxisAlignment? crossAxisAlignment;

  const CustomButton({
    super.key,
    this.height,
    this.width,
    this.text,
    this.svg,
    this.endSvg,
    this.useIconColor = true,
    this.buttonBorderColor,
    this.loaderColor,
    this.buttonColor,
    this.fontWeight,
    this.fontSize,
    this.borderWidth,
    this.endSvgSize,
    this.textColor,
    this.size,
    this.onTap,
    this.padding,
    this.isDisabled = false,
    this.isLoader = false,
    this.disableButtonColor,
    this.disableTextColor,
    this.margin,
    this.needBorderColor = true,
    this.crossAxisAlignment = CrossAxisAlignment.end,
    this.borderRadius,
  });

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final buttonButton = (widget.isDisabled) ? widget.disableButtonColor ?? AppColors.whiteColor : widget.buttonColor ?? AppColors.primaryColor;
    return GestureDetector(
      onTap: (widget.isLoader || widget.isDisabled)
          ? null
          : () {
        Utils.onHapticFeedbackImpact();
        widget.onTap?.call();
      },
      child: AnimatedContainer(
        duration: Constants.kAnimationDuration200,
        height: widget.height,
        width: widget.width,
        padding: widget.padding ?? EdgeInsets.symmetric(vertical: 12.h),
        margin: widget.margin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(13.r),
          color: buttonButton,
          border: Border.all(
            color: widget.buttonBorderColor ?? buttonButton,
            width: widget.borderWidth ?? 1.w,
          ),
        ),
        child: Center(
          child: widget.isLoader
              ? CustomLoadingWidget(
            color: widget.loaderColor ?? ((buttonButton == AppColors.whiteColor || buttonButton == Colors.white) ? Colors.black : Colors.white),
            size: widget.size ?? 26.h,
          )
              : Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: widget.crossAxisAlignment ?? CrossAxisAlignment.end,
            children: [
              if (widget.svg != null)
                Row(
                  children: [
                    SvgPicture.asset(
                      widget.svg!,
                      color: widget.useIconColor
                          ? ((widget.isDisabled)
                          ? widget.disableTextColor ?? AppColors.textSecondaryColor
                          : widget.textColor ?? AppColors.textPrimaryColor)
                          : null,
                      height: 24.h,
                      width: 24.h,
                    ),
                    8.horizontalSpace,
                  ],
                ),
              CommonText(
                string: widget.text ?? "",
                fontSize: widget.fontSize ?? 16.sp,
                fontWeight: widget.fontWeight ?? FontWeight.w700,
                color: (widget.isDisabled)
                    ? widget.disableTextColor ?? AppColors.textSecondaryColor
                    : widget.textColor ?? AppColors.textPrimaryColor,
              ),
              if (widget.endSvg != null)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    8.horizontalSpace,
                    SvgPicture.asset(
                      widget.endSvg!,
                      color: widget.useIconColor
                          ? ((widget.isDisabled)
                          ? widget.disableTextColor ?? AppColors.textSecondaryColor
                          : widget.textColor ?? AppColors.textPrimaryColor)
                          : null,
                      height: widget.endSvgSize ?? 24.h,
                      width: widget.endSvgSize ?? 24.h,
                    ).paddingSymmetric(vertical: 2.h),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
