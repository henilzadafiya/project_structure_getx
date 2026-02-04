import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_structure/modules/authentication/get_verified/model/verify_otp_response.dart';
import 'package:project_structure/utils/country_code_utils/country_code_model.dart';
import 'package:project_structure/utils/country_code_utils/country_code_utils.dart';
import 'package:project_structure/utils/navigation_utils/navigation.dart';
import 'package:project_structure/utils/navigation_utils/routes.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController phoneNumberController = TextEditingController();
  Rx<CountryCodeModel> selectedCountryCode = Rx<CountryCodeModel>(CountryCodeUtils.getCountryCodeModelByCode("91"));
  RxBool isDisable = true.obs;
  RxBool isResetDisable = true.obs;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  RxString phoneNumberError = "".obs;
  RxString passwordError = "".obs;
  RxString cPasswordError = "".obs;
  Rx<OtpResponse> otpResponse = OtpResponse().obs;
  RxBool isLoading = false.obs;

  void handleButtonDisable() {
    isDisable.value = (phoneNumberController.text == "" || phoneNumberController.text.isEmpty || phoneNumberError.isNotEmpty);
  }

  void handleResetButtonDisable() {
    isResetDisable.value = ((passwordController.text == "" || passwordController.text.isEmpty) && rePasswordController.text == "" ||
        rePasswordController.text.isEmpty ||
        cPasswordError.isNotEmpty ||
        passwordError.isNotEmpty);
  }

  Future<void> sendForgotPasswordOtp() async {
    try {
      isLoading.value = true;
      final phoneNumber = "+${selectedCountryCode.value.dialCode}${phoneNumberController.text}";

      Navigation.pushNamed(Routes.getVerifiedScreen, arg: {
        "mobileNumber": phoneNumber,
      });
      isLoading.value = false;
    } catch (error) {
      isLoading.value = false;
      print("send forgot password OTP ${error}");
    }
  }
}
