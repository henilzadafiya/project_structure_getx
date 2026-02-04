import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_structure/generated/l10n.dart';
import 'package:project_structure/modules/theme_screen/controller/theme_controller.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/enums.dart';
import 'package:project_structure/widget/appbar.dart';
import 'package:project_structure/widget/custom_divider.dart';
import 'package:project_structure/widget/radio_tile_view.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  final ThemeScreenController _themeScreenController = Get.put(ThemeScreenController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        color: AppColors.appbarBgColor,
        title: S.of(context).themes,
        titleColor: AppColors.textPrimaryColor,
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.dividerColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioTileView(
                title: S.of(context).light,
                isSelected: _themeScreenController.selectedTheme.value == UsedTheme.lightTheme.name,
                onTap: () async {
                  _themeScreenController.selectedTheme.value = UsedTheme.lightTheme.name;
                  await AppColors.changeThemeColor(usedTheme: UsedTheme.lightTheme.name);
                },
              ),
              CustomDivider().paddingSymmetric(horizontal: 16.w),
              RadioTileView(
                title: S.of(context).dark,
                isSelected: _themeScreenController.selectedTheme.value == UsedTheme.darkTheme.name,
                onTap: () async {
                  _themeScreenController.selectedTheme.value = UsedTheme.darkTheme.name;
                  await AppColors.changeThemeColor(usedTheme: UsedTheme.darkTheme.name);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
