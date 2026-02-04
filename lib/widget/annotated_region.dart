import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_structure/utils/app_colors.dart';
import 'package:project_structure/utils/enums.dart';

class CustomAnnotatedRegions extends StatelessWidget {
  final Widget child;
  final bool isDarkTheme;
  final Color? systemNavigationBarColor;
  final Brightness? brightness;


  const CustomAnnotatedRegions({
    super.key,
    required this.child,
    this.isDarkTheme = true,
    this.systemNavigationBarColor,
    this.brightness,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: brightness ?? _statusBarColor(currentUsedTheme.value),
        statusBarBrightness: brightness ?? _statusBarColor(currentUsedTheme.value),
        systemNavigationBarIconBrightness: brightness ?? _statusBarColor(currentUsedTheme.value),
        systemNavigationBarColor: systemNavigationBarColor,
      ),
      child: child,
    );
  }

  Brightness _statusBarColor(String usedTheme) {
    late Brightness brightness;

    if (usedTheme == UsedTheme.darkTheme.name) {
      brightness = Platform.isIOS ? Brightness.dark : Brightness.light;
    } else {
      brightness = Platform.isIOS ? Brightness.light : Brightness.dark;
    }

    return brightness;
  }
}
