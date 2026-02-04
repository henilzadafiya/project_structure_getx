import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/extensions.dart';

class SvgIconView extends StatelessWidget {
  final String icon;
  final double? size;
  final Color? color;
  final bool useColor;
  final List<Color>? gradientColors;
  final Function()? onTap;

  const SvgIconView({
    super.key,
    required this.icon,
    this.size,
    this.color,
    this.onTap,
    this.useColor = true,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        icon,
        height: size ?? 26.h,
        width: size ?? 26.h,
        color: (useColor) ? (color ?? AppColors.textPrimaryColor) : null,
      ).wrapWithGradientColor(colors: gradientColors),
    );
  }
}
