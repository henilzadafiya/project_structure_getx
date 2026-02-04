import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_structure/utils/constants.dart';
import 'package:project_structure/widget/custom_loading_widget.dart';

class PaginationBottomLoadingWidget extends StatelessWidget {
  final bool showLoader;
  final Color? loaderColor;
  final double? size;
  final EdgeInsetsGeometry? extraPadding;

  const PaginationBottomLoadingWidget({
    super.key,
    required this.showLoader,
    this.extraPadding,
    this.loaderColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Constants.kAnimationDuration200,
      child: AnimatedSwitcher(
        duration: Constants.kAnimationDuration400,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          );
        },
        child: showLoader
            ? Padding(
                padding: extraPadding ?? EdgeInsets.zero,
                child: CustomLoadingWidget(
                  key: ValueKey(showLoader),
                  size:size?? 30.h,
                  color: loaderColor,
                  padding: EdgeInsets.all(5.h),
                ),
              )
            : SizedBox(
                key: ValueKey(showLoader),
              ),
      ),
    );
  }
}
