import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_structure/utils/api_constants.dart';

import 'constants.dart';

extension WidgetsExtension on Widget {


  Widget withExpanded({bool useExpanded = true}) {
    return useExpanded ? Expanded(child: this) : this;
  }

  Widget wrapWithGestureDetector({Function()? onTap}) {
    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: this,
      );
    }
    return this;
  }

  Widget wrapWithGradientColor({List<Color>? colors}) {
    return colors != null
        ? ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: colors,
              begin: Alignment.bottomLeft,
              end: Alignment.topLeft,
            ).createShader(
              bounds,
            ),
            child: this,
          )
        : this;
  }
}

extension StringExtension on String? {
  String withHttpsUrl() {
    if (this?.isNotEmpty ?? false) {
      return "${ApiConstants.Image_BASE_URL}${this ?? ""}";
    } else {
      return "";
    }
  }

  bool isStartWithHttpsUrl() {
    return (this?.startsWith("http") ?? false) || (this?.startsWith("https") ?? false);
  }

  bool isFutureDate() {
    String dateTimeString = this ?? "";
    if (dateTimeString.isNotEmpty) {
      return DateTime.parse(dateTimeString).isAfter(DateTime.now());
    } else {
      return true;
    }
  }

  DateTime? toDateTimeFromString({
    required String currentRowFormat,
  }) {
    String? dateString = this;
    if (dateString?.isNotEmpty ?? false) {
      DateFormat dateFormat = DateFormat(currentRowFormat);
      return dateFormat.parse(dateString ?? "");
    }

    return null;
  }

  String? toFormattedDateString({String format = Constants.dd_mm_yyyy}) {
    String dateTimeString = this ?? "";
    if (dateTimeString.isNotEmpty) {
      DateTime dateTime = DateTime.parse(dateTimeString);
      return DateFormat(format).format(dateTime.toLocal());
    } else {
      return this;
    }
  }

  DateTime? toDateTime() {
    String dateTimeString = this ?? "";
    if (dateTimeString.isNotEmpty) {
      return DateTime.parse(dateTimeString).toLocal();
    } else {
      return null;
    }
  }

  String withOutHttpsUrl() {
    if (this?.isNotEmpty ?? false) {
      return this?.replaceAll(ApiConstants.Image_BASE_URL, '') ?? '';
    } else {
      return "";
    }
  }
}

extension DateTimeExtension on DateTime? {
  String? toFormattedDateString({String format = Constants.dd_mm_yyyy}) {
    DateTime? dateTime = this;
    if (dateTime != null) {
      return DateFormat(format).format(dateTime.toLocal());
    } else {
      return "";
    }
  }

  Duration? getDifferenceInDuration() {
    DateTime? dateTime = this;
    if (dateTime != null) {
      return DateTime.now().difference(dateTime.toLocal());
    } else {
      return Duration.zero;
    }
  }
}

extension IntExtension on int? {
  String formatUserCount() {
    int count = this ?? 0;
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    } else {
      return count.toString();
    }
  }
}
