import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/constants.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isSelected;
  final Color? color;
  final Color? disableColor;
  final double? borderWidth;
  final double? size;
  final double? selectedSize;

  const CustomRadioButton({super.key, required this.isSelected, this.color, this.borderWidth, this.size, this.selectedSize, this.disableColor});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: size ?? 22.h,
      width: size ?? 22.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? (color ?? AppColors.radioColor) : (disableColor ?? AppColors.textSecondaryColor.withValues(alpha: 0.30)),
          width: borderWidth ?? 1.5,
        ),
      ),
      duration: Constants.kAnimationDuration200,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: AnimatedSize(
          duration: Constants.kAnimationDuration200,
          alignment: Alignment.center,
          child: Container(
            height: isSelected ? (selectedSize ?? 13.75.h) : 0,
            width: isSelected ? (selectedSize ?? 13.75.h) : 0,
            decoration: BoxDecoration(
              color: color ?? AppColors.radioColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
