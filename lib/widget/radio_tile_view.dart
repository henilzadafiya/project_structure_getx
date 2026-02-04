import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/widget/common_text.dart';
import 'package:project_structure/widget/custom_radio_button.dart';

class RadioTileView extends StatelessWidget {
  final String? title;
  final bool? isSelected;
  final Function()? onTap;

  const RadioTileView({
    super.key,
    this.title,
    this.onTap,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
        color: AppColors.cardBgColor2,
        child: Row(
          children: [
            CustomRadioButton(
              isSelected: isSelected ?? true,
            ),
            16.horizontalSpace,
            Expanded(
              child: CommonText(
                string: title ?? "",
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ).paddingSymmetric(vertical: 6.h),
            ),
          ],
        ),
      ),
    );
  }
}