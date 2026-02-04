import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/widget/common_text.dart';

import 'custom_appbar_button.dart';

// double appBarHeight = 76.h;
double appBarHeight = 70.h;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? automaticallyImplyLeading;
  final bool? centerTitle;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double? appBarSize;
  final double? iconSize;
  final Widget? leading;
  final Color? color;
  final double? titleFontSize0;
  final double? leadingWidth;
  final double? titleSpacing;
  final Color? titleColor;
  final Widget? titleWidget;
  final FontWeight? titleFontWeight;
  final Function()? onBackArrowPressed0;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleFontSize0,
    this.titleColor,
    this.titleFontWeight,
    this.automaticallyImplyLeading,
    this.actions,
    this.centerTitle,
    this.appBarSize,
    this.iconSize,
    this.bottom,
    this.leading,
    this.leadingWidth,
    this.color,
    this.titleSpacing,
    this.onBackArrowPressed0,
    this.titleWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      leading: (automaticallyImplyLeading ?? true) && leading == null
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppbarBackButton(
                  onBackArrowPressed0: onBackArrowPressed0,
                ).paddingOnly(left: 16.w, top: 4.h)
              ],
            )
          : leading,
      toolbarHeight: (appBarSize ?? appBarHeight),
      forceMaterialTransparency: color == null,
      surfaceTintColor: AppColors.transparentColor,
      elevation: 0,
      titleSpacing: titleSpacing,
      backgroundColor: color ?? AppColors.appbarBgColor,
      leadingWidth: leadingWidth ?? 60.w,
      title: (title?.isNotEmpty ?? false)
          ? CommonText(
              string: title ?? "",
              color: titleColor ?? AppColors.whiteColor,
              fontWeight: titleFontWeight ?? FontWeight.w700,
              fontSize: titleFontSize0 ?? 22.sp,
            )
          : titleWidget,
      centerTitle: centerTitle ?? true,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight((appBarSize ?? appBarHeight) + (bottom?.preferredSize.height ?? 0));
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:project_structure/utils/app_colors.dart';
// import 'package:project_structure/utils/navigation_utils/navigation.dart';
// import 'package:project_structure/widget/common_text.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBar({
//     super.key,
//     required this.title,
//     this.automaticallyImplyLeading,
//     this.actions,
//     this.centerTitle,
//     this.appBarSize,
//     this.bottom,
//     this.leading,
//     this.color,
//   });
//   final String title;
//   final bool? automaticallyImplyLeading;
//   final bool? centerTitle;
//   final List<Widget>? actions;
//   final PreferredSizeWidget? bottom;
//   final double? appBarSize;
//   final Widget? leading;
//   final Color? color;
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       automaticallyImplyLeading: automaticallyImplyLeading ?? true,
//       leading: (automaticallyImplyLeading ?? true) && leading == null
//           ?
//           // GestureDetector(
//           //         onTap: () {
//           //           Navigation.pop();
//           //         },
//           //         child: Container(
//           //           width: 15.w,
//           //           child: Icon(
//           //             Icons.arrow_back_ios_rounded,
//           //             color: AppColors.blackColor,
//           //             size: 2.5.h,
//           //           ),
//           //         ),
//           //       )
//           IconButton(
//               onPressed: () {
//                 Navigation.pop();
//               },
//               icon: Icon(
//                 Icons.arrow_back_ios_rounded,
//                 color: Colors.black,
//                 size: 2.5.h,
//               ),
//             )
//           : leading,
//       elevation: 0,
//       backgroundColor: color,
//       title: CommonText(
//         string: title,
//         color: AppColors.textBlackColor,
//         fontWeight: FontWeight.w600,
//         fontSize: 12.sp,
//       ),
//       centerTitle: centerTitle ?? true,
//       actions: actions,
//       bottom: bottom,
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(appBarSize ?? 50);
// }
