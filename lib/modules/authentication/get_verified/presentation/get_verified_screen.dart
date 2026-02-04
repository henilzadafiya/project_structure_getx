import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_structure/generated/l10n.dart';
import 'package:project_structure/modules/authentication/get_verified/controller/get_verified_controller.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/utils.dart';
import 'package:project_structure/widget/appbar.dart';
import 'package:project_structure/widget/common_text.dart';
import 'package:project_structure/widget/custom_button.dart';
import 'package:project_structure/widget/custom_otp_text_field.dart';
import 'package:project_structure/widget/error_text_widget.dart';

class GetVerifiedScreen extends StatefulWidget {
  const GetVerifiedScreen({super.key});

  @override
  State<GetVerifiedScreen> createState() => _GetVerifiedScreenState();
}

class _GetVerifiedScreenState extends State<GetVerifiedScreen> {
  final GetVerifiedController _getVerifiedController = Get.put(GetVerifiedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        color: Colors.transparent,
      ),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CommonText(
                  string: S.of(context).getVerified.toUpperCase(),
                  fontWeight: FontWeight.w900,
                  fontSize: 30.sp,
                ),
                10.h.verticalSpace,
                CommonText(
                  string: S.of(context).weHaveSentCode,
                  fontSize: 16.sp,
                  fontStyle: FontStyle.italic,
                  softWrap: true,
                ),
                Obx(
                  () => CommonText(
                    string: "${Utils.formatPhoneNumber(_getVerifiedController.mobileNumber.value)}.",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    softWrap: true,
                    color: AppColors.primaryColor,
                  ),
                ),
                30.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 19.w, bottom: 8.h),
                  child: CommonText(
                    string: S.of(context).verificationCode,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CustomOtpTextField(
                  textEditingController: _getVerifiedController.otpTextController,
                  onChanged: (p0) {
                    _getVerifiedController.isSubmitOtp.value = false;

                  },
                  onCompleted: (p0) {
                    _getVerifiedController.otp.value = p0;
                    _getVerifiedController.isSubmitOtp.value = true;
                  },
                ),

                Obx(
                  () => (_getVerifiedController.otpResponse.value.status != 200 || _getVerifiedController.otpResponse.value.status != 201) &&
                          _getVerifiedController.otpResponse.value.errors != null
                      ? Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: ErrorTextWidget(
                            errorMessage: _getVerifiedController.otpResponse.value.errors,
                          ),
                        )
                      : const SizedBox(),
                ),
                const Spacer(),
                Obx(
                  () => CustomButton(
                    text: S.of(context).verifyMe,
                    isLoader: _getVerifiedController.isLoading.value,
                    textColor: AppColors.buttonTitleColor,
                    buttonColor: !_getVerifiedController.isSubmitOtp.value ? AppColors.textDisableColor : AppColors.primaryColor,
                    onTap: !_getVerifiedController.isSubmitOtp.value
                        ? null
                        : () async {
                            await _getVerifiedController.otpVerify();
                          },
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: _getVerifiedController.start,
                  builder: (context, int value, _) {
                    return Obx(
                      () => Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: RichText(
                            text: TextSpan(
                              text: S.of(context).requestNewCode,
                              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                              ),
                              children: [
                                TextSpan(
                                  text: _getVerifiedController.isResendCode.value ? S.of(context).resend : "${value}s",
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    decoration: TextDecoration.underline,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      if (_getVerifiedController.isResendCode.value) {
                                        // await _getVerifiedController.resendOtp();
                                      }
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),

    );
  }
}
