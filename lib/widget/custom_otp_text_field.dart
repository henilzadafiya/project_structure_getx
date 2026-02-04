import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/constants.dart';
import 'package:project_structure/widget/common_text.dart';

class CustomOtpTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String)? onCompleted;
  final Function(String)? onChanged;

  const CustomOtpTextField({
    super.key,
    required this.textEditingController,
    this.onCompleted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      animationDuration: Constants.kAnimationDuration200,
      controller: textEditingController,
      preFilledWidget: CommonText(
        string: '_',
        color: AppColors.textDisableColor,
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      ),
      defaultPinTheme: PinTheme(
        width: 54.w,
        height: 50.h,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textDefaultColor,
          fontFamily: Constants.interFont,
        ),
        decoration: BoxDecoration(
          color: AppColors.cardBgColor,
          border: Border.all(
            width: 1.5,
            color: AppColors.cardBgColor2,
          ),
          borderRadius: BorderRadius.circular(100.r),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 54.w,
        height: 50.h,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textDefaultColor,
          fontFamily: Constants.interFont,
        ),
        decoration: BoxDecoration(
          color: AppColors.cardBgColor2,
          border: Border.all(
            width: 1.5,
            color: AppColors.transparentColor,
          ),
          borderRadius: BorderRadius.circular(100.r),
        ),
      ),
      submittedPinTheme: PinTheme(
        width: 54.w,
        height: 50.h,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textDefaultColor,
          fontFamily: Constants.interFont,
        ),
        decoration: BoxDecoration(
          color: AppColors.cardBgColor2,
          border: Border.all(
            width: 1.5,
            color: AppColors.transparentColor,
          ),
          borderRadius: BorderRadius.circular(100.r),
        ),
      ),
      cursor: Container(
        color: AppColors.textDefaultColor,
        width: 1,
        height: 24.sp,
      ),
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: onCompleted,
      onChanged: onChanged,
    );
  }
}
