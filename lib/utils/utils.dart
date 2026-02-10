import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:project_structure/utils/constants.dart';
import 'package:project_structure/utils/enums.dart';
import 'package:project_structure/widget/common_text_button.dart';
import 'package:project_structure/widget/empty_widget.dart';
import 'package:project_structure/widget/pagination_bottom_loading_widget.dart';

class Utils {
  static void hideKeyboardInApp(BuildContext context) {
    var currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  static bool isVideo(String path) {
    final videoExtensions = ['.mp4', '.mov', '.wmv', '.avi', '.flv', '.mkv', '.webm'];
    return videoExtensions.any((ext) => path.toLowerCase().endsWith(ext));
  }

  static void onHapticFeedbackImpact() {
    if (Platform.isIOS) {
      HapticFeedback.lightImpact();
    } else {
      HapticFeedback.vibrate();
    }
  }
  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length < 10) {
      return phoneNumber;
    }

    String start = phoneNumber.substring(0, 2); // First 2 digits
    String end = phoneNumber.substring(phoneNumber.length - 2); // Last 2 digits

    String formatted = '$start${'*' * (phoneNumber.length - 4)}$end';

    return formatted;
  }

  static ImagePathType getImageType(String? url) {
    if (isVideo(url ?? "")) {
      if ((url?.startsWith("https") ?? false) || (url?.startsWith("http") ?? false)) {
        return ImagePathType.isNetworkVideo;
      } else {
        return ImagePathType.isFileVideo;
      }
    } else if ((url?.startsWith("https") ?? false) || (url?.startsWith("http") ?? false)) {
      return ImagePathType.isNetwork;
    } else if ((url?.startsWith("assets") ?? false) && (url?.endsWith("svg") ?? false)) {
      return ImagePathType.isSvg;
    } else if (url?.startsWith("assets") ?? false) {
      return ImagePathType.isAssets;
    } else if (File(url ?? '').existsSync()) {
      return ImagePathType.isFile;
    } else {
      return ImagePathType.none;
    }
  }

  static Widget loadingAndDataView({
    required bool isLoading,
    Widget? loadingView,
    required bool showEmptyView1,
    Widget? emptyView,
    required Widget dataView,
    AlignmentGeometry alignment = Alignment.topCenter,
    Duration? duration,
    String? emptyViewTitle,
    String? emptyViewSubTitle,
    double? topPadding,
    double? leftPadding,
    double? rightPadding,
    double? iconSize,
    String? icon,
    Color? emptyTitleColor,
    bool? showBottomButton,
    String? bottomButtonTitle,
    String? bottomButtonIcon,
    Function()? onTapBottomIcon,
    MainAxisAlignment? emptyViewMainAxisAlignment,
  }) {
    return AnimatedSwitcher(
      duration: duration ?? Constants.kAnimationDuration200,
      transitionBuilder: (child, animation) {
        return Align(
          alignment: alignment,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: isLoading
          ? SizedBox(
        key: const ValueKey("isLoading"),
        child: loadingView ??
            const PaginationBottomLoadingWidget(
              showLoader: true,
            ),
      )
          : showEmptyView1
          ? SizedBox(
        key: const ValueKey("showEmptyView"),
        child: Column(
          mainAxisAlignment: emptyViewMainAxisAlignment ?? MainAxisAlignment.center,
          children: [
            (emptyView ??
                EmptyDataWidget(
                  topPadding: topPadding,
                  rightPadding: rightPadding,
                  leftPadding: leftPadding,
                  icon: icon,
                  iconSize: iconSize,
                  titleColor: emptyTitleColor,
                  title: emptyViewTitle ?? 'No Data Found',
                  subTitle: emptyViewSubTitle,
                )),
            if (showBottomButton ?? false)
              CommonTextButton(
                text: bottomButtonTitle ?? "",
                leadingIcon: bottomButtonIcon ?? "",
                onTap: onTapBottomIcon,
              ).paddingOnly(top: 5.h),
          ],
        ),
      )
          : SizedBox(
        key: const ValueKey("dataView"),
        child: dataView,
      ),
    );
  }
}
