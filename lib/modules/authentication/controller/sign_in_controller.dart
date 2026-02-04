import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/utils/country_code_utils/country_code_model.dart';
import 'package:project_structure/utils/country_code_utils/country_code_utils.dart';

class SignInController extends GetxController {
  RxBool isLoading = false.obs;
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FocusNode phoneTextFieldFocusNode = FocusNode();
  RxBool isDisable = true.obs;
  RxBool isEmail = true.obs;
  RxString phoneNumberError = "".obs;
  RxString passwordError = "".obs;
  Rx<CountryCodeModel> selectedCountryCode = Rx<CountryCodeModel>(CountryCodeUtils.getCountryCodeModelByCode("91"));



  void handleButtonDisable() {
    isDisable.value = (phoneNumberController.text == "" || phoneNumberController.text.isEmpty) ||
        (passwordController.text == "" || passwordController.text.isEmpty);
  }
}