import 'package:flutter/material.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CommonShimmerView extends StatelessWidget {
  final Widget child;
  final double? baseColorOpacity;
  final double? highlightColorOpacity;

  const CommonShimmerView({
    super.key,
    required this.child,
    this.baseColorOpacity,
    this.highlightColorOpacity,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.popupBgColor,
      highlightColor: AppColors.popupBgColor.withValues(alpha: 0.6),
      child: child,
    );
  }
}
