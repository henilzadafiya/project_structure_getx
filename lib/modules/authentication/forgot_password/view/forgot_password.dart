import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_structure/generated/l10n.dart';
import 'package:project_structure/modules/authentication/forgot_password/controller/forgot_password_controller.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/navigation_utils/navigation.dart';
import 'package:project_structure/utils/navigation_utils/routes.dart';
import 'package:project_structure/utils/utils.dart';
import 'package:project_structure/utils/validation_utils.dart';
import 'package:project_structure/widget/appbar.dart';
import 'package:project_structure/widget/common_text.dart';
import 'package:project_structure/widget/custom_button.dart';
import 'package:project_structure/widget/error_text_widget.dart';
import 'package:project_structure/widget/phone_textField.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final ForgotPasswordController _forgotPasswordController = Get.put(ForgotPasswordController());
  @override
    void initState() {
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        color: Colors.transparent,
        title: S.of(context).forgotPassword,
      ),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CommonText(
                  string: S.of(context).forgotPasswordText.toUpperCase(),
                  fontWeight: FontWeight.w900,
                  fontSize: 30.sp,
                ),
                10.h.verticalSpace,
                CommonText(
                  string: S.of(context).worryNotText,
                  fontSize: 16.sp,
                  fontStyle: FontStyle.italic,
                  softWrap: true,
                ),
                30.h.verticalSpace,
                Obx(
                  () => CustomPhoneTextField(
                    controller: _forgotPasswordController.phoneNumberController,
                    selectedCountry: _forgotPasswordController.selectedCountryCode.value,
                    onSelect: _forgotPasswordController.selectedCountryCode.call,
                    onChanged: (String? data) {
                      _forgotPasswordController.phoneNumberError.value = Validator.isValidMobile(
                        value: data,
                        // maxLength: _forgotPasswordController.selectedCountryCode.value.maxLength,
                        // minLength: _forgotPasswordController.selectedCountryCode.value.minLength,
                      );
                      _forgotPasswordController.handleButtonDisable();
                    },
                    errorMessage: _forgotPasswordController.phoneNumberError.value,
                  ),
                ),
                Obx(
                  () => (_forgotPasswordController.otpResponse.value.status != 200 || _forgotPasswordController.otpResponse.value.status != 201) &&
                          _forgotPasswordController.otpResponse.value.errors != null
                      ? Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: ErrorTextWidget(
                            errorMessage: _forgotPasswordController.otpResponse.value.errors,
                          ),
                        )
                      : const SizedBox(),
                ),
                const Spacer(),
                Obx(
                  () => CustomButton(
                    text: S.of(context).submit,
                    isLoader: _forgotPasswordController.isLoading.value,
                    textColor: AppColors.buttonTitleColor,
                    buttonColor: _forgotPasswordController.isDisable.value ? AppColors.textDisableColor : AppColors.primaryColor,
                    onTap: _forgotPasswordController.isDisable.value
                        ? null
                        : () {
                            onSubmit(context);
                          },
                  ),
                ),
                20.h.verticalSpace,
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: S.of(context).iRememberMyPassword,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.textPrimaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: "${S.of(context).login}.",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            decoration: TextDecoration.underline,
                            color: AppColors.textPrimaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigation.pushNamed(Routes.signIn);
                            },
                        )
                      ],
                    ),
                  ),
                ),
                20.h.verticalSpace,
              ],
            ),
          ),
        ),

    );
  }

  void onSubmit(BuildContext context) async {
    Utils.hideKeyboardInApp(context);
    if (_forgotPasswordController.phoneNumberError.isEmpty) {
      await _forgotPasswordController.sendForgotPasswordOtp();
    }
  }
}
