import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController controller = PageController();
  RxInt index = 0.obs;
}
