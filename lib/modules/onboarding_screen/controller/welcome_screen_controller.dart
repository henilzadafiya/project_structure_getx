import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/generated/l10n.dart';
import 'package:project_structure/utils/app_preferences.dart';
import 'package:project_structure/utils/navigation_utils/navigation.dart';
import 'package:project_structure/utils/navigation_utils/routes.dart';
import 'package:project_structure/widget/app_snack_bar.dart';

class WelcomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  // Rx<LoginApiResponse> loginApiResponse = LoginApiResponse().obs;
  // Future<void> googleSignInApi(BuildContext context) async {
  //   try {
  //     isLoading.value = true;
  //     LoginApiResponse ? tempLoginApiResponse = await SocialAuthService.signInWithGoogleService();
  //     if(tempLoginApiResponse!=null){
  //       loginApiResponse.value = tempLoginApiResponse;
  //     }
  //     if (loginApiResponse.value.status == 200) {
  //       AppPreference.setUserToken(loginApiResponse.value.data?.token ?? "");
  //       AppPreference.setUser(loginApiResponse.value.data?.user);
  //       Navigation.replaceAll(Routes.dashBoardScreen);
  //     }else{
  //       AppSnackBar.showErrorSnackBar(message: S.of(context).someThingWentWrong, title: AppSnackBarType.error);
  //     }
  //   } catch (e,st) {
  //     isLoading.value = false;
  //     log('st === $st');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
  //
  // Future<void> appleSignInApi(BuildContext context) async {
  //   try {
  //     isLoading.value = true;
  //     LoginApiResponse ? tempLoginApiResponse = await SocialAuthService.signInWithAppleService();
  //     if(tempLoginApiResponse!=null){
  //       loginApiResponse.value = tempLoginApiResponse;
  //     }
  //     if (loginApiResponse.value.status == 200) {
  //       AppPreference.setUserToken(loginApiResponse.value.data?.token ?? "");
  //       AppPreference.setUser(loginApiResponse.value.data?.user);
  //       Navigation.replaceAll(Routes.dashBoardScreen);
  //     }else{
  //       AppSnackBar.showErrorSnackBar(message: S.of(context).someThingWentWrong, title: AppSnackBarType.error);
  //     }
  //   } catch (e,st) {
  //     isLoading.value = false;
  //     log('st === $st');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
