import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/modules/home/view/home_screen.dart';
import 'package:project_structure/modules/profile/view/profile_screen.dart';
import 'package:project_structure/utils/utils.dart';

class DashBoardController extends GetxController with GetTickerProviderStateMixin {
  static DashBoardController get to => Get.find();
  RxInt selectedTabIndex = RxInt(0);

  late TabController tabController;

  List<Widget> tabsList = <Widget>[
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);

    super.onInit();
  }

  void onTabChange(int value) {
    if (value != selectedTabIndex.value) {
      Utils.onHapticFeedbackImpact();
      Utils.hideKeyboardInApp(Get.context!);
    }
    selectedTabIndex(value);
    tabController.animateTo(
      value,
      curve: Curves.decelerate,
      duration: const Duration(
        milliseconds: 200,
      ),
    );
  }
}
