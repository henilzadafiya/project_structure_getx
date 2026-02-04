import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/api/exception/app_exception.dart';
import 'package:project_structure/generated/l10n.dart';

extension Validator on String {
  bool isValidEmail() {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (isEmpty) {
      showError("Please enter your email address");
      return false;
    } else if (!regex.hasMatch(this)) {
      showError("Email address is invalid");
      return false;
    }
    return true;
  }

  static String passwordValidator({String value = "", required BuildContext context}) {
    List<String> errors = [];

    if (value.length < 8) {
      errors.add(S.of(context).atLeast8Characters);
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      errors.add(S.of(context).oneUppercaseLetter);
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      errors.add(S.of(context).oneLowerCaseLetter);
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      errors.add(S.of(context).oneNumber);
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      errors.add(S.of(context).oneSpecialCharacter);
    }

    if (errors.isNotEmpty) {
      return '${S.of(context).passwordMustContain} ${errors.join(', ')}.';
    } else {
      return "";
    }
  }

  static String isValidConfirmPassword({String? cPassword, String? password}) {
    if (cPassword?.isEmpty ?? false) {
      return S.of(Get.context!).pleaseEnterCPassword;
    } else if (password != cPassword) {
      return S.of(Get.context!).passwordNotMatch;
    }
    return "";
  }

  static String isValidMobile({
    String? value,
  }) {
    int minLength = 7;
    int maxLength = 14;
    if (value?.isEmpty ?? false) {
      return S.of(Get.context!).enterYourMobile;
    } else if (!((value?.length ?? 0) > minLength && (value?.length ?? 0) <= maxLength)) {
      return S.of(Get.context!).invalidMobileNumber;
    }
    return "";
  }

}

void showError(String message) {
  AppException(errorCode: 0, message: message).show();
}
