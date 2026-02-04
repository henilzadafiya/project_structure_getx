import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/assets.dart';
import 'package:project_structure/widget/common_icon_view.dart';

class ErrorTextWidget extends StatelessWidget {
  final String? errorMessage;
  bool? isCenter;

  ErrorTextWidget({super.key, this.errorMessage, this.isCenter});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: (isCenter ?? false) ? MainAxisAlignment.center : MainAxisAlignment.start,
      crossAxisAlignment: (isCenter ?? false) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        SvgIconView(
          icon: IconAsset.errorIcon,
          size: 18.sp,
        ),
        5.w.horizontalSpace,
        Flexible(
          child: RichText(
            text: TextSpan(
              text: "$errorMessage ",
              style: TextStyle(
                color: AppColors.redColor,
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
              // children: [
              //   TextSpan(
              //     text: S.of(context).tryAgain,
              //     style: TextStyle(
              //       color: AppColors.redColor,
              //       decoration: TextDecoration.underline,
              //       fontWeight: FontWeight.w500,
              //       fontSize: 15.sp,
              //     ),
              //   ),
              // ],
            ),
          ),
        )
      ],
    );
  }
}
