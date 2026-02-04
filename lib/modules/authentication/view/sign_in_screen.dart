import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_structure/generated/l10n.dart';
import 'package:project_structure/modules/authentication/controller/sign_in_controller.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/navigation_utils/navigation.dart';
import 'package:project_structure/utils/navigation_utils/routes.dart';
import 'package:project_structure/utils/utils.dart';
import 'package:project_structure/utils/validation_utils.dart';
import 'package:project_structure/widget/common_text.dart';
import 'package:project_structure/widget/custom_button.dart';
import 'package:project_structure/widget/custom_textfeild.dart';
import 'package:project_structure/widget/phone_textField.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController _signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Obx(
                              () => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                20.h.verticalSpace,
                                CommonText(
                                  string: S.of(context).login.toUpperCase(),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 30.sp,
                                  color: AppColors.textDefaultColor,
                                ),
                                10.h.verticalSpace,
                                RichText(
                                  text: TextSpan(
                                    text: S.of(context).enterTheBelowDetails,
                                    style: TextStyle(fontSize: 15.sp, fontStyle: FontStyle.italic, letterSpacing: 0, color: AppColors.primaryColor,),
                                    children: [
                                      TextSpan(
                                        text: S.of(context).login,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.sp,
                                            color: AppColors.primaryColor,
                                            fontStyle: FontStyle.italic,
                                            letterSpacing: 0),
                                      ),
                                      TextSpan(
                                          text: " ${S.of(context).profile}",
                                          style: TextStyle(fontSize: 15.sp, fontStyle: FontStyle.italic, letterSpacing: 0)),
                                    ],
                                  ),
                                ),
                                30.h.verticalSpace,
                                CustomPhoneTextField(
                                  controller: _signInController.phoneNumberController,
                                  selectedCountry: _signInController.selectedCountryCode.value,
                                  onSelect: _signInController.selectedCountryCode.call,
                                  onChanged: (String? data) {
                                    _signInController.phoneNumberError.value = Validator.isValidMobile(
                                      value: data,
                                      // maxLength: _signInController.selectedCountryCode.value.maxLength,
                                      // minLength: _signInController.selectedCountryCode.value.minLength,
                                    );
                                    _signInController.handleButtonDisable();
                                  },
                                  errorMessage: _signInController.phoneNumberError.value,
                                ),
                                15.h.verticalSpace,
                                CustomTextField(
                                  controller: _signInController.passwordController,
                                  hintText: S.of(context).enterPassword,
                                  labelText: S.of(context).password,
                                  isPassword: true,
                                  errorMessage: _signInController.passwordError.value,
                                  onChanged: (String value) {
                                    _signInController.passwordError.value = Validator.passwordValidator(value: value, context: context);
                                    _signInController.handleButtonDisable();
                                  },
                                ),
                                _forgetPasswordWidget(),
                                // Obx(
                                //       () => (_signInController.loginApiResponse.value.status != 200 ||
                                //       _signInController.loginApiResponse.value.status != 201) &&
                                //       _signInController.loginApiResponse.value.errors != null
                                //       ? Padding(
                                //     padding: EdgeInsets.only(top: 8.h),
                                //     child: ErrorTextWidget(
                                //       errorMessage: _signInController.loginApiResponse.value.errors,
                                //     ),
                                //   )
                                //       : const SizedBox(),
                                // ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          20.h.verticalSpace,
                          Obx(
                                () => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: CustomButton(
                                isLoader: _signInController.isLoading.value,
                                text: S.of(context).login,
                                textColor: AppColors.buttonTitleColor,
                                buttonColor: _signInController.isDisable.value ? AppColors.textDisableColor : AppColors.primaryColor,
                                onTap: _signInController.isDisable.value
                                    ? null
                                    : () {
                                  onSubmit(context);
                                },
                              ),
                            ),
                          ),
                          20.h.verticalSpace,
                          Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                text: S.of(context).dontHaveAccount,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp,
                                  color: AppColors.textPrimaryColor
                                ),
                                children: [
                                  TextSpan(
                                    text: S.of(context).registerNowText,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15.sp,
                                        decoration: TextDecoration.underline,
                                        color: AppColors.textPrimaryColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigation.replace(Routes.signUp);
                                      },
                                  )
                                ],
                              ),
                            ),
                          ),
                          20.h.verticalSpace,
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void onSubmit(BuildContext context) async {
    Utils.hideKeyboardInApp(context);
    if (_signInController.phoneNumberError.isEmpty && _signInController.passwordError.isEmpty) {
      // await _signInController.signInApi();
      Navigation.replace(Routes.dashBoardScreen);

    }
  }

  Widget _forgetPasswordWidget() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Navigation.pushNamed(Routes.forgotPasswordScreen);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8.h),
          child: CommonText(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            string: S.of(context).forgotPassword,
          ),
        ),
      ),
    );
  }
}
