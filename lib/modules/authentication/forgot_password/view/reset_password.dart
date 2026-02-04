import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_structure/generated/l10n.dart';
import 'package:project_structure/modules/authentication/forgot_password/controller/forgot_password_controller.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/validation_utils.dart';
import 'package:project_structure/widget/appbar.dart';
import 'package:project_structure/widget/common_text.dart';
import 'package:project_structure/widget/custom_button.dart';
import 'package:project_structure/widget/custom_textfeild.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final ForgotPasswordController _forgotPasswordController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        color: Colors.transparent,
        title: S.of(context).resend,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CommonText(
                  string: S.of(context).resetPassword.toUpperCase(),
                  fontWeight: FontWeight.w900,
                  fontSize: 30.sp,
                ),
                10.h.verticalSpace,
                CommonText(
                  string: S.of(context).enterNewPassword,
                  fontSize: 16.sp,
                  fontStyle: FontStyle.italic,
                  softWrap: true,
                ),
                30.h.verticalSpace,
                Obx(
                  () => CustomTextField(
                    controller: _forgotPasswordController.passwordController,
                    hintText: S.of(context).enterPassword,
                    labelText: S.of(context).password,
                    isPassword: true,
                    onChanged: (value) {
                      _forgotPasswordController.passwordError.value = Validator.passwordValidator(value: value, context: context);
                      _forgotPasswordController.handleResetButtonDisable();
                    },
                    errorMessage: _forgotPasswordController.passwordError.value,
                  ),
                ),
                15.h.verticalSpace,
                Obx(
                  () => CustomTextField(
                    controller: _forgotPasswordController.rePasswordController,
                    hintText: S.of(context).reEnterPassword,
                    labelText: S.of(context).confirmPassword,
                    isPassword: true,
                    onChanged: (value) {
                      _forgotPasswordController.cPasswordError.value =
                          Validator.isValidConfirmPassword(cPassword: value, password: _forgotPasswordController.passwordController.text);

                      _forgotPasswordController.handleResetButtonDisable();
                    },
                    errorMessage: _forgotPasswordController.cPasswordError.value,
                  ),
                ),
                const Spacer(),
                Obx(
                  () => CustomButton(
                    text: S.of(context).submit,
                    isLoader: _forgotPasswordController.isLoading.value,
                    textColor: AppColors.buttonTitleColor,
                    buttonColor: _forgotPasswordController.isResetDisable.value ? AppColors.textDisableColor : AppColors.primaryColor,
                    onTap: _forgotPasswordController.isResetDisable.value
                        ? null
                        : () async {
                            // await _forgotPasswordController.updatePasswordApi();
                          },
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }
}
