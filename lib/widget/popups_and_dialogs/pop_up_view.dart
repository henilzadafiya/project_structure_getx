import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_structure/generated/l10n.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/widget/common_text.dart';
import 'package:project_structure/widget/custom_button.dart';
import 'package:project_structure/widget/custom_divider.dart';

Future<bool> commonPopUpView({
  required BuildContext context,
  required String title,
  required String subTitle,
  Function()? onConfirm,
  Function()? onCancel,
  String? confirmButtonTitle,
  String? cancelButtonTitle,
  RxBool? showLoader,
}) async {
  showLoader = showLoader ?? RxBool(false);
  return (await showDialog<bool>(
        context: context,
        barrierDismissible: true,
        barrierColor: AppColors.blackColor.withValues(alpha: 0.8),
        builder: (BuildContext context) => Dialog(
          backgroundColor: AppColors.cardBgColor2,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 60.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              20.verticalSpace,
              CommonText(
                string: title,
                softWrap: true,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: 16.w),
              10.verticalSpace,
              CommonText(
                string: subTitle,
                softWrap: true,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: AppColors.textSecondaryColor,
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: 16.w),
              20.verticalSpace,
              const CustomDivider(),
              Obx(
                () => CustomButton(
                  text: confirmButtonTitle,
                  buttonColor: AppColors.transparentColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  size: 22.h,
                  isLoader: showLoader?.value ?? false,
                  loaderColor: AppColors.redColor,
                  textColor: AppColors.redColor,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  onTap: () {
                    onConfirm?.call();
                    if (showLoader?.isFalse ?? true) {
                      Navigator.pop(context, true);
                    }
                  },
                ),
              ),
              const CustomDivider(),
              CustomButton(
                text: cancelButtonTitle ?? S.of(context).cancel,
                buttonColor: AppColors.transparentColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                textColor: AppColors.textPrimaryColor,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                onTap: () {
                  Navigator.pop(context, false);
                  onCancel?.call();
                },
              ),
            ],
          ),
        ),
      )) ??
      false;
}

Future<void> _showUpdateVersionDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.backgroundColor,
        title: CommonText(string: S.of(context).appUpdateTitle),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              CommonText(
                string: S.of(context).appUpdateSubTitle,
                softWrap: true,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          CommonText(string: S.of(context).update),
        ],
      );
    },
  );
}
