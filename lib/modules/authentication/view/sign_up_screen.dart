import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_structure/generated/l10n.dart';
import 'package:project_structure/modules/authentication/controller/sign_up_controller.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/navigation_utils/navigation.dart';
import 'package:project_structure/utils/navigation_utils/routes.dart';
import 'package:project_structure/utils/validation_utils.dart';
import 'package:project_structure/widget/common_text.dart';
import 'package:project_structure/widget/custom_button.dart';
import 'package:project_structure/widget/custom_textfeild.dart';
import 'package:project_structure/widget/pagination_bottom_loading_widget.dart';
import 'package:project_structure/widget/phone_textField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Obx(
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                20.h.verticalSpace,
                                CommonText(
                                  string: S.of(context).registration.toUpperCase(),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 30.sp,
                                  color: AppColors.textDefaultColor,
                                ),
                                10.h.verticalSpace,
                                CommonText(
                                  string: S.of(context).enterYourBelowDetails,
                                  fontSize: 16.sp,
                                  fontStyle: FontStyle.italic,
                                  softWrap: true,
                                ),
                                30.h.verticalSpace,
                                CustomTextField(
                                  controller: _signUpController.userNameTextController,
                                  hintText: S.of(context).enterUserName,
                                  labelText: S.of(context).userName,
                                  suffix: Obx(
                                    () => _signUpController.isCheckingUserName.value
                                        ? Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              PaginationBottomLoadingWidget(
                                                showLoader: true,
                                                loaderColor: AppColors.textDefaultColor,
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                  // onChanged: (String value) async {
                                  //   _signUpController.onUserNameTextChange(value);
                                  // },
                                  errorMessage: _signUpController.userNameError.value,
                                ),
                                15.h.verticalSpace,
                                CustomTextField(
                                  controller: _signUpController.fullNameController,
                                  hintText: S.of(context).enterFullName,
                                  labelText: S.of(context).fullName,
                                  // onChanged: (String value) {
                                  //   _signUpController.fullNameError.value = ValidatorUtils.isValidFullName(value: value);
                                  //   _signUpController.handleDisable();
                                  // },
                                  errorMessage: _signUpController.fullNameError.value,
                                ),
                                15.h.verticalSpace,
                                CustomPhoneTextField(
                                    controller: _signUpController.phoneNumberController,
                                    selectedCountry: _signUpController.selectedCountryCode.value,
                                    onSelect: _signUpController.selectedCountryCode.call,
                                    onChanged: (String? data) {
                                      _signUpController.mobileNumberError.value = Validator.isValidMobile(
                                        value: data,
                                      );
                                      _signUpController.handleDisable();
                                    },
                                    errorMessage: _signUpController.mobileNumberError.value),
                                15.h.verticalSpace,
                                CustomTextField(
                                  controller: _signUpController.passwordController,
                                  hintText: S.of(context).enterPassword,
                                  labelText: S.of(context).setPassword,
                                  isPassword: true,
                                  onChanged: (String value) {
                                    _signUpController.passwordError.value = Validator.passwordValidator(value: value, context: context);
                                    _signUpController.handleDisable();
                                  },
                                  errorMessage: _signUpController.passwordError.value,
                                ),
                                15.h.verticalSpace,
                                CustomTextField(
                                  controller: _signUpController.confirmPasswordController,
                                  hintText: S.of(context).reEnterPassword,
                                  labelText: S.of(context).confirmPassword,
                                  isPassword: true,
                                  onChanged: (String value) {
                                    _signUpController.cPasswordError.value =
                                        Validator.isValidConfirmPassword(cPassword: value, password: _signUpController.passwordController.text);
                                    _signUpController.handleDisable();
                                  },
                                  errorMessage: _signUpController.cPasswordError.value,
                                ),
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
                                text: S.of(context).submit,
                                isLoader: _signUpController.isLoading.value,
                                textColor: AppColors.buttonTitleColor,
                                buttonColor: _signUpController.isDisable.value ? AppColors.textDisableColor : AppColors.primaryColor,
                                onTap: _signUpController.isDisable.value
                                    ? null
                                    : () async {
                                  Navigation.replaceAll(Routes.signIn);
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
                                  fontSize: 16.sp,
                                  color: AppColors.textPrimaryColor
                                ),
                                children: [
                                  TextSpan(
                                    text: "${S.of(context).login}.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                        decoration: TextDecoration.underline,
                                        color: AppColors.textPrimaryColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigation.replace(Routes.signIn);
                                      },
                                  ),
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
        )));
  }
}
