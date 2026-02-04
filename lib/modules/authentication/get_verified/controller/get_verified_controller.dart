import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/modules/authentication/get_verified/model/verify_otp_response.dart';
import 'package:project_structure/utils/navigation_utils/navigation.dart';
import 'package:project_structure/utils/navigation_utils/routes.dart';

class GetVerifiedController extends GetxController {
  TextEditingController otpTextController = TextEditingController();
  RxString otp = "".obs;
  RxString mobileNumber = "".obs;
  RxBool isSubmitOtp = false.obs;
  RxBool isResendCode = false.obs;
  RxBool isLoading = false.obs;
  Rx<OtpResponse> otpResponse = OtpResponse().obs;
  Timer? _timer;
  final ValueNotifier<int> start = ValueNotifier(60);

  @override
  void onInit() {
    var args = Get.arguments;
    if (args != null) {
      mobileNumber.value = args["mobileNumber"];
    }
    startTimer();
    super.onInit();
  }

  void startTimer() {
    start.value = 60;
    const oneSec = Duration(seconds: 1);
    if (_timer?.isActive ?? false) {
      return;
    }
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 1) {
          isResendCode.value = true;
          timer.cancel();
        } else {
          isResendCode.value = false;
          start.value--;
        }
      },
    );
  }

  Future<void> otpVerify() async {
    try {
      Navigation.replace(Routes.resetPasswordScreen);
    } catch (e) {
      log("otpVerify ----> $e");
    } finally {
      if (isLoading.value) isLoading.value = false;
    }
  }
}
