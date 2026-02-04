import 'package:flutter/material.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/widget/appbar.dart';
import 'package:project_structure/widget/common_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: "Profile App Bar",
        color: AppColors.appbarBgColor,
        titleColor: AppColors.textPrimaryColor,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: CommonText(
          string: "Profile",
          color: AppColors.textPrimaryColor,
        ),
      ),
    );
  }
}
