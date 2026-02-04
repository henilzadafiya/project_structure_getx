import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/utils/country_code_utils/country_code_model.dart';
import 'package:project_structure/utils/country_code_utils/country_code_utils.dart';

class SignUpController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isCheckingUserName = false.obs;
  final RxBool isDisable = true.obs;

  late final TextEditingController userNameTextController = TextEditingController();
  late final TextEditingController fullNameController = TextEditingController();
  late final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  RxString fullNameError = "".obs;
  RxString userNameError = "".obs;
  RxString mobileNumberError = "".obs;
  RxString passwordError = "".obs;
  RxString cPasswordError = "".obs;
  Rx<CountryCodeModel> selectedCountryCode = Rx<CountryCodeModel>(CountryCodeUtils.getCountryCodeModelByCode("91"));


  void handleDisable() {
    isDisable.value = (fullNameController.text == "" || fullNameController.text.isEmpty) ||
        (passwordController.text == "" || passwordController.text.isEmpty) ||
        (phoneNumberController.text == "" || phoneNumberController.text.isEmpty) ||
        (confirmPasswordController.text == "" || confirmPasswordController.text.isEmpty) ||
        (userNameTextController.text == "" || userNameTextController.text.isEmpty) ||
        cPasswordError.isNotEmpty ||
        passwordError.isNotEmpty ||
        userNameError.isNotEmpty ||
        mobileNumberError.isNotEmpty;
  }
}