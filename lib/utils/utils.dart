import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_structure/utils/enums.dart';

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
}
