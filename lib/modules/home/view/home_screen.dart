import 'package:flutter/material.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/navigation_utils/navigation.dart';
import 'package:project_structure/utils/navigation_utils/routes.dart';
import 'package:project_structure/widget/appbar.dart';
import 'package:project_structure/widget/common_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: "Home App Bar",
        color: AppColors.appbarBgColor,
        titleColor: AppColors.textPrimaryColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigation.pushNamed(Routes.themeScreen, arg: true);
              },
              icon: Icon(
                Icons.dark_mode,
                color: AppColors.backArrowColor,
              ))
        ],
      ),
      body: Center(
        child: CommonText(
          string: "Home Screen",
          color: AppColors.textPrimaryColor,
        ),
      ),
    );
  }
}
