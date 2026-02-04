import 'package:flutter/material.dart';
import 'package:project_structure/utils/app_colors.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;

  const CustomDivider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppColors.dividerColor.withValues(alpha: 0.3),
      height: 1,
      thickness: 1,
    );
  }
}

class CommonVerticalDivider extends StatelessWidget {
  final Color? color;
  final double? height;

  const CommonVerticalDivider({super.key, this.color, this.height});

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      color: color ?? AppColors.dividerColor.withValues(alpha: 0.3),
      width: height ?? 1,
      thickness: 1,
    );
  }
}
